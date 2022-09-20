import 'dart:developer';
import 'package:app_fox/core/models/question_model.dart';
import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
  static const String baseUrl = 'https://quizapi.io/api/v1/questions';
  static const String apiKey = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

  Api() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('\n---------- DioRequest ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tquery: ${options.queryParameters}'
              '\n\tdata: ${options.data}'
              '\n\theaders: ${options.headers}\n}'
              '\n--------------------------------\n');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          final options = response.requestOptions;
          log('\n---------- DioResponse ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tresponse: $response'
              '\n--------------------------------\n');
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          final options = error.requestOptions;
          log('\n---------- DioError ----------'
              '\n\turl: ${options.baseUrl}${options.path}'
              '\n\tmethod: ${options.method}'
              '\n\tmessage: ${error.message}'
              '\n\tresponse: ${error.response}'
              '\n--------------------------------\n');
          return handler.next(error);
        },
      ),
    );
  }

  Future<List<QuestionModel>> getQuestions({
  required String category,
  required String difficulty,
}) async {
    final response = await dio.get(
      baseUrl,
      queryParameters: {
        'apiKey': apiKey,
        'difficulty': difficulty.toLowerCase(),
        'category': category.toLowerCase(),
        'limit': 10,
      },
    );
    return (response.data as List)
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
