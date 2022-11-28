import 'package:dio/dio.dart';

import '../utils/constants.dart';

class MovieApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));
  Future<dynamic> getMovieDetails({required int movieId}) async {
    final response = await dio.get('/movie/$movieId?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getUpcomingMovies() async {
    final response = await dio.get('/movie/upcoming?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

// https://api.themoviedb.org/3/movie/top_rated?api_key=f6109d608935f9aacd38e94f9aecc85c&language=en-US&page=1
  Future<dynamic> getTopRated() async {
    final response = await dio.get('/movie/top_rated?api_key=$apiKey');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
