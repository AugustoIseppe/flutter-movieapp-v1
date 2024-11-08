import 'package:flutter_movie_app/widgets/custom_list_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
              ValueListenableBuilder<Movies?>(
                valueListenable: _moviesController.movies,
                builder: (__, movies, _) {
                  return Visibility(
                    visible: movies != null,
                    child: Text(
                      'Movies',
                      style: GoogleFonts.artifika(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent[700],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: _moviesController.onChanged,
                style: const TextStyle(
                  color: Colors
                      .white, // Texto em branco para contraste no tema dark
                ),
                decoration: InputDecoration(
                  hintText: 'Buscar filmes ...',
                  hintStyle: TextStyle(
                      color: Colors.grey[400]), // Cor sutil para o hint text
                  filled: true,
                  fillColor: const Color(
                      0xFF1C1C1C), // Cor de fundo escura para combinar com o tema
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.redAccent), // Ícone vermelho para destacar
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Bordas arredondadas
                    borderSide: BorderSide(
                      color: Colors.grey[800]!, // Borda sutil
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color:
                          Colors.redAccent, // Cor de destaque ao focar no campo
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15), // Espaçamento interno
                ),
                cursorColor:
                    Colors.redAccent, // Cor do cursor para combinar com o ícone
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _moviesController.movies,
                builder: (_, movies, __) {
                  if (movies == null) {
                    return Center(child: Lottie.asset('assets/lottie.json'));
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
