import 'package:flutter/material.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/widgets/buttons/rounded_button.dart';
import 'package:slacker/widgets/form_widgets/form_hyper_text.dart';
import 'package:slacker/widgets/bottom_sheets/login_bottom_sheet.dart';
import 'package:slacker/widgets/form_widgets/form_input_field.dart';
import 'package:slacker/constants.dart';

class RegisterBottomSheet extends StatelessWidget {
  static void showRegisterBottomSheet(
    BuildContext context,
    bool shouldPopNavigation,
  ) {
    if (shouldPopNavigation) {
      Navigator.pop(context);
    }
    showModalBottomSheet(
      shape: kModalSheetShape,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => RegisterBottomSheet(),
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
              'Create Account',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormInputField(
                  titleText: 'Full Name',
                  titleTextColor: kFormTextInputHeadingColor,
                  outlineColor: kFormThemeColor,
                  autofocus: false,
                ),
                FormInputField(
                  titleText: 'Username',
                  titleTextColor: kFormTextInputHeadingColor,
                  outlineColor: kFormThemeColor,
                ),
                FormInputField(
                  titleText: 'Email Address',
                  titleTextColor: kFormTextInputHeadingColor,
                  outlineColor: kFormThemeColor,
                ),
                FormInputField(
                  titleText: 'Password',
                  titleTextColor: kFormTextInputHeadingColor,
                  outlineColor: kFormThemeColor,
                  isPassword: true,
                ),
                RoundedButton(
                  text: 'Register',
                  onPressed: () {
                    print('Register');
                    Navigator.popAndPushNamed(context, LoadingScreen.id);
                  },
                  backgroundColor: kFormThemeColor,
                  borderWidth: 0.0,
                  textColor: Colors.white,
                  margin: EdgeInsets.fromLTRB(10.0, 15, 10.0, 5.0),
                ),
                FormHyperText(
                  normalText: 'Already have an account?',
                  linkText: 'Sign In',
                  linkTextColor: kFormThemeColor,
                  onTap: () =>
                      LoginBottomSheet.showLoginBottomSheet(context, true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
