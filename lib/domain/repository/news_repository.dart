import 'package:news_app_for_olimp/data/models/news_model.dart';
import 'package:news_app_for_olimp/data/service/news_service.dart';
import 'package:news_app_for_olimp/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getAllApplesNews();
}

class NewsRepositoryImpl implements NewsRepository {
  final NewsService _newsService;

  NewsRepositoryImpl({required NewsService newsService})
    : _newsService = newsService;

  @override
  Future<List<NewsEntity>> getAllApplesNews() async {
    final data = await _newsService.getAllApplesNews();
    return data.map(_convertToNewsEntity).toList();
  }
}

NewsEntity _convertToNewsEntity(NewsModel newsModel) {
  return NewsEntity(
    author: newsModel.author,
    title: newsModel.title,
    description: newsModel.description,
    urlToImage: newsModel.urlToImage,
    content: newsModel.content,
  );
}
