// details_screen.dart
import 'package:flutter/material.dart';
import 'package:movies_app/models/show_model.dart';
import 'package:flutter/src/widgets/image.dart';

class DetailsScreen extends StatelessWidget {
  final Show movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(movie.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(movie.summary),
          ],
        ),
      ),
    );
  }
}
