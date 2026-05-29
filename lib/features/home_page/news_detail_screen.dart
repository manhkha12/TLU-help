import 'package:flutter/material.dart';
import 'package:tlu_students/models/news_model.dart';
import 'package:tlu_students/repository/news_repository.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';

class NewsDetailScreen extends StatefulWidget {
  final String newsId;
  final NewsModel? initialNews;

  const NewsDetailScreen({
    super.key,
    required this.newsId,
    this.initialNews,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late Future<NewsModel> _newsFuture;

  @override
  void initState() {
    super.initState();
    if (widget.initialNews != null) {
      _newsFuture = Future.value(widget.initialNews!);
    } else {
      _newsFuture = GetIt.I<NewsRepository>().getNewsDetail(widget.newsId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: AppText(
            'Chi tiết tin tức',
            style: TextStyle(
              color: context.colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: FutureBuilder<NewsModel>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: AppText('Lỗi khi tải tin tức: ${snapshot.error}'));
          }
          final news = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header tác giả
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          news.author?.avatarUrl ??
                              'https://ui-avatars.com/api/?name=${news.author?.username ?? 'Admin'}&background=random',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            news.author?.username ?? 'Admin',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          AppText(
                            DateFormat('dd MMMM, yyyy ' 'at' ' HH:mm').format(news.publishedAt),
                            style: const TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Tiêu đề
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppText(
                    news.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Nội dung text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppText(
                    news.content,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Hình ảnh
                if (news.media.isNotEmpty)
                  ...news.media.map((m) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Image.network(
                          m.fileUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      )),
                
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
