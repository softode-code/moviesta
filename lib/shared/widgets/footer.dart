import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.text,
    @required this.actionText,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final String actionText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: white60,
            fontWeight: FontWeight.w300
          ),
        ),
        SizedBox(width:5),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionText,
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
          ),
        )
      ],
    );
  }
}