import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:city_ride/common/cubit.dart';
import 'package:city_ride/pages/map_page/mappage_widget.dart';
import 'package:city_ride/pages/otppage/cubit/phoneAuthcubit.dart';
import 'package:city_ride/common/utils/snackbar.dart';

import '../../common/constants.dart';
import '../../common/utils/widgets/Clickbutton.dart';
import '../../common/utils/widgets/bigTexts.dart';
import '../../common/utils/widgets/pincodefield.dart';
import '../../common/utils/widgets/smalltexts.dart';

class OTPwidget extends StatefulWidget {
  const OTPwidget({
    super.key,
  });

  @override
  State<OTPwidget> createState() => _OTPwidgetState();
}

class _OTPwidgetState extends State<OTPwidget> {
  
  bool isLoading = false;
  final TextEditingController _otpcontroller = TextEditingController();
 int? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: SafeArea(
            child: Container(
          padding:const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: BlocListener<AuthCubit, CommonState>(
            listener: (context, state) {
              if (state is Commonloading) {
                setState(() {
                  isLoading = true;
                });
              } else {
                setState(() {
                  isLoading = false;
                });
              }
              if (state is OTPverifiedstate) {
                Snackabar.showSnackbar(
                    context: context,
                    message: "Phone number verified successfully ");
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>const MapPageWidget(),
                ));
              }
              if (state is Commonerror) {
                Snackabar.showSnackbar(
                    context: context, message: state.message);
              }
            },
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: ScreenHeights.screeheight / 40,
                    ),
                    BigTexts(
                      text: "Verify your phone number",
                    ),
                    const SizedBox(
                      height: ScreenHeights.screeheight / 30,
                    ),
                    SmallTexts(
                        text: "Please enter the code send to $phoneNumber"),
                    const SizedBox(
                      height: ScreenHeights.screeheight / 15,
                    ),
                    PinCodeField(
                      otpcontroller: _otpcontroller,
                      
                    ),
                    const SizedBox(
                      height: ScreenHeights.screeheight / 15,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ClickButton(
                      text: "Verify",
                      ontap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => MapPageWidget(),));
                        context
                            .read<AuthCubit>()
                            .submitOTP(_otpcontroller.text);
                      }),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
