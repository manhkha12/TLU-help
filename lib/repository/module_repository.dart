import 'package:flutter/widgets.dart';
import 'package:tlu_students/data/local/app_provider.dart';
import 'package:tlu_students/data/remote/module_api.dart';
import 'package:tlu_students/models/course_response.dart';
import 'package:tlu_students/models/grade_item.dart';
import 'package:tlu_students/models/notification_model.dart';
import 'package:tlu_students/models/notification_response.dart';
import 'package:tlu_students/models/semester.dart';
import 'package:tlu_students/models/semester_result.dart';
import 'package:tlu_students/models/document_type.dart';
import 'package:tlu_students/models/service_request.dart';
import 'package:tlu_students/models/chat_session.dart';
import 'package:tlu_students/models/chat_message.dart';
import 'package:tlu_students/models/chat_send_response.dart';
import 'package:tlu_students/models/tuition_fee.dart';
import 'package:tlu_students/models/tuition_detail.dart';
import 'package:tlu_students/models/attendance_session.dart';


class ModuleRespository {
  final ModuleApi moduleApi;
  final AppProvider appProvider;

  ModuleRespository(
    this.moduleApi,
    this.appProvider,
  );

  Future<List<GradeItem>> getGrade() async {
    try {
      print("🚀 [Repo] Fetching Grades...");
      final resp = await moduleApi.getGrade();
      // Log độ dài danh sách thay vì in toàn bộ JSON sẽ đỡ rối mắt hơn
      final List<dynamic> data = resp as List;
      print("✅ [Repo] Received ${data.length} grade items");

      return data.map((e) => GradeItem.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getGrade Error: $e");
      rethrow;
    }
  }

  Future<List<SemesterResult>> getGpa() async {
    try {
      print("🚀 [Repo] Fetching GPA...");
      final resp = await moduleApi.getGpa();
      final List<dynamic> data = resp as List;
      print("✅ [Repo] Received ${data.length} semester results");

      return data.map((e) => SemesterResult.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getGpa Error: $e");
      rethrow;
    }
  }

  Future<List<Semester>> getSemester() async {
    try {
      print("🚀 [Repo] Fetching Semesters...");
      final resp = await moduleApi.getSemester();

      print("✅ [Repo] Received ${resp.length} semesters");

      return resp.map((e) => Semester.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getSemester Error: $e");
      rethrow;
    }
  }

  Future<List<CourseData>> getCourse(String? semesterId) async {
    try {
      print("🚀 [Repo] Fetching Courses for Semester ID: $semesterId...");
      final resp = await moduleApi.getCourse(semesterId);
      print(resp);
      print(
          "✅ [Repo] Received ${resp.length} courses for semester $semesterId");

      return resp.map((e) => CourseData.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getCourse Error for Semester ID $semesterId: $e");
      rethrow;
    }
  }

  Future<NotificationResponse> getNotification(
      {int skip = 0, int take = 20, bool? isRead}) async {
    try {
      print("🚀 [Repo] Fetching Notifications...");
      final resp = await moduleApi.getNotification(
          skip: skip, take: take, isRead: isRead);
      print("✅ [Repo] Received notifications data");

      return NotificationResponse.fromJson(resp);
    } catch (e) {
      print("❌ [Repo] getNotification Error: $e");
      rethrow;
    }
  }

  Future<NotificationModel> getDetailNotification(String notificationId) async {
    try {
      print(
          "🚀 [Repo] Fetching Detail for Notification ID: $notificationId...");
      final resp = await moduleApi.getDetailNotification(notificationId);
      print("✅ [Repo] Received detail for notification ID $notificationId");

      return NotificationModel.fromJson(resp);
    } catch (e) {
      print("❌ [Repo] getDetailNotification Error for ID $notificationId: $e");
      rethrow;
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      print("🚀 [Repo] Marking Notification ID $notificationId as read...");
      await moduleApi.markAsRead(notificationId);
      print("✅ [Repo] Successfully marked notification as read.");
    } catch (e) {
      print("❌ [Repo] markAsRead Error for ID $notificationId: $e");
      rethrow;
    }
  }

  Future<void> markAllAsRead() async {
    try {
      print("🚀 [Repo] Marking all notifications as read...");
      await moduleApi.markAllAsRead();
      print("✅ [Repo] Successfully marked all notifications as read.");
    } catch (e) {
      print("❌ [Repo] markAllAsRead Error: $e");
      rethrow;
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      print("🚀 [Repo] Deleting Notification ID $notificationId...");
      await moduleApi.deleteNotification(notificationId);
      print("✅ [Repo] Successfully deleted notification.");
    } catch (e) {
      print("❌ [Repo] deleteNotification Error for ID $notificationId: $e");
      rethrow;
    }
  }

  Future<void> registerFcmToken(
      String token, String deviceName, String platform) async {
    try {
      print("🚀 [Repo] Registering FCM Token...");
      await moduleApi.registerFcmToken(token, deviceName, platform);
      print("✅ [Repo] Successfully registered FCM Token.");
    } catch (e) {
      print("❌ [Repo] registerFcmToken Error: $e");
      rethrow;
    }
  }

  Future<void> unregisterFcmToken(String token) async {
    try {
      print("🚀 [Repo] Unregistering FCM Token...");
      await moduleApi.unregisterFcmToken(token);
      print("✅ [Repo] Successfully unregistered FCM Token.");
    } catch (e) {
      print("❌ [Repo] unregisterFcmToken Error: $e");
      rethrow;
    }
  }

  Future<List<DocumentType>> getDocumentTypes() async {
    try {
      print("🚀 [Repo] Fetching Document Types...");
      final resp = await moduleApi.getDocumentTypes();
      final List<dynamic> data = resp['data'];
      print("✅ [Repo] Received ${data.length} document types");
      
      return data.map((e) => DocumentType.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getDocumentTypes Error: $e");
      rethrow;
    }
  }


  Future<List<ServiceRequest>> getServiceRequests() async {
    try {
      print("🚀 [Repo] Fetching Service Requests...");
      final resp = await moduleApi.getServiceRequests();
      // Với ApiHandlerImpl, resp đã là resp.data['data']
      // Truy cập tiếp vào trường 'data' bên trong chứa list
      final List<dynamic> data = resp['data'] as List;
      print("✅ [Repo] Received ${data.length} service requests");
      
      return data.map((e) => ServiceRequest.fromJsonCustom(e)).toList();
    } catch (e) {
      print("❌ [Repo] getServiceRequests Error: $e");
      rethrow;
    }
  }


  Future<ServiceRequest> createServiceRequest(
      dynamic documentTypeId, String? reason, String? attachmentUrl) async {
    try {
      print("🚀 [Repo] Creating Service Request...");
      final data = {
        'document_type_id': documentTypeId,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
        if (attachmentUrl != null) 'attachment_url': attachmentUrl,
      };
      final resp = await moduleApi.createServiceRequest(data);
      print("✅ [Repo] Successfully created service request.");

      return ServiceRequest.fromJsonCustom(resp['data']);
    } catch (e) {
      print("❌ [Repo] createServiceRequest Error: $e");
      rethrow;
    }
  }

  Future<ServiceRequest> updateServiceRequest(
      dynamic id, dynamic documentTypeId, String? reason, String? attachmentUrl) async {
    try {
      print("🚀 [Repo] Updating Service Request ID $id...");
      final data = {
        'document_type_id': documentTypeId,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
        if (attachmentUrl != null) 'attachment_url': attachmentUrl,
      };
      final resp = await moduleApi.updateServiceRequest(id, data);
      print("✅ [Repo] Successfully updated service request.");

      return ServiceRequest.fromJsonCustom(resp['data']);
    } catch (e) {
      print("❌ [Repo] updateServiceRequest Error for ID $id: $e");
      rethrow;
    }
  }

  Future<void> deleteServiceRequest(dynamic id) async {
    try {
      print("🚀 [Repo] Deleting Service Request ID $id...");
      await moduleApi.deleteServiceRequest(id);
      print("✅ [Repo] Successfully deleted service request.");
    } catch (e) {
      print("❌ [Repo] deleteServiceRequest Error for ID $id: $e");
      rethrow;
    }
  }

  // --- CHAT AI METHODS ---

  Future<ChatSendResponse> sendChatMessage(String message, {String? sessionId}) async {
    try {
      print("🚀 [Repo] Sending Chat Message...");
      final resp = await moduleApi.sendChatMessage(message, sessionId: sessionId);
      print("✅ [Repo] Received chat response");
      return ChatSendResponse.fromJson(resp);
    } catch (e) {
      print("❌ [Repo] sendChatMessage Error: $e");
      rethrow;
    }
  }

  Future<ChatSession> createChatSession() async {
    try {
      print("🚀 [Repo] Creating Chat Session...");
      final resp = await moduleApi.createChatSession();
      print("✅ [Repo] Successfully created chat session.");
      return ChatSession.fromJson(resp);
    } catch (e) {
      print("❌ [Repo] createChatSession Error: $e");
      rethrow;
    }
  }

  Future<List<ChatSession>> getChatSessions() async {
    try {
      print("🚀 [Repo] Fetching Chat Sessions...");
      final resp = await moduleApi.getChatSessions();
      final List<dynamic> data = resp as List;
      print("✅ [Repo] Received ${data.length} chat sessions");
      return data.map((e) => ChatSession.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getChatSessions Error: $e");
      rethrow;
    }
  }

  Future<List<ChatMessage>> getChatMessages(String sessionId) async {
    try {
      print("🚀 [Repo] Fetching Chat Messages for Session ID: $sessionId...");
      final resp = await moduleApi.getChatMessages(sessionId);
      final List<dynamic> data = resp as List;
      print("✅ [Repo] Received ${data.length} chat messages");
      return data.map((e) => ChatMessage.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getChatMessages Error for ID $sessionId: $e");
      rethrow;
    }
  }

  Future<void> deleteChatSession(String sessionId) async {
    try {
      print("🚀 [Repo] Deleting Chat Session ID $sessionId...");
      await moduleApi.deleteChatSession(sessionId);
      print("✅ [Repo] Successfully deleted chat session.");
    } catch (e) {
      print("❌ [Repo] deleteChatSession Error for ID $sessionId: $e");
      rethrow;
    }
  }

  // --- TUITION METHODS ---

  Future<List<TuitionFee>> getTuitionFees() async {
    try {
      print("🚀 [Repo] Fetching Tuition Fees...");
      final resp = await moduleApi.getTuitionFees();
      final List<dynamic> data = resp;
      print("✅ [Repo] Received ${data.length} tuition fee items");

      return data.map((e) => TuitionFee.fromJson(e)).toList();
    } catch (e) {
      print("❌ [Repo] getTuitionFees Error: $e");
      rethrow;
    }
  }

  Future<TuitionDetail> getTuitionDetail(String semesterId) async {
    try {
      print("🚀 [Repo] Fetching Tuition Detail for Semester ID: $semesterId...");
      final resp = await moduleApi.getTuitionDetail(semesterId);
      print("✅ [Repo] Received tuition detail for semester $semesterId");

      return TuitionDetail.fromJson(resp);
    } catch (e) {
      print("❌ [Repo] getTuitionDetail Error for ID $semesterId: $e");
      rethrow;
    }
  }

  Future<String> payTuition(String tuitionFeeId) async {
    try {
      print("🚀 [Repo] Initiating Payment for Tuition Fee ID: $tuitionFeeId...");
      final resp = await moduleApi.payTuition(tuitionFeeId);
      print("✅ [Repo] Received payment URL");

      return resp['paymentUrl'] as String;
    } catch (e) {
      print("❌ [Repo] payTuition Error for ID $tuitionFeeId: $e");
      rethrow;
    }
  }

  Future<AttendanceSession?> getActiveAttendanceSession() async {
    try {
      print("🚀 [Repo] Fetching Active Attendance Session...");
      final resp = await moduleApi.getAttendanceSession();
      if (resp != null) {
        print("✅ [Repo] Received active attendance session");
        return AttendanceSession.fromJson(resp);
      }
      return null;
    } catch (e) {
      print("❌ [Repo] getActiveAttendanceSession Error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>> attendByFace({
    required String sessionId,
    required Map<String, dynamic> params,
  }) async {
    try {
      print("🚀 [Repo] Sending Face Attendance for Session $sessionId with params $params...");
      final resp = await moduleApi.attendByFace(
        sessionId: sessionId,
        params: params,
      );
      print("✅ [Repo] Attendance response: $resp");
      return resp;
    } catch (e) {
      print("❌ [Repo] attendByFace Error: $e");
      rethrow;
    }
  }
}
