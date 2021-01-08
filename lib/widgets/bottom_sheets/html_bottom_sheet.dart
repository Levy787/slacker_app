import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:slacker/screens/explore_screen.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/widgets/buttons/rounded_button.dart';
import 'package:slacker/widgets/form_widgets/form_hyper_text.dart';
import 'package:slacker/widgets/bottom_sheets/login_bottom_sheet.dart';
import 'package:slacker/widgets/form_widgets/form_input_field.dart';
import 'package:slacker/constants.dart';

class HtmlBottomSheet extends StatelessWidget {
  static void showHtmlBottomSheet(
    BuildContext context,
    String stateWeatherHtml,
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
      builder: (context) => HtmlBottomSheet(stateWeatherHtml),
    );
  }

  HtmlBottomSheet(this.stateWeatherHtml);

  final String stateWeatherHtml;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[900]),
            width: 75.0,
            height: 5.0,
          ),
          SizedBox(height: 5.0),
          Container(
            height: 550.0,
            //padding: EdgeInsets.only(top: 15.0),
            decoration: kBottomSheetDecotarion,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Html(
                data: stateWeatherHtml,
                onLinkTap: (src) {
                  print(src);
                },
                //TODO: Add all styles
                style: {
                  'h2': Style(
                    fontFamily:
                        Theme.of(context).textTheme.headline3.fontFamily,
                    fontSize: FontSize(
                        Theme.of(context).textTheme.headline4.fontSize),
                    color: Theme.of(context).textTheme.headline3.color,
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
