import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/home_page/news_cubit/news_state.dart';
import 'package:tlu_students/repository/news_repository.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit(this.newsRepository) : super(const NewsState.initial());

  Future<void> getNews({int page = 1, int limit = 10}) async {
    print("🏠 [NewsCubit] Calling getNews...");
    emit(const NewsState.loading());
    try {
      final response = await newsRepository.getNews(page: page, limit: limit);
      print("🏠 [NewsCubit] Success! Received ${response.data.length} news items");
      emit(NewsState.loaded(response.data));
    } catch (e) {
      print("🏠 [NewsCubit] Error in getNews: $e");
      emit(NewsState.error(e.toString()));
    }
  }
}
