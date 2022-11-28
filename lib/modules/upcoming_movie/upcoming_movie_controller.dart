import 'package:get/get.dart';

import '../../helpers/movie_api.dart';
import '../../models/upcoming_movie_model.dart';

class MovieController extends GetxController {
  MovieApi movieApi = MovieApi();
  List<MovieModel> upcomingMovies = [];
  List<MovieModel> topRatedMovies = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
    fetchRatedMovies();
  }

  void fetchUpcomingMovies() async {
    var response = await movieApi.getUpcomingMovies();
    if (response != null) {
      response['results'].forEach((data) {
        upcomingMovies.add(MovieModel.fromMap(data));
      });
      isLoading = false;
      update();
    }
  }

  void fetchRatedMovies() async {
    var response = await movieApi.getTopRated();
    if (response != null) {
      response['results'].forEach((data) {
        topRatedMovies.add(MovieModel.fromMap(data));
      });
      isLoading = false;
      update();
    }
  }
}
