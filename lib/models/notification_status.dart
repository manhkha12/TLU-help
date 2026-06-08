import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationStatus {
  @JsonValue('PUBLISHED')
  published,
  @JsonValue('DRAFT')
  draft,
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue('UNKNOWN')
  unknown,
}
