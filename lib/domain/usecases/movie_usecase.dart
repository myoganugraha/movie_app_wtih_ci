import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';
import 'package:movie_app_with_ci/domain/repositories/movie_repository.dart';

class MovieUsecase {
  MovieUsecase({
    required this.movieRepository,
  });

  final MovieRepository movieRepository;
  Future<List<MovieEntity>> getPopularMovies({int? page}) {
    return movieRepository.getPopularMovies(page: page);
  }
}
