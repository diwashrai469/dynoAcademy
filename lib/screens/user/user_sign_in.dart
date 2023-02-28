import 'package:dynoacademy/provider/textfield/textfield_provider.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:dynoacademy/widgets/custom/custom_button.dart';
import 'package:dynoacademy/widgets/custom/custom_text.dart';
import 'package:dynoacademy/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  @override
  Widget build(BuildContext context) {
    final textFieldData = Provider.of<TextFieldProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: width,
            height: height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomeText(
                    text: "Sign in to dynoAcademy",
                    fontweight: FontWeight.bold,
                    fontsize: 23),
                const SizedBox(
                  height: 10,
                ),
                const CustomeTextField(
                    hintText: "Enter Your Valid Email", labelText: "Email"),
                CustomeTextField(
                    obscureText: textFieldData.obsureText,
                    onPressedEye: () {
                      textFieldData.changeObscureText();
                    },
                    hintText: "Enter Your Password",
                    labelText: "Password"),
                const CustomeText(
                  text: "Forgot your Password?",
                  color: Colors.grey,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: mainPadding,
                        child: CustomButton(
                          text: "Login",
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomeText(
                  text: "OR",
                ),
                Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height / 14,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: const CustomeText(text: "Continue with Google"),
                ),
                Text.rich(TextSpan(
                    text: "Don't have and account? ",
                    style: mainFont(),
                    children: <InlineSpan>[
                      TextSpan(
                          text: 'Register', style: mainFont(color: Colors.blue))
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
