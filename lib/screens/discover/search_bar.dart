import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviesta/res/color.dart';
import 'package:moviesta/shared/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: white20,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/search.svg', color: white60, height: 25, width: 25,),
          SizedBox(width: 10,),
          Expanded(
            child: TextFormField(
              maxLines: 1,
              decoration: inputDecoration.copyWith(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: white60,
                  fontSize: 14
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}