import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalCache {
  LocalCache._();

  static const String _cacheTable = 'cache_table';
  static const String newsKey = 'news';

  static Future<void> setCache(String key, dynamic data) async {
    try {
      if (!Hive.isBoxOpen(_cacheTable)) {
        var directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);
      }

      var cacheTable = await Hive.openBox(_cacheTable);
      if (data != null) {
        var encodedData = json.encode(data);
        cacheTable.put(key, encodedData);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  static Future<dynamic> getCache(String key) async {
    try {
      if (!Hive.isBoxOpen(_cacheTable)) {
        var directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);
      }

      var cacheTable = await Hive.openBox(_cacheTable);
      var data = cacheTable.get(key);
      if (data != null) {
        var decodedData = json.decode(data);
        return decodedData;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
