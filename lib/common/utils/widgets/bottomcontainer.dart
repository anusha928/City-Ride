

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'Clickbutton.dart';
import 'InputField.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
       padding: EdgeInsets.symmetric(horizontal: 40),
       child: Column(
          mainAxisSize: MainAxisSize.max,
         children: 
        [
         SizedBox(
           height: ScreenHeights.screeheight / 40,
         ),
         InputField(
           hinttext: "Your location",
         ),
         SizedBox(
           height: ScreenHeights.screeheight / 55,
         ),
         InputField(
          hinttext: "Destination",
         ),
         SizedBox(
           height: ScreenHeights.screeheight / 40,
         ),
         ClickButton(text: "Find a driver", ontap: () {}),
         
       ]),
                    ),
    );
  }
}