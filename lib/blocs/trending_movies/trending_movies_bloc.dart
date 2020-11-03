import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_event.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_state.dart';
import 'package:moviesta/models/movie_response.dart';
import 'package:moviesta/repositories/movie_repository.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {

  final MovieRepository _movieRepository;

  TrendingMoviesBloc({MovieRepository movieRepository}) 
    : _movieRepository = movieRepository,
      super(TrendingMoviesState.initial());

  @override
  Stream<TrendingMoviesState> mapEventToState(TrendingMoviesEvent event) async* {
    if(event is TrendingMoviesEventLoad){
      yield TrendingMoviesState.loading();
      try{
        MovieResponse response  = await _movieRepository.getTrendingMovies();
        yield TrendingMoviesState.success(response.movies);
      } catch (e){
        print(e.toString());
        yield TrendingMoviesState.failed();
      }
    }
  }

}