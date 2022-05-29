import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/Screens/Login/components/background.dart';
import 'package:miniproject/Screens/Login/login_screen.dart';
import 'package:miniproject/Screens/Signup/components/social_icon.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/components/already_have_an_account_acheck.dart';
import 'package:miniproject/components/rounded_button.dart';
import 'package:miniproject/components/rounded_input_field.dart';
import 'package:miniproject/components/rounded_password_field.dart';

import 'or_divider.dart';

TextEditingController userSignUpController = TextEditingController();
TextEditingController passSignUpController = TextEditingController();
TextEditingController emailSignUpController = TextEditingController();

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                emailSignUpController.text = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Username",
              onChanged: (value) {
                userSignUpController.text = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passSignUpController.text = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                print("object");
                Api().signUp(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
