import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/news_model.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded(List<NewsModel> news) = _Loaded;
  const factory NewsState.error(String message) = _Error;
}
