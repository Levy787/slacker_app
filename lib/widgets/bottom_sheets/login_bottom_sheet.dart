import 'package:flutter/material.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/widgets/bottom_sheets/register_bottom_sheet.dart';
import 'package:slacker/widgets/form_widgets/form_input_field.dart';
import 'package:slacker/widgets/buttons/rounded_button.dart';
import 'package:slacker/widgets/form_widgets/form_hyper_text.dart';
import 'package:slacker/constants.dart';

class LoginBottomSheet extends StatelessWidget {
  static void showLoginBottomSheet(
    BuildContext context,
    bool shouldPop,
  ) {
    if (shouldPop) {
      Navigator.pop(context);
    }
    showModalBottomSheet(
      shape: kModalSheetShape,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => LoginBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: kBottomSheetDecotarion,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //TODO: Username and password validate
                FormInputField(
                  titleText: 'Username/Email',
                  titleTextColor: kFormTextInputHeadingColor,
                  autofocus: false,
                  outlineColor: kFormThemeColor,
                ),
                FormInputField(
                  titleText: 'Password',
                  titleTextColor: kFormTextInputHeadingColor,
                  outlineColor: kFormThemeColor,
                  isPassword: true,
                ),
                FormHyperText(
                  linkText: 'Forgot Password?',
                  linkTextColor: kFormThemeColor,
                  onTap: () {
                    print('Forgot Password');
                  }, //TODO: Implement Forgot Passowrd
                  fontSize: 16,
                  margin: EdgeInsets.only(right: 10.0, top: 5.0),
                ),
                RoundedButton(
                  text: 'Sign In',
                  onPressed: () {
                    print('sign in');
                    Navigator.popAndPushNamed(context, LoadingScreen.id);
                  }, //TODO: Firebase Signin
                  backgroundColor: kFormThemeColor,
                  textColor: Colors.white,
                  margin: EdgeInsets.fromLTRB(10.0, 15, 10.0, 0.0),
                ),
                FormHyperText(
                  normalText: 'Don\'t have an account?',
                  linkText: 'Register',
                  linkTextColor: kFormThemeColor,
                  onTap: () => RegisterBottomSheet.showRegisterBottomSheet(
                      context, true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
