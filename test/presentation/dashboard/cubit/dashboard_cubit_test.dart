import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app_with_ci/domain/entities/__mocks__/movie_entity_mock.dart';
import 'package:movie_app_with_ci/domain/usecases/__mocks__/movie_usecase_mock.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';
import 'package:movie_app_with_ci/presentation/dashboard/cubit/dashboard_cubit.dart';

void main() {
  late MovieUsecase mockMovieUsecase;
  late DashboardCubit dashboardCubit;

  setUp(() {
    mockMovieUsecase = MockMovieUsecase();
    dashboardCubit = DashboardCubit(movieUsecase: mockMovieUsecase);
  });

  tearDown(() {
    try {
      verifyNoMoreInteractions(mockMovieUsecase);
    } catch (e) {
      rethrow;
    } finally {
      dashboardCubit.close();
      reset(mockMovieUsecase);
      resetMocktailState();
    }
  });

  group('Dashboard Cubit -', () {
    final mockMovieListEntity = [mockMovieEntity];

    blocTest<DashboardCubit, DashboardState>(
      'emits [FetchMoviesOnLoading, FetchMoviesOnSuccess] when '
      'getPopularMovies() return valid data '
      'and movie usecase is called.',
      setUp: () => when(() => mockMovieUsecase.getPopularMovies())
          .thenAnswer((_) async => mockMovieListEntity),
      build: () => DashboardCubit(movieUsecase: mockMovieUsecase),
      act: (cubit) => cubit.getPopularMovies(),
      expect: () => [
        isA<FetchMoviesOnLoading>(),
        isA<FetchMoviesOnSuccess>(),
      ],
      verify: (_) async {
        verify(() => mockMovieUsecase.getPopularMovies()).called(1);
      },
    );

    blocTest<DashboardCubit, DashboardState>(
      'emits [FetchMoviesOnLoading, FetchMoviesOnError] when '
      'getPopularMovies() caught exception '
      'and movie usecase is called.',
      setUp: () => when(() => mockMovieUsecase.getPopularMovies())
          .thenThrow((_) async => Exception()),
      build: () => DashboardCubit(movieUsecase: mockMovieUsecase),
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
