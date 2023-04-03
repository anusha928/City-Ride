
import 'package:city_ride/common/constants.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  final TextEditingController? otpcontroller;
//  StreamController(ErrorAnimationType)?

  final void Function(String)? oncompleted;
  const PinCodeField({
    super.key,
    // required this.animationcontroller,

     this.oncompleted,
    required this.otpcontroller
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      cursorColor: AppColors.cursorColor,
      autoFocus: true,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: AppColors.clickButtonColor,
        inactiveColor: AppColors.clickButtonColor,
        selectedFillColor: const Color.fromARGB(255, 222, 219, 219),
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      animationDuration:const  Duration(milliseconds: 500),

      enableActiveFill: true,
      // errorAnimationController: animationcontroller,
      controller: otpcontroller,
      onCompleted: oncompleted,
      onChanged: (v) {
        print("val");
      },
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
