import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  static const String id = 'guide_screen';
  final String guideName;
  final guideData;

  GuideScreen({
    this.guideName,
    this.guideData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '$guideName Guide',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: 1,
        onTap: (index) {
          print(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: 'Guide'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Line'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
