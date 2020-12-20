import 'package:flutter/material.dart';
import 'package:slacker/widgets/text_fields/search_field.dart';

class GuideSelectTabAppBar extends StatelessWidget {
  GuideSelectTabAppBar(
      {Key key,
      @required this.tabs,
      this.innerBoxIsScrolled,
      this.focusNode,
      this.isFocused,
      this.onFocusChanged,
      this.unFocus})
      : super(key: key);

  final bool innerBoxIsScrolled;
  final List<String> tabs;
  final FocusNode focusNode;
  final bool isFocused;
  final Function onFocusChanged;
  final Function unFocus;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 2.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SearchField(
              hintText: 'Search',
              fillColor: Color(0xfff1f2f5),
              outlineColor: Colors.blue,
              focusNode: focusNode,
            ),
          ),
          SizedBox(width: 20.0),
          Container(
            alignment: Alignment.center,
            width: 70.0,
            child: !isFocused
                ? InkWell(
                    child: Text(
                      'Filters',
                      style: TextStyle(color: Colors.blue, fontSize: 18.0),
                    ),
                    onTap: () {
                      print('Display modal bottom sheet');
                      //TODO: ModalBottomSheet for filters
                      //https://dribbble.com/shots/6209811-Hotel-Booking-Filter-and-Search-Screen
                    },
                  )
                : InkWell(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue, fontSize: 18.0),
                    ),
                    onTap: () {
                      focusNode.unfocus();
                    },
                  ),
          )
        ],
      ),
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      forceElevated: innerBoxIsScrolled,
      bottom: TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        isScrollable: true,
        tabs: tabs.map((String name) => Tab(text: name)).toList(),
      ),
    );
  }
}
