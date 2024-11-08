import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_movie_app/controllers/movie_cotroller.dart';
import 'package:flutter_movie_app/models/movies_model.dart';
import 'package:flutter_movie_app/repositories/movies_repository_imp.dart';
import 'package:flutter_movie_app/service/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _moviesController =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<Movies?>(
          valueListenable: _moviesController.movies,
          builder: (_, movies, __) {
            if (movies == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: movies.listMovies.length,
              itemBuilder: (_, i) {
                var movie = movies.listMovies[i];
                return Text(
                  movie.title,
                  style: GoogleFonts.aldrich(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
