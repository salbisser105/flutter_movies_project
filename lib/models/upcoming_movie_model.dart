class MovieModel {
  int id;
  String originalTitle;
  String backdropPath;
  dynamic voteAverage;

  MovieModel(
      {required this.id,
      required this.originalTitle,
      required this.voteAverage,
      required this.backdropPath});

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      originalTitle: json['original_title'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path']);
}
