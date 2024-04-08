part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class FetchMoviesOnLoading extends DashboardState {}

final class FetchMoviesOnSuccess extends DashboardState {
  FetchMoviesOnSuccess({
    required this.movieList,
  });

  final List<MovieEntity> movieList;
}

final class FetchMoviesOnError extends DashboardState {
  FetchMoviesOnError({
    required this.message,
  });

  final String message;
}
