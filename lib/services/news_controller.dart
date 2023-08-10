import 'package:news_application/models/news.dart';

import '../packages_export.dart';

class NewsController {
  final dio = Dio();

  final List<News> appNews = [];

  Future<List<News>> fetchData(String relatedTo) async {
    final response = await dio.get(relatedTo == 'All'
        ? 'https://newsapi.org/v2/everything?q=is&apiKey=APIKey&language=en'
        : 'https://newsapi.org/v2/everything?q=${relatedTo.toLowerCase()}&apiKey=APIKey&language=en');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['articles'];
      for (var element in data) {
        appNews.add(News.fromJson(element));
      }
      return appNews;
    } else {
      debugPrint('error');
      throw Exception('Failed to load data from the API');
    }
  }
}
