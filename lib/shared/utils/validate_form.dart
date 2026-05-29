

import 'package:tlu_students/features/localization/localizations.dart';

class Validation {
  Validation();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'validate.incorrect_email'.tr();
    }

    return null;
  }

  static String? validateStudentId(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
      return 'validate.student_id_uppercase'.tr();
    }
    return null;
  }

  static String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.length < 6) {
      return 'validate.incorrect_pass.password_character'.tr();
    }
    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.isNotEmpty && value.length < 3) {
      return 'validate.incorrect_username'.tr();
    }
    return null;
  }
}
