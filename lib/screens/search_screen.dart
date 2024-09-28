// search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/service_locator/service_locator.dart';
import 'package:movies_app/stores/movie_store.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  MovieStore get movieStore => getIt<MovieStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search...'),
          onSubmitted: (query) {
            movieStore.searchMovies(query);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (movieStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: movieStore.searchResults.length,
            itemBuilder: (context, index) {
              final movie = movieStore.searchResults[index];
              return ListTile(
                leading: Image.network(movie.image.original),
                title: Text(movie.name),
                subtitle: Text(movie.summary),
                onTap: () {
                  context.go('/details', extra: movie);
                },
              );
            },
          );
        },
      ),
    );
  }
}
