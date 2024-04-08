import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_with_ci/data/repositories/__mocks__/movie_repository_impl_mock.dart';
import 'package:movie_app_with_ci/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_with_ci/domain/entities/__mocks__/movie_entity_mock.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';

void main() {
  late final MovieRepositoryImpl mockMovieRepositoryImpl;
  late final MovieUsecase movieUsecase;

  setUp(() {
    mockMovieRepositoryImpl = MockMovieRepositoryImpl();
    movieUsecase = MovieUsecase(movieRepository: mockMovieRepositoryImpl);
  });

  group('Movie Usecase -', () {
    group('getPopularMovies()', () {
      test(
          'should called movie repository successfully '
          'and return the movie list', () async {
        // Given
        final mockMovieListEntity = [mockMovieEntity];
        when(() => mockMovieRepositoryImpl.getPopularMovies())
            .thenAnswer((_) async => mockMovieListEntity);

        // When
        final movies = await movieUsecase.getPopularMovies();

        // Then
        expect(movies.first.id, 1);
        expect(movies.first.title, 'title');
        verify(() => mockMovieRepositoryImpl.getPopularMovies()).called(1);
      });
    });
  });
}
