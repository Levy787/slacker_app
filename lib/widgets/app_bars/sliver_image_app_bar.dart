import 'package:flutter/material.dart';
import 'package:slacker/classes/state_line_info.dart';
import 'package:slacker/widgets/state_display_card.dart';

//TODO: May now be able to delete stateDisplayCard and StateLineInfo files

class SliverImageAppBar extends StatelessWidget {
  final String imageDirectory;

  SliverImageAppBar({
    @required this.imageDirectory,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.transparent,
          child: Image.asset(imageDirectory),
        ),
      ),
      expandedHeight: 250,
      collapsedHeight: 250,
      backgroundColor: Colors.transparent,
      pinned: false,
      automaticallyImplyLeading: false,
    );
  }
}
