import 'package:flutter/material.dart';
import 'package:slacker/widgets/buttons/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:slacker/widgets/form_widgets/form_hyper_text.dart';
import 'package:slacker/widgets/bottom_sheets/login_bottom_sheet.dart';
import 'package:slacker/widgets/bottom_sheets/register_bottom_sheet.dart';

//TODO: Add Forgot password
//TODO: Add password eye
//TODO: If signed in, change button to view highlines, or skip to the home page

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250.0,
            ),
            SizedBox(
              width: 250.0,
              child: TypewriterAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: ["  Slacker"],
                textStyle: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffca815),
                ),
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                totalRepeatCount: 1,
                speed: Duration(milliseconds: 400),
              ),
            ),
            RoundedButton(
              onPressed: () {
                RegisterBottomSheet.showRegisterBottomSheet(context, false);
              },
              text: 'Register',
              textColor: Colors.white,
              backgroundColor: Color(0xff1779b1),
            ),
            RoundedButton(
              onPressed: () {
                LoginBottomSheet.showLoginBottomSheet(context, false);
              },
              text: 'Sign In',
              backgroundColor: Colors.transparent,
              borderWidth: 2.0,
              borderColor: Color(0xff1779b1),
              textColor: Color(0xff1779b1),
            ),
            FormHyperText(
              linkText: 'Use Offline',
              onTap: () {
                print('Use Offline'); //TODO: Implement Use offline
              },
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
