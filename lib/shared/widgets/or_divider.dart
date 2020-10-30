import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height:1,
            color: white20,
          ),
        ),
        SizedBox(width:10),
        Text(
          'Or',
          style: TextStyle(
            color: white40,
            fontSize: 14
          ),
        ),
        SizedBox(width:10),
        Flexible(
          flex: 1,
          child: Container(
            height:1,
            color: white20,
          ),
        ),
      ],
    );
  }
}