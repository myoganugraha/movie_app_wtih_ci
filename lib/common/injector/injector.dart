import 'dart:js_interop';

import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';
import 'package:movie_app_with_ci/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie_app_with_ci/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_with_ci/domain/repositories/movie_repository.dart';
import 'package:movie_app_with_ci/domain/usecases/movie_usecase.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static final containerResolve = container?.resolve;

  static void setUp() {
    if (container.isNull) {
      container ??= KiwiContainer();
      _$Injector().configure();
    }
  }

  void configure() {
    _configureHttpClient();
    _configureRemoteDataSource();
    _configureRepository();
    _configureUsecase();
  }

  // ============ HTTP CLIENT ============
  @Register.singleton(Client)
  void _configureHttpClient();

  // ============ REMOTE DATASOURCE ============
  @Register.singleton(MovieRemoteDatasource)
  void _configureRemoteDataSource();

  // ============ REPOSITORY ============
  @Register.singleton(
    MovieRepository,
    from: MovieRepositoryImpl,
  )
  void _configureRepository();

  // ============ USECASE ============
  @Register.singleton(MovieUsecase)
  void _configureUsecase();
}
