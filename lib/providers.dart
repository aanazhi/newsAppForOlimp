import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_for_olimp/data/local_services/news_local_services.dart';
import 'package:news_app_for_olimp/data/service/news_service.dart';
import 'package:news_app_for_olimp/domain/entity/news_entity.dart';
import 'package:news_app_for_olimp/domain/repository/news_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  final dio = Dio();
  final apiKey = '0f8f0fc8e11b46de9fd6e2c3cfc142b6';
  return NewsServiceImpl(dio: dio, apiKey: apiKey);
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final newService = ref.watch(newsServiceProvider);
  return NewsRepositoryImpl(newsService: newService);
});

final newsProvider = FutureProvider<List<NewsEntity>>((ref) {
  return ref.watch(newsRepositoryProvider).getAllApplesNews();
});

final newsLocalProvider = Provider<NewsLocalServices>((ref) {
  final sharedPref = ref.watch(sharedPreferencesProvider);
  return NewsLocalServicesImpl(sharedPreferences: sharedPref);
});

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
