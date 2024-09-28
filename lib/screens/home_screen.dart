// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/service_locator/service_locator.dart';
import 'package:movies_app/stores/movie_store.dart';

class HomeScreen extends StatelessWidget {
  MovieStore get movieStore => getIt<MovieStore>();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.go('/search');
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (movieStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: movieStore.movies.length,
            itemBuilder: (context, index) {
              final movie = movieStore.movies[index];
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (index) {
          if (index == 1) {
            context.go('/search');
          }
        },
      ),
    );
  }
}
