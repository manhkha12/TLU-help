import 'package:tlu_students/data/remote/handler/api_handler.dart';

class NewsApi {
  final ApiHandler _apiHandler;

  NewsApi(this._apiHandler);

  Future<Map<String, dynamic>> getNews({int page = 1, int limit = 20}) async {
    final resp = await _apiHandler.get(
      '/posts/global',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );
    return resp;
  }

  Future<Map<String, dynamic>> getClassNews(String classId, {int skip = 0, int take = 20}) async {
    final resp = await _apiHandler.get(
      '/posts/class/$classId',
      queryParameters: {
        'skip': skip,
        'take': take,
      },
    );
    return resp;
  }

  Future<Map<String, dynamic>> getNewsDetail(String id) async {
    final resp = await _apiHandler.get('/posts/$id');
    return resp;
  }
}
