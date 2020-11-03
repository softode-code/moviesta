import 'package:flutter/material.dart';
import 'package:moviesta/models/movie.dart';
import 'package:moviesta/res/color.dart';

class MoviesRow extends StatelessWidget {
  const MoviesRow({
    Key key,
    @required this.listLength,
    @required this.movies,
  }) : super(key: key);

  final int listLength;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    if(movies != null){
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
                  color: index == listLength-1 ? white40 : white10,
                  borderRadius: BorderRadius.circular(4),
                  image: index == listLength-1 ? null : DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/w200/'+movies[index].poster)
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
          )
        ),
      );
    } else {
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
  }
}