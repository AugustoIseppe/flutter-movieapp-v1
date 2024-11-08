import 'package:flutter_movie_app/widgets/custom_list_card_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Movies',
                style: GoogleFonts.aldrich(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _moviesController.movies,
                builder: (_, movies, __) {
                  if (movies == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    physics:
                        const NeverScrollableScrollPhysics(), // Desabilita scroll da lista
                    separatorBuilder: (_, __) => const Divider(height: 10),
                    shrinkWrap: true,
                    itemCount: movies.listMovies.length,
                    itemBuilder: (_, i) {
                      var movie = movies.listMovies[i];
                      return CustomListCardWidget(
                        movie: movie,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
