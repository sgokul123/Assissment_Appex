import 'package:appex_assignment/src/utils/custom_logger.dart';
import 'package:dio/dio.dart';

class DataClient {
  Dio dio;
  static DataClient _inst;

  DataClient._internal(String baseUrl) {
    dio = new Dio(new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 100000,
      receiveTimeout: 300000,
    ));
  }

  setHeaders({Map<String, String> map}) {
    if (dio != null && map.isNotEmpty) {
      for (var i = 0; i < map.length; i++) {
        for (var key in map.keys) {
          dio.options.headers[key] = map[key];
        }
      }
    }
  }

  factory DataClient(String baseUrl) {
    if (_inst == null) {
      CustomLogger.log("url: " + baseUrl);
      _inst = new DataClient._internal(baseUrl);
    }
    CustomLogger.log("re-paint");
    if (_inst != null && _inst.dio != null) {
      _inst.dio.options.baseUrl = baseUrl;
    }
    return _inst;
  }
}
