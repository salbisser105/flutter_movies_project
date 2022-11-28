import 'package:get/get.dart';

import '../modules/movie_details/movie_details_binding.dart';
import '../modules/movie_details/ui/pages/movie_details_page.dart';
import '../modules/upcoming_movie/ui/pages/upcoming_movie_page.dart';
import '../modules/upcoming_movie/upcoming_movie_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.upcomingMovie,
      page: () => const UpcomingMoviePage(),
      binding: UpcomingMovieBinding(),
    ),
    GetPage(
      name: AppRoutes.movieDetails,
      page: () => const MovieDetailsPage(),
      binding: MovieDetailsBinding(),
    ),
  ];
}
