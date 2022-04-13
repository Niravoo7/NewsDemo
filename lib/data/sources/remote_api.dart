import 'package:demo_news/data/interfaces/remote_api.dart';
import 'package:dio/dio.dart';

class RemoteAPI implements RemoteAPIInterface {
  static const String _apiKey = '065b290a360a49d4bbf29dd240ca5e12';
  final Dio _dioClient;

  RemoteAPI({
    String? baseURL,
    Dio? dioClient,
  }) : _dioClient = dioClient ?? _getDioClient(baseURL ?? _getBaseUrl());

  static Dio _getDioClient(String baseURL) {
    var options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      queryParameters: {'apiKey': _apiKey},
    );

    return Dio(options);
  }

  static String _getBaseUrl() {
    return 'https://newsapi.org/v2';
  }

  @override
  Future<Response> fetchNews() {
    var params = {'country': 'us', 'category': 'business'};
    return _dioClient.get('/top-headlines', queryParameters: params);
  }
}
