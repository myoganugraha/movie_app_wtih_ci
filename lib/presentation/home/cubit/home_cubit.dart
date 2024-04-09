import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_with_ci/domain/entities/movie_entity.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.movieUsecase,
  }) : super(HomeInitial());

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
