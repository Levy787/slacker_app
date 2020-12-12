import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slacker/widgets/bottom_sheets/login_bottom_sheet.dart';
import 'package:slacker/widgets/bottom_sheets/register_bottom_sheet.dart';
import 'package:slacker/widgets/buttons/rounded_button.dart';
import 'package:rive/rive.dart';

const Color buttonColor = Color(0xffE4C5A7);
const double buttonBottomPadding = 80.0;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/animations/welcome_screen_animation.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          //artboard.addController(_controller = SimpleAnimation('idle'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Rive(
            artboard: _riveArtboard,
            fit: BoxFit.fitWidth,
          ),
          Opacity(
            opacity: 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedButton(
                  onPressed: () {
                    RegisterBottomSheet.showRegisterBottomSheet(context, false);
                  },
                  text: 'Register',
                  textColor: Colors.white,
                  backgroundColor: buttonColor,
                ),
                RoundedButton(
                  onPressed: () {
                    LoginBottomSheet.showLoginBottomSheet(context, false);
                  },
                  text: 'Sign In',
                  backgroundColor: Colors.transparent,
                  borderWidth: 2.0,
                  borderColor: buttonColor,
                  textColor: buttonColor,
                ),
                SizedBox(height: buttonBottomPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
