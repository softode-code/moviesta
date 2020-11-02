import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class TrendingMovies extends StatelessWidget {
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
                    color:  index == 7 ? white40 : white10,
                    borderRadius: BorderRadius.circular(4)
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
            ),
          ),
        )
      ],
    );
  }
}