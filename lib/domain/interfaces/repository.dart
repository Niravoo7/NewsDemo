import 'package:demo_news/core/errors/exceptions.dart';

class RepositoryInterface {
  Exception handleDefaultCases(int? statusCode) {
    switch (statusCode) {
      case 408:
        return NoInternetConnectionException();
      case 500:
        return ServerException();
      default:
        throw UnimplementedError();
    }
  }
}
