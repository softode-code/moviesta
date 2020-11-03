import 'package:flutter/material.dart';
import 'package:moviesta/models/movie_response.dart';
import 'package:moviesta/repositories/movie_repository.dart';
import 'package:moviesta/res/color.dart';

class PopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: MovieRepository().getPopularMovies(),
      builder: (context, snapshot){
        MovieResponse movieResponse = snapshot.data;
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  8, (index) {
                    return Container(
                      margin: EdgeInsets.only(left: 5, right:5),
                      height: 161,
                      width: 108,
                      decoration: BoxDecoration(
                        color: index == 7 ? white40 : white10,
                        borderRadius: BorderRadius.circular(4),
                        image: index == 7 ? null :
                          DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://image.tmdb.org/t/p/w200/'+movieResponse.movies[index].poster)
                          )
                      ),
                      child: index == 7 ? Center(
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
            )
          ],
        );
      }
    );
  }
}