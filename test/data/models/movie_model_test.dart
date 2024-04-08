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
  });
}
