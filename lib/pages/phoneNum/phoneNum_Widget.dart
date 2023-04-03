import 'package:city_ride/common/cubit.dart';
import 'package:city_ride/common/constants.dart';
import 'package:city_ride/pages/otppage/cubit/phoneAuthcubit.dart';
import 'package:city_ride/pages/otppage/otpscreen.dart';
import 'package:city_ride/common/utils/widgets/Clickbutton.dart';
import 'package:city_ride/common/utils/widgets/bigTexts.dart';
import 'package:city_ride/common/utils/widgets/smalltexts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../common/utils/snackbar.dart';

class PhoneNumWidget extends StatefulWidget {
  const PhoneNumWidget({super.key});

  @override
  State<PhoneNumWidget> createState() => _PhoneNumWidgetState();
}

class _PhoneNumWidgetState extends State<PhoneNumWidget> {
  generateCountryFlag() {
    String countrycode = 'np';

    String flag = countrycode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  Widget phoneFormField() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding:const EdgeInsets.only(top: 12, left: 8),
                child: Text(
                  generateCountryFlag() + "+977",
                  style:const TextStyle(fontSize: 20),
                ),
              ),
            )),
       const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: digitcontroller,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                    {}
                    
                  },
                  cursorColor: AppColors.cursorColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field cannot be empty';
                    } else if (value.length > 10 || value.length < 10) {
                      return 'Invalid phone number';
                    } else {
                      return null;
                    }
                  },
                  style:const TextStyle(fontSize: 20, letterSpacing: 1.2),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration:const InputDecoration(border: InputBorder.none),
                ),
              ),
            )),
      ],
    );
  }

  TextEditingController digitcontroller =
      TextEditingController(text: "9841749626");
  bool isloading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isloading,
      child: Scaffold(
          backgroundColor: AppColors.appBackgroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocListener<AuthCubit, CommonState>(
                listener: (context, state) {
                  if (state is Commonloading) {
                    setState(() {
                      isloading = true;
                    });
                  } else {
                    setState(() {
                      isloading = false;
                    });
                  }

                  if (state is Commonerror) {
                    Snackabar.showSnackbar(
                        context: context, message: state.message);
                  }
                  if (state is NumSubmitedstate) {
                    Snackabar.showSnackbar(
                        context: context, message: "OTP successfully sent");
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>const OTPscreen(),
                    ));
                  }
                },
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                     const  SizedBox(
                        height: ScreenHeights.cabContainerHeight,
                        child: const Image(
                          image: AssetImage(
                            "assets/image/cab3.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: ScreenHeights.screeheight / 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BigTexts(text: "Enter your mobile number"),
                            const SizedBox(
                              height: ScreenHeights.screeheight / 70,
                            ),
                            SmallTexts(
                                text:
                                    "Verify your account using phone number.We send you a one time verification code"),
                            const SizedBox(
                              height: ScreenHeights.screeheight / 50,
                            ),
                            phoneFormField(),
                            const SizedBox(
                              height: ScreenHeights.screeheight / 20,
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: ClickButton(
                                    text: "Next",
                                    ontap: () {
                                      if (_formkey.currentState!.validate()) {
                                        context.read<AuthCubit>().phoneAuth(
                                            phoneNumber:
                                                "+977${digitcontroller.text}");
                                      }
                                    }))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
