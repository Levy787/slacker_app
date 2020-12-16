import 'package:flutter/material.dart';
import 'package:slacker/classes/state_line_info.dart';
import 'package:slacker/widgets/state_display_card.dart';

class SliverImageAppBar extends StatelessWidget {
  final String imageDirectory;
  final StateLineInfo stateLineInfo;

  SliverImageAppBar({
    @required this.imageDirectory,
    @required this.stateLineInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: StateDisplayCard(
          imageDirectory: imageDirectory,
          stateLineInfo: stateLineInfo,
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
