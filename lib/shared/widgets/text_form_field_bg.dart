import 'package:flutter/material.dart';


class TextFormFieldBackground extends StatelessWidget {
  const TextFormFieldBackground({
    Key key,
    @required this.child,
  }) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:10.0, horizontal:15.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)
      ),
      child: child
    );
  }
}