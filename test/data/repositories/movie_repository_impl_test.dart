import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_with_ci/data/datasources/remote/__mocks__/movie_remote_datasource_mock.dart';
import 'package:movie_app_with_ci/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app_with_ci/data/models/__mocks__/movie_model_mock.dart';
import 'package:movie_app_with_ci/data/models/movie_model.dart';
import 'package:movie_app_with_ci/data/repositories/movie_repository_impl.dart';

void main() {
  late final MovieRemoteDatasource mockMovieRemoteDatasource;
  late final MovieRepositoryImpl movieRepositoryImpl;

  setUp(() {
    mockMovieRemoteDatasource = MockMovieRemoteDatasource();
    movieRepositoryImpl = MovieRepositoryImpl(
      movieRemoteDatasource: mockMovieRemoteDatasource,
    );
  });

  group('Movie Repository Impl', () {
    test(
        'should called movie remote datasource successfully '
        'and return the movie list', () async {
      // Given
      final mockMovieModelList = MovieModel.fromJsonList(mockMovieListJson);
      when(() => mockMovieRemoteDatasource.getPopularMovies())
          .thenAnswer((_) async => mockMovieModelList);

      // When
      final movies = await movieRepositoryImpl.getPopularMovies();

      // Then
      expect(movies.first.id, 823464);
      verify(() => mockMovieRemoteDatasource.getPopularMovies()).called(1);
    });
  });
}
