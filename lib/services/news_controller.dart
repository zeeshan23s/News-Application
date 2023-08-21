import '../packages_export.dart';

class NewsController {
  static Future<List<News>> fetchData(String relatedTo) async {
    Dio dio = Dio();
    List<News> appNews = [];

    final response =
        await dio.get('https://newsapi.org/v2/everything', queryParameters: {
      'q': relatedTo.toLowerCase(),
      'apiKey': '4fb918f8585943ecb9e32ab3c4f3167b',
      'language': 'en'
    });

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
