// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureHttpClient() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => Client());
  }

  @override
  void _configureRemoteDataSource() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => MovieRemoteDatasource(c<Client>()));
  }

  @override
  void _configureRepository() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<MovieRepository>((c) =>
        MovieRepositoryImpl(movieRemoteDatasource: c<MovieRemoteDatasource>()));
  }

  @override
  void _configureUsecase() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => MovieUsecase(movieRepository: c<MovieRepository>()));
  }
}
