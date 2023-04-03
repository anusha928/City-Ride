// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class SmallTexts extends StatelessWidget {
  Color? color;
  double height;
  final String text;
   FontWeight? weight ;
  double size;

  SmallTexts({
    super.key,
    this.color = const Color(0xFF808080),
    required this.text,
    this.height = 1.2,
    this.weight,
    this.size = 19,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        fontWeight: weight
      ),
    );
  }
}
