class MovieEntity {

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.releaseDate,
    required this.genreIds,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });
  
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
}
