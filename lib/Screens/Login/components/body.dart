import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/Screens/Predict/predict.dart';
import 'package:miniproject/Screens/Signup/signup_screen.dart';
import 'package:miniproject/Screens/Welcome/components/background.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/components/already_have_an_account_acheck.dart';
import 'package:miniproject/components/rounded_button.dart';
import 'package:miniproject/components/rounded_input_field.dart';
import 'package:miniproject/components/rounded_password_field.dart';
import 'package:miniproject/home.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Username",
              onChanged: (value) {
                userController.text = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passController.text = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                //  Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return MyStatefulWidget();
                //     },
                //   ),
                // );
                Api().login(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
