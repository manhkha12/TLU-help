import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/shared/widgets/bottom_navigation/custom_bottom_navigation.dart';
import 'package:tlu_students/shared/widgets/custom_app_bar.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_cubit.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_state.dart';
import 'package:tlu_students/features/profile/cubit/profile_cubit.dart';
import 'package:tlu_students/features/profile/cubit/profile_state.dart';

class CheckinScreen extends StatefulWidget {
  const CheckinScreen({super.key});

  @override
  State<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen>
    with BottomNavigationMixin {
  CameraController? _controller;
  String _status = 'checkin.checking_permissions'.tr();
  bool _isPermissionGranted = false;
  bool _isCameraReady = false;

  // Thêm biến kiểm soát luồng quét khuôn mặt (Throttling)
  bool _isProcessingFrame = false;
  DateTime _lastFrameTime = DateTime.now();

  // CheckinScreen là tab thứ 2 (index = 1) trong BottomNavigation
  @override
  int get tabIndex => 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cubit = context.read<CheckInCubit>();
      await cubit.fetchActiveSession();
      final cameraGranted = await Permission.camera.isGranted;
      final locationGranted = await Permission.location.isGranted;
      if (cameraGranted && locationGranted) {
        if (mounted) {
          setState(() {
            _isPermissionGranted = true;
          });
        }
        cubit.checkGPS();
      }
    });
  }

  @override
  void onChangedTab() {
    super.onChangedTab();
    if (isFocused) {
      // Khi chuyển vào tab này → bật camera
      _startCamera();
      final cubit = context.read<CheckInCubit>();
      cubit.fetchActiveSession().then((_) {
        if (_isPermissionGranted) {
          cubit.checkGPS();
        }
      });
    } else {
      // Khi rời tab này → tắt camera để tiết kiệm tài nguyên
      _stopCamera();
    }
  }

  /// Khởi tạo camera chỉ khi tab được chọn
  Future<void> _startCamera() async {
    if (!_isPermissionGranted) {
      await _requestPermissions();
    }
    if (_isPermissionGranted && !_isCameraReady) {
      await _initializeCamera();
    }
  }

  /// Tắt camera khi rời tab
  void _stopCamera() {
    if (_controller != null) {
      // Dừng quét hình ảnh trước khi dispose để tránh rò rỉ bộ nhớ
      if (_controller!.value.isStreamingImages) {
        _controller!.stopImageStream();
      }
      _controller!.dispose();
      _controller = null;
      if (mounted) {
        setState(() => _isCameraReady = false);
      }
    }
  }

  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
    ].request();

    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.location]!.isGranted) {
      if (!mounted) return;
      setState(() {
        _isPermissionGranted = true;
        _status = 'checkin.initializing_camera'.tr();
      });
      _startCamera();
      context.read<CheckInCubit>().checkGPS();
    } else {
      if (!mounted) return;
      setState(() => _status = 'checkin.permission_required'.tr());
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    // Ưu tiên camera trước (front)
    final frontCam = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    _controller = CameraController(
      frontCam,
      ResolutionPreset
          .medium, // TỐI ƯU 1: Giảm xuống Medium để nhẹ RAM/CPU khi chạy AI
      enableAudio: false,
    );

    try {
      await _controller!.initialize();
      if (!mounted) return;
      setState(() => _isCameraReady = true);

      // TỐI ƯU 2: Bắt đầu luồng quét camera với cơ chế giảm tải
      // _startFaceDetection(); // Tạm tắt vì chưa có logic ML Kit để tránh lag và hao pin
    } catch (e) {
      if (!mounted) return;
      setState(() => _status = 'checkin.init_error'.tr(args: [e.toString()]));
    }
  }

  void _startFaceDetection() {
    if (_controller == null || !_controller!.value.isInitialized) return;

    _controller!.startImageStream((CameraImage image) async {
      // TỐI ƯU 3: Giới hạn chỉ xử lý ~2 frame mỗi giây (cách nhau >= 500ms)
      final currentTime = DateTime.now();
      if (currentTime.difference(_lastFrameTime).inMilliseconds < 500) {
        return;
      }

      // TỐI ƯU 4: Đảm bảo frame trước đã xử lý xong mới nhận frame mới
      if (_isProcessingFrame) return;
      _isProcessingFrame = true;
      _lastFrameTime = currentTime;

      try {
        // TODO: Dùng ML Kit FaceDetector ở đây để làm ĐIỀU KIỆN RÀNG BUỘC (nếu cần sau này)
        // Ví dụ: Bắt buộc phải có đúng 1 khuôn mặt trong khung hình, mặt phải quay thẳng.
        // Nếu thỏa mãn -> setState một biến bool `_isValidFace = true` để mở khóa nút chụp.
        // Không dùng để Auto-capture nữa, người dùng sẽ tự bấm chụp.
      } catch (e) {
        debugPrint("Lỗi xử lý frame: $e");
      } finally {
        if (mounted) {
          _isProcessingFrame = false; // Mở khóa cho phép xử lý frame tiếp theo
        }
      }
    });
  }

  // GPS checking is now handled by CheckInCubit

  Future<void> _handleCheckin() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    final cubit = context.read<CheckInCubit>();
    try {
      cubit.updateCheckinStatus('checkin.capturing_image');

      // 1. CHỤP ẢNH (Manual Capture)
      final XFile imageFile = await _controller!.takePicture();
      cubit.updateCheckinData(filePath: imageFile.path);

      cubit.updateCheckinStatus('checkin.getting_gps');

      // 2. LẤY TỌA ĐỘ
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      cubit.updateCheckinData(latitude: pos.latitude, longitude: pos.longitude);

      // 3. GỬI ẢNH VÀ TỌA ĐỘ LÊN SERVER QUA HTTP
      await cubit.attendByFace();
    } catch (e) {
      debugPrint("Lỗi khi điểm danh: $e");
      String errorMessage = 'Lỗi điểm danh: $e';
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMessage = data['message'].toString();
        }
      }
      cubit.emitCheckinError(errorMessage);
    }
  }

  void _showResultDialog(bool success, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: success
            ? null
            : Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'checkin.failed_dialog_title'.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
        content: success
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green.shade600,
                    size: 80,
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<CheckInCubit>().clearCheckinStatus();
              if (success) {
                // Refresh session state to show updated state
                context.read<CheckInCubit>().fetchActiveSession();
                context.read<CheckInCubit>().checkGPS();
              }
            },
            child: Text('checkin.close'.tr()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Nền tối cho chuyên nghiệp
      appBar: CustomAppBar(
        title: 'checkin.title'.tr(),
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<CheckInCubit, CheckInState>(
        listenWhen: (previous, current) =>
            previous.checkinSuccess != current.checkinSuccess &&
            current.checkinSuccess != null,
        listener: (context, state) {
          _showResultDialog(state.checkinSuccess!, state.checkinMessage ?? '');
        },
        child: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) {
            final activeSession = state.activeSession;
            final courseClass = activeSession?.courseClass;
            final subject = courseClass?.subject;

            final isOccurring = state.isOccurring;
            final isAllowed = state.isAllowed;

            final currentStatus = state.checkinStatus != null
                ? state.checkinStatus!.tr()
                : ((!_isPermissionGranted || !_isCameraReady)
                    ? _status
                    : state.locationStatusText);

            final isLocationOk = state.isLocationOk;
            final isSubmitting = state.checkinStatus != null;

            return Column(
              children: [
                SizedBox(height: context.height * 0.04),
                // Khu vực hiển thị khuôn mặt
                Center(
                  child: Builder(
                    builder: (context) {
                      final cameraSize = (context.height * 0.32).clamp(180.0, 285.0);
                      return Container(
                        width: cameraSize, // Lớn hơn khung camera một chút để làm viền
                        height: cameraSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              context.colors.tluBlueColor.withOpacity(0.55),
                              context.colors.tluRedColor.withOpacity(0.95),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: cameraSize - 5, // Khung camera thực tế
                            height: cameraSize - 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // Màu nền chờ
                            ),
                            child: ClipOval(
                              child: _isCameraReady
                                  ? AspectRatio(
                                      aspectRatio: 1,
                                      child: CameraPreview(_controller!),
                                    )
                                  : Container(
                                      color: Colors.grey[800],
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),

                SizedBox(height: context.height * 0.025),

                // Panel thông tin bên dưới
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, context.height * 0.03, 20, context.height * 0.02),
                    decoration: BoxDecoration(
                      // 1. TRẮNG: Nền trắng sứ cực sạch sẽ và sang trọng
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(35)),
                      boxShadow: [
                        BoxShadow(
                          color: context.colors.tluBlueColor.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, -5),
                        )
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  if (!isOccurring) ...[
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: context.colors.tluRedColor.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: context.colors.tluRedColor.withOpacity(0.2)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.event_busy_rounded, color: context.colors.tluRedColor, size: 28),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  'checkin.no_class_scheduled'.tr(),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: context.colors.tluRedColor,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                AppText(
                                                  'Vui lòng kiểm tra lại thời khóa biểu học tập.',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: context.colors.black.withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ] else ...[
                                    BoxView(
                                      title: subject?.subjectName ?? "N/A",
                                      icon: Assets.icons.buc.svg(
                                          colorFilter: ColorFilter.mode(
                                              context.colors.tluRedColor, BlendMode.srcIn)),
                                      onTap: () {},
                                      description:
                                          "Room ${courseClass?.room ?? "N/A"}, ${courseClass?.lessonSlot ?? ""}\nLecturer: ${courseClass?.lecturer.fullName ?? "N/A"}",
                                      color: context.colors.tluRedColor.withOpacity(0.1),
                                    ),
                                  ],
                                  if (isOccurring) ...[
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: isAllowed
                                            ? (state.timingStatusText == 'checkin.on_time'.tr()
                                                ? Colors.green.withOpacity(0.1)
                                                : Colors.orange.withOpacity(0.1))
                                            : context.colors.tluRedColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isAllowed
                                              ? (state.timingStatusText == 'checkin.on_time'.tr()
                                                  ? Colors.green
                                                  : Colors.orange)
                                              : context.colors.tluRedColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            isAllowed
                                                ? (state.timingStatusText == 'checkin.on_time'.tr()
                                                    ? Icons.check_circle_outline
                                                    : Icons.watch_later_outlined)
                                                : Icons.error_outline,
                                            size: 16,
                                            color: isAllowed
                                                ? (state.timingStatusText == 'checkin.on_time'.tr()
                                                    ? Colors.green
                                                    : Colors.orange)
                                                : context.colors.tluRedColor,
                                          ),
                                          const SizedBox(width: 6),
                                          AppText(
                                            state.timingStatusText,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: isAllowed
                                                  ? (state.timingStatusText == 'checkin.on_time'.tr()
                                                      ? Colors.green
                                                      : Colors.orange)
                                                  : context.colors.tluRedColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  const Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(context.height * 0.015),
                                    decoration: BoxDecoration(
                                      color: isLocationOk || isSubmitting
                                          ? context.colors.tluBlueColor.withOpacity(0.05)
                                          : context.colors.tluRedColor.withOpacity(0.05),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isSubmitting
                                          ? Icons.hourglass_empty
                                          : (isLocationOk ? Icons.location_on : Icons.location_off),
                                      color: isLocationOk || isSubmitting
                                          ? context.colors.tluBlueColor
                                          : context.colors.tluRedColor,
                                      size: context.height * 0.055,
                                    ),
                                  ),
                                  SizedBox(height: context.height * 0.012),
                                  Text(
                                    currentStatus,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isLocationOk || isSubmitting
                                          ? context.colors.tluBlueColor
                                          : context.colors.tluRedColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    height: context.height * 0.065,
                                    child: ElevatedButton.icon(
                                      onPressed: _isCameraReady &&
                                              state.isLocationOk &&
                                              activeSession != null &&
                                              state.isAllowed &&
                                              state.checkinStatus == null
                                          ? _handleCheckin
                                          : null,
                                      icon: const Icon(Icons.face_retouching_natural,
                                          color: Colors.white),
                                      label: Text(
                                        'checkin.confirm_button'.tr(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.1),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            context.colors.tluBlueColor, // Xanh TLU chủ đạo
                                        foregroundColor: Colors.white,
                                        disabledBackgroundColor: Colors.grey[300],
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.height * 0.015),
                                  BlocBuilder<ProfileCubit, ProfileState>(
                                    builder: (context, profileState) {
                                      final studentCode =
                                          profileState.student?.studentCode ?? "N/A";
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: context.colors.tluRedColor,
                                                  shape: BoxShape.circle)),
                                          const SizedBox(width: 8),
                                          AppText(
                                            'checkin.student_id_prefix'
                                                .tr(args: [studentCode]),
                                            style: TextStyle(
                                                color: context.colors.tluBlueColor
                                                    .withOpacity(0.7),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Widget _buildStats(BuildContext context, StudenStats stats) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: context.colors.primaryBackground,
  //       borderRadius: BorderRadius.circular(15),
  //       border: Border.all(color: context.colors.divider),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             _statItem(context, "Present", stats.present.toInt().toString(),
  //                 Colors.green),
  //             _statItem(context, "Late", stats.late.toInt().toString(),
  //                 Colors.orange),
  //             _statItem(context, "Absent", stats.absent.toInt().toString(),
  //                 Colors.red),
  //             _statItem(context, "Rate", "${stats.attendanceRate}%",
  //                 context.colors.tluBlueColor),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _statItem(
      BuildContext context, String label, String value, Color color) {
    return Column(
      children: [
        AppText(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        AppText(
          label,
          fontSize: 12,
          color: context.colors.black.withOpacity(0.6),
        ),
      ],
    );
  }

  // Timing check is now handled by CheckInCubit
}

class BoxView extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final VoidCallback onTap;
  final String description;
  final Color color;
  const BoxView(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.description,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: context.colors.primaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.divider, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: icon,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AppText(title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: context.colors.black)),
                ),
                const SizedBox(height: 4),
                AppText(
                  description,
                  fontSize: 12,
                  color: context.colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
