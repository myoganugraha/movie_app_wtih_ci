import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_with_ci/data/models/__mocks__/movie_model_mock.dart';
import 'package:movie_app_with_ci/data/models/movie_model.dart';

void main() {
  group('Movie Model -', () {
    test('should parsed correctly', () {
      // Given
      const mockJson = mockMovieJson;

      // When
      final data = MovieModel.fromJson(mockJson);

      // Then
      expect(data.title, 'Godzilla x Kong: The New Empire');
      expect(data.adult, false);
      expect(data.id, 823464);
      expect(data.genreIds.length, 4);
    });
  });

  group('Movie Model List -', () {
    test('should parsed correctly', () {
      // Given
      const mockJson = mockMovieListJson;

      // When
      final data = MovieModel.fromJsonList(mockJson);

      // Then
      expect(data.first.title, 'Godzilla x Kong: The New Empire');
      expect(data.first.adult, false);
      expect(data.first.id, 823464);
      expect(data.first.genreIds.length, 4);
    });

    test(
        'should throw Exception(Failed to parse json list) '
        'when given invalid json schema', () {
      // Given
      dynamic error;

      // When
      try {
        MovieModel.fromJsonList(mockMovieJson);
      } catch (e) {
        error = e;
      }

      // Then
      identical(error, Exception('Failed to parse json list'));
    });
  });
}
