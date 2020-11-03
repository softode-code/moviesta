import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_bloc.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_event.dart';
import 'package:moviesta/blocs/trending_movies/trending_movies_state.dart';
import 'package:moviesta/repositories/movie_repository.dart';
import 'package:moviesta/res/color.dart';

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
              if(state.movies != null){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      listLength, (index) {
                        return Container(
                          margin: EdgeInsets.only(left: 5, right:5),
                          height: 161,
                          width: 108,
                          decoration: BoxDecoration(
                            color:  index == listLength -1 ? white40 : white10,
                            borderRadius: BorderRadius.circular(4),
                            image: index == listLength -1 ? null : DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://image.tmdb.org/t/p/w200/'+state.movies[index].poster)
                            )
                          ),
                          child: index == listLength-1 ? Center(
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: onBackground,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0
                              ),
                            ),
                          ) : null
                        );
                      }
                    ),
                  ),
                );
              }
              else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      listLength, (index) {
                        return Container(
                          margin: EdgeInsets.only(left: 5, right:5),
                          height: 161,
                          width: 108,
                          decoration: BoxDecoration(
                            color: white10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }
                    )
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}