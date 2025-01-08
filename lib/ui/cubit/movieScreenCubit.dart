import 'package:FlixTime/data/entity/movie.dart';
import 'package:FlixTime/data/repo/movieRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreenCubit extends Cubit<List<Movie>>{
  MovieScreenCubit():super(<Movie>[]);

  bool isLoading = false;
  bool hasError = false;

  var mRepo = MovieRepository();
  Future<void> getAllMovies() async{
    isLoading = true;
    emit([]); //show loading

    try {
      var movies = await mRepo.getAllMovies();
      isLoading = false;
      hasError = false;
      emit(movies);
    } catch (e) {
      isLoading = false;
      hasError = true;
      emit([]); //empty list when error occour
    }
  }
}