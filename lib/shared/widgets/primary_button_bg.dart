import 'package:flutter/material.dart';
import 'package:moviesta/res/color.dart';

class PrimaryButtonBackground extends StatelessWidget {
  const PrimaryButtonBackground({
    Key key, @required this.child,
  }) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: child
    );
  }
}