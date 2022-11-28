import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/constants.dart';
import '../../upcoming_movie_controller.dart';

class GetTopRatedMoviesWidget extends StatelessWidget {
  const GetTopRatedMoviesWidget({Key? key, required this.controller})
      : super(key: key);
  final MovieController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.33,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.topRatedMovies.length,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.movieDetails,
                    arguments: [controller.topRatedMovies[index].id]);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: CachedNetworkImage(
                      imageUrl:
                          '$imageBaseUrl${controller.topRatedMovies[index].backdropPath}',
                      fit: BoxFit.fitHeight,
                      height: Get.height * 0.18,
                      width: Get.width * 0.6,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0)),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent
                              ])),
                    ),
                  ),
                  Positioned(
                      bottom: Get.height * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          controller.topRatedMovies[index].originalTitle,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  Positioned(
                    bottom: Get.height * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: RatingBarIndicator(
                        rating: 5, // todo get this rating from the page
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        unratedColor: Colors.amber.withAlpha(50),
                        direction: Axis.horizontal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}
