import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movies_model.dart';
import 'package:flutter_movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where(
            (e) => e.toString().toLowerCase().contains((value.toLowerCase())))
        .toList();

    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
