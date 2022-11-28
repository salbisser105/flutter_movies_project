import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../movie_details_controller.dart';
import '../widgets/movie_details_app_bar_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailsController>(
      builder: (controller) => Scaffold(
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder:
                    ((BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    MovieDetailsAppBarWidget(
                      controller: controller,
                    )
                  ];
                }),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.movieData[0].originalTitle,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),
                              ),
                              onPressed: () {
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
                              child: const Text('Watch me')),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: RatingBarIndicator(
                              rating: controller.movieData[0].voteAverage,
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
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(controller.movieData[0].overview,
                          style: const TextStyle(color: Colors.grey),
                          textAlign: TextAlign.justify),
                      const SizedBox(height: 10),
                      const CastRowWidget(),
                      const SizedBox(height: 10),
                      //Todo get the real info.
                      Row(
                        children: const [
                          Text('Studio   '),
                          SizedBox(width: 10),
                          Text('Warner Bros'),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Genre    '),
                          SizedBox(width: 10),
                          Text('Action, Adventure'),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Release'),
                          SizedBox(width: 10),
                          Text('2018'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CastRowWidget extends StatelessWidget {
  const CastRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ActorImage(
          actorName: 'Jason\nMomoa',
        ),
        ActorImage(
          actorName: 'Scarlett\nJohansson',
        ),
        ActorImage(
          actorName: 'Adam\nSandler',
        ),
        ActorImage(
          actorName: 'Megan\nFox',
        ),
      ],
    );
  }
}

class ActorImage extends StatelessWidget {
  const ActorImage({
    Key? key,
    required this.actorName,
  }) : super(key: key);
  final String actorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          // TODO load image from the cast crew
          backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
        ),
        const SizedBox(height: 10),
        Text(actorName)
      ],
    );
  }
}
