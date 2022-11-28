import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helpers/theme/colors_theme.dart';
import 'modules/upcoming_movie/ui/pages/upcoming_movie_page.dart';
import 'modules/upcoming_movie/upcoming_movie_binding.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeColor().themeData,
      home: const UpcomingMoviePage(),
      initialBinding: UpcomingMovieBinding(),
      getPages: AppPages.pages,
    );
  }
}
