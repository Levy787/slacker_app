import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slacker/screens/guide_screen.dart';
import 'package:slacker/screens/loading_screen.dart';

class DropdownContainer extends StatefulWidget {
  final List<String> children;
  final String header;
  final Color headerExpandedColor;
  final Color headerContractedColor;
  final TextStyle headerExpandedTextStyle;
  final TextStyle headerContractedTextStyle;
  final EdgeInsets padding;

  DropdownContainer({
    @required this.header,
    @required this.children,
    this.headerExpandedColor = Colors.white,
    this.headerContractedColor = Colors.white,
    this.headerExpandedTextStyle,
    this.headerContractedTextStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  });

  @override
  _DropdownContainerState createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  bool isExpanded = false;

  List<Widget> buildChildren(List<String> children) {
    List<Widget> returnChildren = [];
    children.forEach((child) {
      returnChildren.add(
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              LoadingScreen.id,
              arguments: {
                'route': GuideScreen.id,
                'arguments': {'guideName': child}
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                Icon(Icons.landscape),
                SizedBox(width: 20.0),
                Text(
                  '$child guide',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return returnChildren;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isExpanded
                  ? widget.headerExpandedColor
                  : widget.headerContractedColor,
              border: Border(
                top: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.header,
                    overflow: TextOverflow.ellipsis,
                    style: isExpanded
                        ? widget.headerExpandedTextStyle
                        : widget.headerContractedTextStyle,
                  ),
                ),
                Icon(!isExpanded ? Icons.add : Icons.remove),
              ],
            ),
          ),
        ),
        Offstage(
          offstage: !isExpanded,
          child: Container(
            color: Colors.blueGrey[100],
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: buildChildren(widget.children),
            ),
          ),
        )
      ],
    );
  }
}
