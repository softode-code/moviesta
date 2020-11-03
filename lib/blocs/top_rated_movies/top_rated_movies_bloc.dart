import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/top_rated_movies/top_rated_movies_event.dart';
import 'package:moviesta/blocs/top_rated_movies/top_rated_movies_state.dart';
import 'package:moviesta/models/movie_response.dart';
import 'package:moviesta/repositories/movie_repository.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {

  final MovieRepository _movieRepository;

  TopRatedMoviesBloc({MovieRepository movieRepository}) 
    : _movieRepository = movieRepository,
      super(TopRatedMoviesState.initial());

  @override
  Stream<TopRatedMoviesState> mapEventToState(TopRatedMoviesEvent event) async* {
    if(event is TopRatedMoviesEventLoad){
      yield TopRatedMoviesState.loading();
      try{
        MovieResponse response  = await _movieRepository.getTopRatedMovies();
        yield TopRatedMoviesState.success(response.movies);
      } catch (e){
        print(e.toString());
        yield TopRatedMoviesState.failed();
      }
    }
  }

}