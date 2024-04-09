import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_with_ci/domain/entities/__mocks__/movie_entity_mock.dart';
import 'package:movie_app_with_ci/domain/usecases/__mocks__/movie_usecase_mock.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';
import 'package:movie_app_with_ci/presentation/home/cubit/home_cubit.dart';

void main() {
  late MovieUsecase mockMovieUsecase;
  late HomeCubit homeCubit;

  setUp(() {
    mockMovieUsecase = MockMovieUsecase();
    homeCubit = HomeCubit(movieUsecase: mockMovieUsecase);
  });

  tearDown(() {
    try {
      verifyNoMoreInteractions(mockMovieUsecase);
    } catch (e) {
      rethrow;
    } finally {
      homeCubit.close();
      reset(mockMovieUsecase);
      resetMocktailState();
    }
  });

  group('Home Cubit -', () {
    final mockMovieListEntity = [mockMovieEntity];

    blocTest<HomeCubit, HomeState>(
      'emits [FetchMoviesOnLoading, FetchMoviesOnSuccess] when '
      'getPopularMovies() return valid data '
      'and movie usecase is called.',
      setUp: () => when(() => mockMovieUsecase.getPopularMovies())
          .thenAnswer((_) async => mockMovieListEntity),
      build: () => homeCubit,
      act: (cubit) => cubit.getPopularMovies(),
      expect: () => [
        isA<FetchMoviesOnLoading>(),
        isA<FetchMoviesOnSuccess>(),
      ],
      verify: (_) async {
        verify(() => mockMovieUsecase.getPopularMovies()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [FetchMoviesOnLoading, FetchMoviesOnError] when '
      'getPopularMovies() caught exception '
      'and movie usecase is called.',
      setUp: () => when(() => mockMovieUsecase.getPopularMovies())
          .thenThrow((_) async => Exception()),
      build: () => homeCubit,
      act: (cubit) => cubit.getPopularMovies(),
      expect: () => [
        isA<FetchMoviesOnLoading>(),
        isA<FetchMoviesOnError>(),
      ],
      verify: (_) async {
        verify(() => mockMovieUsecase.getPopularMovies()).called(1);
      },
    );
  });
}
