import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../upcoming_movie_controller.dart';
import '../widgets/upcoming_movies_container_widget.dart';

class UpcomingMoviePage extends StatelessWidget {
  const UpcomingMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (controller) => Scaffold(
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.25,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Hello, what do you\nwant to watch?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.snackbar(
                                "Ups",
                                "Sorry this feature is not done yet\nwe apologize for the problems.",
                                backgroundColor: Colors.lightBlue,
                                colorText: Colors.white,
                                icon: const Icon(Icons.person,
                                    color: Colors.white),
                                duration: const Duration(seconds: 6),
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              height: Get.height * 0.05,
                              width: Get.width * 0.8,
                              child: Row(
                                children: const [
                                  SizedBox(width: 20),
                                  Icon(Icons.search),
                                  SizedBox(width: 20),
                                  Text('Search')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    UpComingMovieContainerWidget(
                      controller: controller,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
