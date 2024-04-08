import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_with_ci/domain/entities/__mocks__/movie_entity_mock.dart';

void main() {
  group('Movie Entity', () {
    test('should parsed correctly', () {
      // Given
      const id = 1;
      const title = 'title';
      const overview = 'overview';

      // When
      final data = mockMovieEntity;

      // Then
      expect(id, data.id);
      expect(title, data.title);
      expect(overview, data.overview);
    });
   });
}
