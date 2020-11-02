import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/screens/discover/popular_movies.dart';
import 'package:moviesta/screens/discover/search_bar.dart';
import 'package:moviesta/screens/discover/trending_movies.dart';

class DiscoverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:60 , left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: TextStyle(
                  color: onBackground,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height:30),
              SearchBar(),
              SizedBox(height: 20,),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopularMovies(),
                    SizedBox(height: 15,),
                    TrendingMovies(),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}