import 'package:flutter/material.dart';

//TODO: implement something to keep widgets alive when scrolling up

class CustomExpansionTile extends StatefulWidget {
  final Widget headerUnselected;
  final Widget headerSelected;
  final List<Widget> children;
  final Color childrenBackgroundColor;
  final bool initiallyExpanded;
  final EdgeInsets childrenMargin;

  CustomExpansionTile({
    this.children,
    @required this.headerSelected,
    this.headerUnselected,
    this.childrenBackgroundColor,
    this.childrenMargin,
    this.initiallyExpanded = false,
  });
  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.initiallyExpanded;
    super.initState();
  }

  List<Widget> _buildList() {
    List<Widget> buildList = [];
    buildList.add(GestureDetector(
      child: _isExpanded ? widget.headerSelected : widget.headerUnselected,
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
    ));

    if (_isExpanded && widget.children != null) {
      widget.children.forEach((child) {
        buildList.add(child);
      });
    }
    return buildList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildList(),
      ),
    );
  }
}
