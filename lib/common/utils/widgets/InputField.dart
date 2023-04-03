import 'package:flutter/material.dart';

import '../../constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String text;
  final Function()? onSubmit;
  final TextInputAction? textInputAction;
  final String? hinttext;
  final bool obscureText;
  final Color? color;

  const InputField(
      {super.key, this.text = "",
      this.color,
      this.onSubmit,
      this.textInputAction,
      this.hinttext,
      this.validator,
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding:const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
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
              decoration:const InputDecoration(border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}
