import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.originalLanguage,
    required super.originalTitle,
    required super.posterPath,
    required super.releaseDate,
    required super.genreIds,
    required super.adult,
    required super.video,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> data) {
    return MovieModel(
      id: data['id'] as int,
      title: data['title'] as String,
      overview: data['overview'] as String,
      backdropPath: data['backdrop_path'] as String,
      originalLanguage: data['original_language'] as String,
      originalTitle: data['original_title'] as String,
      posterPath: data['poster_path'] as String,
      releaseDate: data['release_date'] as String,
      genreIds: List<int>.from(data['genre_ids'] as List<dynamic>),
      adult: data['adult'] as bool,
      video: data['video'] as bool,
      popularity: data['popularity'] as double,
      voteAverage: data['vote_average'] as double,
      voteCount: data['vote_count'] as int,
    );
  }

  static List<MovieModel> fromJsonList(Map<String, dynamic> data) {
    try {
      final results = data['results'] as List<dynamic>;
      return results
          .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw Exception('Failed to parse json list');
    }
  }
}
