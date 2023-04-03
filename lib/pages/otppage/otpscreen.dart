import 'dart:convert';

import 'package:city_ride/pages/otppage/cubit/phoneAuthcubit.dart';
import 'package:city_ride/pages/otppage/otpWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPscreen extends StatelessWidget {
  
  const OTPscreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return OTPwidget();
  }
}
