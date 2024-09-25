import 'package:get_it/get_it.dart';
import 'package:movies_app/stores/movie_store.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton(() => MovieStore());
}
