import 'package:city_ride/pages/map_page/mappage_widget.dart';
import 'package:city_ride/pages/otppage/cubit/phoneAuthcubit.dart';
import 'package:city_ride/pages/phoneNum/phoneNum_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          title: '',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const PhoneNumScreen(),
        ),
      ),
    );
  }
}
