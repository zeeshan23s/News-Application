import '../packages_export.dart';

class NewsProvider with ChangeNotifier {
  List<News> _appNews = [];
  bool _isLoading = false;

  List<News> get appNews => _appNews;

  bool get isLoading => _isLoading;

  Future<void> getAppNews(String relatedTo, BuildContext context) async {
    _isLoading = true;

    _appNews = await NewsController.fetchData(relatedTo);

    _isLoading = false;
    notifyListeners();
  }
}
