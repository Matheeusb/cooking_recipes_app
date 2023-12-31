import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cooking_recipes_app/core/http/http_client.dart';

enum ResponseType { success, failure, error }

class HttpStubs {
  final HttpClient httpClient;

  HttpStubs(this.httpClient);

  void setupHttpClientResponse(
    String url,
    dynamic payload, {
    ResponseType responseType = ResponseType.success,
    Map<String, dynamic>? queryParameters,
  }) {
    switch (responseType) {
      case ResponseType.success:
        when(
          () => httpClient.get(url, queryParameters: queryParameters),
        ).thenAnswer(
          (_) async => Response(
            data: payload,
            statusCode: 200,
            requestOptions: _getRequestOptions(
              url,
              queryParameters: queryParameters,
            ),
          ),
        );
        break;

      case ResponseType.failure:
        when(
          () => httpClient.get(url, queryParameters: queryParameters),
        ).thenAnswer(
          (_) async => Response(
            data: payload,
            statusCode: 400,
            requestOptions: _getRequestOptions(
              url,
              queryParameters: queryParameters,
            ),
          ),
        );
        break;

      case ResponseType.error:
        when(
          () => httpClient.get(url, queryParameters: queryParameters),
        ).thenThrow(
          DioException(
            requestOptions: _getRequestOptions(
              url,
              queryParameters: queryParameters,
            ),
          ),
        );
        break;
    }
  }

  static _getRequestOptions(
    String url, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
  }) {
    return RequestOptions(
      method: method,
      baseUrl: 'https://mealdb.test/api',
      path: url,
      queryParameters: queryParameters,
    );
  }
}
