import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  const CustomeTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon});
  final String? hintText;
  final Widget? suffixIcon;
  final String? labelText;
  final bool obscureText;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  late bool obscure;

  @override
  initState() {
    obscure = widget.obscureText;
    super.initState();
  }

  Widget? sufixIconCondition() {
    if (obscure) {
      return IconButton(
        icon: Icon(
            //for obscuretext true and false with icons
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black),
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
      );
    }

    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: mainPadding,
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          hintText: widget.hintText,
          hintStyle: mainFont(fontSize: 12),
          suffixIcon: sufixIconCondition(),
          label: Text(widget.labelText ?? ""),
          labelStyle: mainFont(),
        ),
      ),
    );
  }
}
