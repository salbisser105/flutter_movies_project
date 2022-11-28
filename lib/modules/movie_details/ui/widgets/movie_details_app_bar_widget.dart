import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../movie_details_controller.dart';

class MovieDetailsAppBarWidget extends StatelessWidget {
  const MovieDetailsAppBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MovieDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Get.height / 2.6,
      floating: true,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '$imageBaseUrl${controller.movieData[0].backdropPath}',
              fit: BoxFit.cover,
              width: Get.width,
              height: Get.height,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent
                    ])),
              ),
            ),
          ],
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
