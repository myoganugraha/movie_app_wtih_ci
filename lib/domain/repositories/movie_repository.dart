// ignore_for_file: one_member_abstracts

import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getPopularMovies({int? page});
}
