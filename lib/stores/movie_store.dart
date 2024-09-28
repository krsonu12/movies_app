import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:movies_app/models/show_model.dart';

part 'movie_store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

abstract class MovieStoreBase with Store {
  MovieStoreBase() {
    fetchMovies();
  }

  @observable
  ObservableList<Show> movies = ObservableList<Show>();

  @observable
  ObservableList<Show> searchResults = ObservableList<Show>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage; // Nullable String for error messages

  @action
  Future<void> fetchMovies() async {
    isLoading = true;
    errorMessage = "null"; // Reset the error message before each request

    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

      // Check if the response is successful
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        log(data.first.toString());

        // Map and store movies, ensuring data isn't null
        movies.clear(); // Clear previous movies before adding new ones
        return movies.addAll(data.map((json) => Show.fromJson(json)).toList());
      } else {
        errorMessage = 'Failed to fetch movies. Please try again later.';
      }
    } catch (e) {
      errorMessage =
          'An error occurred: $e'; // Handle any errors from the request
    } finally {
      isLoading = false; // Stop loading regardless of success or failure
    }
  }

  @action
  Future<void> searchMovies(String query) async {
    isLoading = true;
    errorMessage = "null"; // Reset the error message

    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        log(data.first.toString());
        // Map and store search results, ensuring data isn't null
        searchResults.clear();
        return searchResults
            .addAll(data.map((json) => Show.fromJson(json)).toList());
      } else {
        errorMessage = 'Failed to search movies. Please try again later.';
      }
    } catch (e) {
      errorMessage =
          'An error occurred: $e'; // Handle any errors from the request
    } finally {
      isLoading = false; // Stop loading after the search is done
    }
  }
}
