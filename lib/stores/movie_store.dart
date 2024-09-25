// movie_store.dart
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/models/movie.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchMovies(String query) async {
    isLoading = true;
    final response =
        await Dio().get('https://api.tvmaze.com/search/shows?q=$query');
    movies.clear();
    for (var json in response.data) {
      movies.add(Movie.fromJson(json));
    }
    isLoading = false;
  }
}
