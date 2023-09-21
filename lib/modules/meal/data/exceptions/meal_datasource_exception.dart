class MealDatasourceException implements Exception {}

class JsonDecodeException implements MealDatasourceException {}

class HttpRequestException implements MealDatasourceException {
  final int statusCode;

  HttpRequestException(this.statusCode);
}

class HttpException implements MealDatasourceException {}
