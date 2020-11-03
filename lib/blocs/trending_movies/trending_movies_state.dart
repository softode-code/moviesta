import 'package:moviesta/models/movie.dart';

class TrendingMoviesState {
  List<Movie> movies;
  
  TrendingMoviesState({this.movies});

  TrendingMoviesState.initial(){
    this.movies = null;
  }

  TrendingMoviesState.loading(){
    this.movies = null;
  }

  TrendingMoviesState.failed(){
    this.movies = null;
  }

  TrendingMoviesState.success(List<Movie> movies){
    this.movies = movies;
  }
}