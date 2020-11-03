import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:moviesta/blocs/popular_movies/popular_movies_event.dart';
import 'package:moviesta/blocs/popular_movies/popular_movies_state.dart';
import 'package:moviesta/repositories/movie_repository.dart';
import 'package:moviesta/screens/discover/movies_row.dart';

class PopularMovies extends StatelessWidget {

  final MovieRepository movieRepository;
  PopularMovies({Key key, this.movieRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Popular Movies',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height:5),
        BlocProvider<PopularMoviesBloc>(
          create: (context) => PopularMoviesBloc(movieRepository: movieRepository)..add(PopularMoviesEventLoad()),
          child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state){
              return MoviesRow(listLength: 11, movies: state.movies);
            }
          ),
        ),
      ],
    );
  }
}