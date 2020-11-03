import 'package:moviesta/models/movie.dart';

class PopularMoviesState {
  List<Movie> movies;
  
  PopularMoviesState({this.movies});

  PopularMoviesState.initial(){
    this.movies = null;
  }

  PopularMoviesState.loading(){
    this.movies = null;
  }

  PopularMoviesState.failed(){
    this.movies = null;
  }

  PopularMoviesState.success(List<Movie> movies){
    this.movies = movies;
  }
}