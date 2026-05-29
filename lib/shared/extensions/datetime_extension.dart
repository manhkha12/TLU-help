import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }

  DateTime get normalizeDate => DateTime(year, month, day);

  String get dayAgo {
    final now = DateTime.now().normalizeDate;
    if (now.difference(this).inDays == 0) {
      return 'Hôm nay';
    }
    if (now.difference(this).inDays.abs() == 1) {
      return 'Hôm qua';
    }
    return format('dd/MM/yyyy');
  }

  String get time12hFormat {
    return DateFormat('HH:mm:ss').format(this);
  }

  String get minAgo {
    final now = DateTime.now();
    final diffMins = now.difference(this).inMinutes.abs();
    final diffHours = now.difference(this).inHours.abs();
    if (diffHours > 8) {
      return format('HH:mm');
    }
    if (diffHours > 0) {
      return '$diffHours giờ trước';
    }
    if (diffMins == 0) {
      return 'Vừa xong';
    }
    return '$diffMins phút trước';
  }

  String get greetingKey {
    if (hour <= 12) {
      return 'home.greeting.morning';
    }
    if (hour > 12 && hour <= 18) {
      return 'home.greeting.afternoon';
    }
    return 'home.greeting.evening';
  }

  // TM_WEEKDAY 0=Sunday, ..., 6=Saturday
  int get convertToTmWday {
    return weekday % 7;
  }
}

extension StringTimeExt on String {
  // Hàm bổ trợ để định dạng giờ từ chuỗi "HH:mm" sang 24h format (HH:mm)
  String to24hFormat() {
    try {
      final parts = split(':');
      if (parts.length < 2) return this;

      final hour = int.parse(parts[0]).toString().padLeft(2, '0');
      final minute = parts[1].trim().padLeft(2, '0');

      return '$hour:$minute';
    } catch (e) {
      return this;
    }
  }

  // Tách lessonSlot "7:00-9:00" thành map chứa startTime và endTime đã format
  Map<String, String> get splitSlot {
    final parts = split('-');
    if (parts.length < 2) return {'start': '--:--', 'end': '--:--'};
    return {
      'start': parts[0].trim().to24hFormat(),
      'end': parts[1].trim().to24hFormat(),
    };
  }
}
