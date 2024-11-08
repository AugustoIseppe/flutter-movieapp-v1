import 'package:flutter_movie_app/models/movies_model.dart';
import 'package:flutter_movie_app/repositories/movies_repository.dart';
import 'package:flutter_movie_app/service/dio_service.dart';
import 'package:flutter_movie_app/utils/apis_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.requestMoviesList);
    return Movies.fromJson(result.data);
  }
}
