import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  dioConfig() {
    final _dio = Dio(
      BaseOptions(
        baseUrl: 'https://data2.talentpitch.co/api',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
      ),
    );

    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.forceCache,
    );

    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return _dio;
  }

  final CacheOptions cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.forceCache,
  );

  ///Get Method
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await dioConfig().get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }
}
