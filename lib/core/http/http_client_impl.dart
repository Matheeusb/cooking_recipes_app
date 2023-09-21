import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'http_client.dart';

@Injectable(as: HttpClient)
class HttpClientImpl implements HttpClient {
  static const String _baseUrl = 'http://www.themealdb.com/api/json/v1/1/';

  final Dio dioClient = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      receiveTimeout: const Duration(milliseconds: 5000),
    ),
  );

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      dioClient.get(
        path,
        queryParameters: queryParameters,
      );
}
