part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class FetchMoviesOnLoading extends HomeState {}

final class FetchMoviesOnSuccess extends HomeState {
  FetchMoviesOnSuccess({
    required this.movieList,
  });

  final List<MovieEntity> movieList;
}

final class FetchMoviesOnError extends HomeState {
  FetchMoviesOnError({
    required this.message,
  });

  final String message;
}
