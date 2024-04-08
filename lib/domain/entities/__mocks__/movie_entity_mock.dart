import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';

MovieEntity mockMovieEntity = MovieEntity(
  id: 1,
  title: 'title',
  overview: 'overview',
  backdropPath: 'backdropPath',
  originalLanguage: 'originalLanguage',
  originalTitle: 'originalTitle',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  genreIds: [1, 2, 3, 4],
  adult: false,
  video: false,
  popularity: 12.34,
  voteAverage: 5,
  voteCount: 5,
);
