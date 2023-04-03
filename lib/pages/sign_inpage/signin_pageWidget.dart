import 'package:city_ride/common/utils/widgets/Clickbutton.dart';
import 'package:city_ride/common/utils/widgets/bigTexts.dart';
import 'package:city_ride/common/utils/widgets/smalltexts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../common/utils/widgets/InputField.dart';
import '../registerpage/registerScreen.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

 // bool _isloading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding:const  EdgeInsets.symmetric(horizontal: 15),
        color: AppColors.appBackgroundColor,
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.18),
                    child: BigTexts(
                      text: "Login",
                      size: 30,
                    )),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                SmallTexts(
                    text: "You must login to access this service"),
                const SizedBox(
                  height: ScreenHeights.screeheight / 20,
                ),
                Container(
                    padding:const EdgeInsets.symmetric(horizontal: 26),
                    child: InputField(
                      controller: _emailcontroller,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email field can't be empty";
                        }
                        final isvalid = EmailValidator.validate(val);
                        if (isvalid) {
                          return null;
                        } else {
                          return "Enter valid email address";
                        }
                      },
                      text: "USERNAME OR EMAIL",
                      hinttext: "example@gail.com",
                    )),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                Container(
                    padding:const EdgeInsets.symmetric(horizontal: 26),
                    child: InputField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password field can't be empty";
                        } else if (val.length < 5) {
                          return "Password should be of atleast 6 characters";
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordcontroller,
                      text: "PASSWORD",
                      hinttext: "*******",
                      obscureText: true,
                    )),
                const SizedBox(
                  height: ScreenHeights.screeheight / 50,
                ),
                Align(
                    alignment: Alignment.center,
                    child: SmallTexts(
                      text: "Forget Password",
                      color: Colors.black,
                      size: 18,
                    )),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ClickButton(
                        text: "Login",
                        ontap: () {
                          // if (_formkey.currentState!.validate()) {
                          //   context.read<SigninCubit>().SignIn(
                          //       email: _emailcontroller.text,
                          //       password: _passwordcontroller.text);
                          // }
                        })),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SmallTexts(text: "Don't have an account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>const RegisterScreen(),
                        ));
                      },
                      child: SmallTexts(
                        weight: FontWeight.bold,
                        text: "SignUp",
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                SmallTexts(text: "or signin with"),
                const SizedBox(
                  height: ScreenHeights.screeheight / 40,
                ),
                const Image(
                    image: AssetImage(
                  "assets/image/googlelogin1.png",
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
