import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExploreGeneralInformationScreen extends StatelessWidget {
  static const String id = 'explore_general_information';
  final String displayHtml;
  ExploreGeneralInformationScreen({this.displayHtml});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Html(
        data: displayHtml,
      ),
    );
  }
}
