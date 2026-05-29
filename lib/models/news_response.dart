import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/news_model.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
class NewsResponse with _$NewsResponse {
  factory NewsResponse({
    required int statusCode,
    required String message,
    required NewsData data,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@freezed
class NewsData with _$NewsData {
  factory NewsData({
    required List<NewsModel> data,
    required int total,
    int? page,
    int? limit,
    int? skip,
    int? take,
  }) = _NewsData;

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);
}
