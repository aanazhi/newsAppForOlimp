import 'package:dio/dio.dart';
import 'package:news_app_for_olimp/data/models/news_model.dart';

abstract class NewsService {
  Future<List<NewsModel>> getAllApplesNews();
}

class NewsServiceImpl implements NewsService {
  final Dio _dio;
  final String _apiKey;

  NewsServiceImpl({required Dio dio, required String apiKey})
    : _dio = dio,
      _apiKey = apiKey;

  @override
  Future<List<NewsModel>> getAllApplesNews() async {
    final url = 'https://newsapi.org/v2/everything?q=apple&apiKey=$_apiKey';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      final data = await response.data['articles'];
      print(data);

      if (data != null && data is List) {
        return data.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('No data');
      }
    } else {
      throw Exception('Response status code: ${response.statusCode}');
    }
  }
}
