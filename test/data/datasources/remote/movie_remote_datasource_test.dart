import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_with_ci/common/__mocks__/http_client_mock.dart';
import 'package:movie_app_with_ci/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app_with_ci/data/models/__mocks__/movie_model_mock.dart';

import '../../../mock.dart';

void main() {
  late Client mockClient;
  late MovieRemoteDatasource movieRemoteDatasource;

  setUp(() {
    mockClient = MockHttpClient();
    movieRemoteDatasource = MovieRemoteDatasource(mockClient);

    registerFallbackValue(FakeUri());
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad(fileInput: File('./.env').readAsStringSync());
  });

  tearDown(() {
    mockClient.close();
    clearInteractions(mockClient);
    reset(mockClient);
  });

  group('Movie Remote Datasource -', () {
    group('getPopularMovies', () {
      test(
          'should return list of movies '
          'when succeed calling endpoint.', () async {
        // Given
        when(
          () => mockClient.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => Response(
            jsonEncode(mockMovieListJson),
            200,
          ),
        );

        // When
        final movies = await movieRemoteDatasource.getPopularMovies();

        // Then
        expect(movies.length, 1);
      });
    });

    test(
        'should throw error '
        'when failed calling the endpoint.', () async {
      // Given
      Exception? error;
      when(
        () => mockClient.get(
          any(),
        ),
      ).thenThrow((_) async => '');

      // When
      try {
        await movieRemoteDatasource.getPopularMovies();
      } catch (e) {
        error = e as Exception;
      }

      // Then
      identical(error, Exception());
      // ignore: lines_longer_than_80_chars
      expect(error!.toString(), "Exception: Failed to get popular movies, e: type 'Null' is not a subtype of type 'Future<Response>'");
    });
  });
}
