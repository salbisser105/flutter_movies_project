import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../upcoming_movie_controller.dart';
import 'get_top_rated_movies_widget.dart';
import 'upcoming_movies_widget.dart';

class UpComingMovieContainerWidget extends StatelessWidget {
  const UpComingMovieContainerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MovieController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.75,
      color: Colors.grey[700],
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 10,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'RECOMMENDED FOR YOU',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.3,
                ),
                const Text(
                  'See all',
                  style: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: GetTopRatedMoviesWidget(
              controller: controller,
            ),
          ),
          Positioned(
            left: 15,
            top: Get.height * 0.37,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'TOP RATED',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.5,
                ),
                const Text(
                  'See all',
                  style: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
                )
              ],
            ),
          ),
          Positioned(
            bottom: Get.height * 0.03,
            child: UpcomingMoviesWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
