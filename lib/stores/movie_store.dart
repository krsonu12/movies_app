// movie_store.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:movies_app/models/movie.dart';
part 'movie_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  _MovieStoreBase() {
    fetchMovies();
  }
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  ObservableList<Movie> searchResults = ObservableList<Movie>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchMovies() async {
    isLoading = true;
    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    final List data = json.decode(response.body);
    movies.addAll(data.map((json) => Movie.fromJson(json)).toList());
    isLoading = false;
  }

  @action
  Future<void> searchMovies(String query) async {
    isLoading = true;

    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    final List data = json.decode(response.body);
    searchResults.clear();
    searchResults.addAll(data.map((json) => Movie.fromJson(json)).toList());
    isLoading = false;
  }
}
