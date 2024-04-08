import 'package:movie_app_with_ci/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';
import 'package:movie_app_with_ci/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl({
    required this.movieRemoteDatasource,
  });

  final MovieRemoteDatasource movieRemoteDatasource;
  @override
  Future<List<MovieEntity>> getPopularMovies({
    int? page,
  }) {
    return movieRemoteDatasource.getPopularMovies(page: page);
  }
}
