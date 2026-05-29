import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/profile/cubit/profile_cubit.dart';
import 'package:tlu_students/features/profile/cubit/profile_state.dart';
import 'package:tlu_students/models/student.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileCubit profileCubit;
  @override
  void initState() {
    super.initState();
    profileCubit = context.read<ProfileCubit>();
    profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new, color: context.colors.black, size: 20),
        ),
        title: Text(
          'profile.title'.tr(),
          style:
              TextStyle(color: context.colors.black, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.settings_outlined, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final student = state.student;
        if (student == null) {
          return Center(child: Text('home.header.no_student_data'.tr()));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              // Section 1: Header (Avatar & Name)
              _buildHeader(student),

              // Section 2: Personal Information
              _buildSectionTitle('PERSONAL INFORMATION'),
              _buildInfoTile(
                icon: Icons.email_outlined,
                title: 'Email',
                subtitle: student.email,
                iconColor: context.colors.tluBlueColor,
                iconBg: const Color(0xFFE3F2FD),
              ),
              Divider(height: 1, color: context.colors.divider),
              _buildInfoTile(
                icon: Icons.phone_outlined,
                title: 'Phone',
                subtitle: student.phoneNumber,
                iconColor: context.colors.tluBlueColor,
                iconBg: const Color(0xFFE3F2FD),
              ),

              // Section 3: Academic Records
              _buildSectionTitle('ACADEMIC RECORDS'),
              _buildInfoTile(
                icon: Icons.bar_chart_rounded,
                title: 'Cumulative GPA',
                subtitle: '${student.gpa ?? 'N/A'} / 10.0',
                iconColor: context.colors.tluBlueColor,
                iconBg: const Color(0xFFE3F2FD),
              ),
              Divider(height: 1, color: context.colors.divider),
              _buildInfoTile(
                icon: Icons.verified_outlined,
                title: 'Address',
                subtitle: student.address,
                iconColor: context.colors.tluBlueColor,
                iconBg: const Color(0xFFE3F2FD),
              ),

              // Section 4: Account Settings
              _buildSectionTitle('ACCOUNT SETTINGS'),
              _buildInfoTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                iconColor: context.colors.tluBlueColor,
                iconBg: const Color(0xFFE3F2FD),
              ),
              Divider(height: 1, color: context.colors.divider),
              // _buildInfoTile(
              //   icon: Icons.notifications_none_outlined,
              //   title: 'Notifications',
              //   iconColor: context.colors.tluBlueColor,
              //   iconBg: const Color(0xFFE3F2FD),
              // ),
              _buildInfoTile(
                icon: Icons.logout,
                title: 'common.logout'.tr(),
                iconColor: context.colors.tluRedColor,
                iconBg: const Color(0xFFFFEBEE),
                isDestructive: true,
                onTap: () => _showLogoutDialog(context),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(Student student) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.colors.tluBlueColor,
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.camera_alt, color: Colors.white, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            student.fullName, // "Trần Văn Anh"
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            student.departmentName, // "Khoa CNTT"
            style: TextStyle(
                color: context.colors.tluBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Text(
            '${'login.student_id'.tr()}: ${student.studentCode} • ${student.className}',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 18, color: Colors.white),
            label: Text('profile.edit_info'.tr(),
                style: const TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.tluBlueColor,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required Color iconColor,
    required Color iconBg,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDestructive ? context.colors.tluRedColor : Colors.black87,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        onTap: onTap,
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(Icons.logout_rounded, color: context.colors.tluRedColor),
            SizedBox(width: 12),
            Text('common.logout'.tr()),
          ],
        ),
        content: Text(
          'profile.logout_confirm'.tr(),
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'common.cancel'.tr(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AppCubit>().logout();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.tluRedColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
            child: Text(
              'common.logout'.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
    },
  );
}
