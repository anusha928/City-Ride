import 'package:city_ride/common/constants.dart';
import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  final String text;
  final void Function() ontap;

  const ClickButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.clickButtonColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
