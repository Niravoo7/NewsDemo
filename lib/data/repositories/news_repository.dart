import 'dart:io';

import 'package:demo_news/core/errors/exceptions.dart';
import 'package:demo_news/data/interfaces/remote_api.dart';
import 'package:demo_news/data/models/news.dart';
import 'package:demo_news/data/sources/local_cache.dart';
import 'package:demo_news/data/sources/remote_api.dart';
import 'package:demo_news/domain/entities/article.dart';
import 'package:demo_news/domain/interfaces/news_repository.dart';
import 'package:demo_news/domain/interfaces/repository.dart';
import 'package:dio/dio.dart';

class NewsRepository
    with RepositoryInterface
    implements NewsRepositoryInterface {
  final RemoteAPIInterface _remoteAPI;

  NewsRepository({RemoteAPI? remoteAPI})
      : _remoteAPI = remoteAPI ?? RemoteAPI();

  @override
  Future<List<Article>?> fetchNews() async {
    try {
      final Response response = await _remoteAPI.fetchNews();

      switch (response.statusCode) {
        case 200:
        case 201:
          var newsModel = NewsModel.fromJson(response.data);
          _saveNewsToLocalCache(key: LocalCache.newsKey, data: response.data);
          return newsModel.articles;
        default:
          throw handleDefaultCases(response.statusCode);
      }
    } on DioError catch (err) {
      if (err.error is SocketException) {
        return _getNewsFromLocalCache(key: LocalCache.newsKey);
      } else {
        throw err.error;
      }
    } on Exception catch (ex) {
      if (ex is NoInternetConnectionException) {
        return _getNewsFromLocalCache(key: LocalCache.newsKey);
      } else {
        rethrow;
      }
    }
  }

  void _saveNewsToLocalCache({required String key, required dynamic data}) {
    try {
      if (data != null && data.isNotEmpty) {
        LocalCache.setCache(key, data);
      }
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  Future<List<Article>?> _getNewsFromLocalCache({required String key}) async {
    try {
      var data = await LocalCache.getCache(key);
      if (data != null && data.isNotEmpty) {
        var newsModel = NewsModel.fromJson(data);
        return newsModel.articles;
      } else {
        return null;
      }
    } on Exception catch (_) {
      throw CacheException();
    }
  }
}
