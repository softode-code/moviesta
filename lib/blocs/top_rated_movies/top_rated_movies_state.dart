import 'package:moviesta/models/movie.dart';

class TopRatedMoviesState {
  List<Movie> movies;
  
  TopRatedMoviesState({this.movies});

  TopRatedMoviesState.initial(){
    this.movies = null;
  }

  TopRatedMoviesState.loading(){
    this.movies = null;
  }

  TopRatedMoviesState.failed(){
    this.movies = null;
  }

  TopRatedMoviesState.success(List<Movie> movies){
    this.movies = movies;
  }
}