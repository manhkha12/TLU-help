import 'package:tlu_students/data/remote/news_api.dart';
import 'package:tlu_students/models/news_model.dart';
import 'package:tlu_students/models/news_response.dart';

class NewsRepository {
  final NewsApi newsApi;

  NewsRepository(this.newsApi);

  Future<NewsData> getNews({int page = 1, int limit = 20}) async {
    try {
      print(
          "🚀 [NewsRepo] Fetching Global News (page: $page, limit: $limit)...");
      final response = await newsApi.getNews(page: page, limit: limit);
      print(
          "✅ [NewsRepo] Response received: ${response.toString().substring(0, response.toString().length > 200 ? 200 : response.toString().length)}...");
      return NewsResponse.fromJson(response).data;
    } catch (e) {
      print("❌ [NewsRepo] getNews Error: $e");
      rethrow;
    }
  }

  Future<NewsData> getClassNews(String classId,
      {int skip = 0, int take = 20}) async {
    try {
      print("🚀 [NewsRepo] Fetching Class News (classId: $classId)...");
      final response =
          await newsApi.getClassNews(classId, skip: skip, take: take);
      print(
          "✅ [NewsRepo] Response received: ${response.toString().substring(0, response.toString().length > 200 ? 200 : response.toString().length)}...");
      return NewsResponse.fromJson(response).data;
    } catch (e) {
      print("❌ [NewsRepo] getClassNews Error: $e");
      rethrow;
    }
  }

  Future<NewsModel> getNewsDetail(String id) async {
    try {
      print("🚀 [NewsRepo] Fetching News Detail (id: $id)...");
      final response = await newsApi.getNewsDetail(id);
      // Giả sử API trả về trực tiếp object news trong field 'data' mà handler đã unwrap 1 lớp
      // hoặc trả về trực tiếp object nếu handler unwrap sâu hơn.
      // Dựa trên cách sửa trước đó, NewsResponse.fromJson(response).data sẽ trả về NewsData
      // Nhưng chi tiết thường trả về 1 object duy nhất.
      // Nếu API trả về { statusCode: 200, data: { ...news } }, handler trả về { statusCode: 200, data: { ... } }
      // Ta cần parse tùy theo cấu trúc thực tế. Thông thường là:
      return NewsModel.fromJson(response['data'] ?? response);
    } catch (e) {
      print("❌ [NewsRepo] getNewsDetail Error: $e");
      rethrow;
    }
  }
}
