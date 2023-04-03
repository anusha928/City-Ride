import 'package:flutter/cupertino.dart';

class BigTexts extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigTexts({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 25,
    this.overFlow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w500),
    );
  }
}
