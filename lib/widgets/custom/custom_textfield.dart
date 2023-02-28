import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.onPressedEye,
      this.obscureText = false});
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final void Function()? onPressedEye;

  sufixIconCondition() {
    if (labelText == "Enter Your Password") {
      return IconButton(
        icon: Icon(
            //for obscuretext true and false with icons
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.black),
        onPressed: onPressedEye,
      );
    } else if (hintText == "Search Courses here.....") {
      return const Icon(
        CupertinoIcons.search,
      );
    } else
      null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          hintText: hintText,
          hintStyle: mainFont(fontSize: 12),
          suffixIcon: sufixIconCondition(),
          label: Text(labelText.toString()),
          labelStyle: mainFont(),
        ),
      ),
    );
  }
}
