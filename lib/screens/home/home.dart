import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:60, left:20, right:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    color: onBackground,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 3,),
                Text(
                  'From your watchlist',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: white80
                  ),
                ),
                SizedBox(height:20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    8, (index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: white30,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 66,
                              decoration: BoxDecoration(
                                color: white50,
                                borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Once Upon a Snowman',
                                  style: TextStyle(
                                    color: onBackground,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(height:5),
                                Container(
                                  constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width - 140),
                                  child: Text(
                                    'The previously untold origins of Olaf, the innocent and insightful, summer-loving snowman are revealed as we follow Olaf’s first steps as he comes to life and searches for his identity in the snowy mountains outside Arendelle.',
                                    style: TextStyle(
                                      color: white70,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600
                                    ),
                                    maxLines: 5,
                                    //textWidthBasis: TextWidthBasis.parent,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}