import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_movie_app/decorators/movies_repository_decorator.dart';
import 'package:flutter_movie_app/models/movies_model.dart';
import 'package:flutter_movie_app/repositories/movies_repository.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return _getFromCache();
    }
  }

  _saveInCache(Movies movies) async {
    // Salvar no cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('Salvando no cache os filmes $jsonMovies');
  }

  Future<Movies> _getFromCache() async {
    // Obter do cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache');
    var json = jsonDecode(moviesJsonString!);
    var movies = Movies.fromJson(json);
    print('Obtendo do cache ${movies.toString()}');
    return movies;
  }
}
