import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_with_ci/bootstrap.dart';
import 'package:movie_app_with_ci/common/injector/injector.dart';
import 'package:movie_app_with_ci/presentation/app/app.dart';

void main() async {
  Injector.setUp();
  await dotenv.load();
  await bootstrap(() => const App());
}
