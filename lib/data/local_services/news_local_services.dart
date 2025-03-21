import 'dart:convert';

import 'package:news_app_for_olimp/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalServices {
  Future<List<NewsModel>> getNewsLocal();
  Future<void> cashedNews(List<NewsModel> newsModel);
}

class NewsLocalServicesImpl implements NewsLocalServices {
  final SharedPreferences sharedPreferences;
  final String cashKey = 'cashed_news';

  NewsLocalServicesImpl({required this.sharedPreferences});

  @override
  Future<void> cashedNews(List<NewsModel> newsModel) async {
    final List<Map<String, dynamic>> jsonList =
        newsModel.map((newModel) => newModel.toJson()).toList();
    final String jsonString = json.encode(jsonList);
    await sharedPreferences.setString(cashKey, jsonString);
  }

  @override
  Future<List<NewsModel>> getNewsLocal() async {
    final jsonString = sharedPreferences.getString(cashKey);
    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString) as List;
      return decodedJson
          .map(
            (dynamic item) => NewsModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      return [];
    }
  }
}
