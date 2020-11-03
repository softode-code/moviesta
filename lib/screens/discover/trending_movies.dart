import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_bloc.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_event.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_state.dart';
import 'package:moviesta/repositories/movie_repository.dart';
import 'package:moviesta/screens/discover/movies_row.dart';

class TrendingMovies extends StatelessWidget {

  final MovieRepository movieRepository;
  int listLength = 11;

  TrendingMovies({Key key, this.movieRepository}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Movies',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height:5),
        BlocProvider<TrendingMoviesBloc>(
          create: (context) => TrendingMoviesBloc(movieRepository: movieRepository)..add(TrendingMoviesEventLoad()),
          child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
            builder: (context, state){
              return MoviesRow(listLength: 11, movies: state.movies);
            },
          ),
        )
      ],
    );
  }
}