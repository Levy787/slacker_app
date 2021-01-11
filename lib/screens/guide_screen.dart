import 'package:flutter/material.dart';
import 'package:slacker/classes/model_classes/guide_class.dart';

class GuideScreen extends StatelessWidget {
  static const String id = 'guide_screen';
  final Guide guide;

  GuideScreen({
    this.guide,
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
          '${guide.guideName} Guide',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
      body: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              pinned: false,
              expandedHeight: 250.0,
              collapsedHeight: 250.0,
              automaticallyImplyLeading: false,
              //backgroundColor: Colors.white,
              flexibleSpace: Image.asset(
                'assets/images/guide/whitewater_wall/whitewater_wall.jpg',
                fit: BoxFit.fitHeight,
                height: 250.0,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  //GuideScroll(guide: guide),
                ],
              ),
            ),
          ],
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
