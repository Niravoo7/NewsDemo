import 'package:dio/dio.dart';

abstract class RemoteAPIInterface {
  Future<Response> fetchNews();
}
