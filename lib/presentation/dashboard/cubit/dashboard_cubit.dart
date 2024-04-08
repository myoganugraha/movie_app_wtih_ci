import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required this.movieUsecase,
  }) : super(DashboardInitial());

  final MovieUsecase movieUsecase;

  Future<void> getPopularMovies({int? page}) async {
    try {
      emit(FetchMoviesOnLoading());
      final movieList = await movieUsecase.getPopularMovies(page: page);
      emit(FetchMoviesOnSuccess(movieList: movieList));
    } catch (e) {
      emit(FetchMoviesOnError(message: e.toString()));
    }
  }
}
