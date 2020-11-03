import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:moviesta/blocs/top_rated_movies/top_rated_movies_event.dart';
import 'package:moviesta/blocs/top_rated_movies/top_rated_movies_state.dart';
import 'package:moviesta/repositories/movie_repository.dart';
import 'package:moviesta/screens/discover/movies_row.dart';

class TopRatedMovies extends StatelessWidget {

  final MovieRepository movieRepository;
  TopRatedMovies({Key key, this.movieRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Top Rated Movies',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height:5),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) => TopRatedMoviesBloc(movieRepository: movieRepository)..add(TopRatedMoviesEventLoad()),
          child: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
            builder: (context, state){
              return MoviesRow(listLength: 11, movies: state.movies);
            }
          ),
        ),
      ],
    );
  }
}