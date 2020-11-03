import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/popular_movies/popular_movies_event.dart';
import 'package:moviesta/blocs/popular_movies/popular_movies_state.dart';
import 'package:moviesta/models/movie.dart';
import 'package:moviesta/models/movie_response.dart';
import 'package:moviesta/repositories/movie_repository.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {

  final MovieRepository _movieRepository;

  PopularMoviesBloc({MovieRepository movieRepository}) 
    : _movieRepository = movieRepository,
      super(PopularMoviesState.initial());

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if(event is PopularMoviesEventLoad){
      yield PopularMoviesState.loading();
      try{
        MovieResponse response  = await _movieRepository.getPopularMovies();
        yield PopularMoviesState.success(response.movies);
      } catch (e){
        print(e.toString());
        yield PopularMoviesState.failed();
      }
    }
  }

}