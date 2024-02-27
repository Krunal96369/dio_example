import 'dart:developer';

import 'package:dio/dio.dart';

// This class is responsible for fetching posts from the API
class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(milliseconds: 5000), // 5 seconds
      receiveTimeout: const Duration(milliseconds: 3000), // 3 seconds
    );
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      Response response = await _dio.get('/posts');
      return response.data;
    } catch (error) {
      log('Failed to fetch posts',
          error: error, stackTrace: StackTrace.current);
      rethrow;
    }
  }
}
