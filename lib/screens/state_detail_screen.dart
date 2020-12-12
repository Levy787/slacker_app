import 'package:flutter/material.dart';
import 'package:slacker/constants.dart';

class StateDetailScreen extends StatefulWidget {
  static const id = 'state_detail_screen';
  final Map<String, Map<String, Map<String, List<String>>>> stateDetails;

  StateDetailScreen(this.stateDetails);

  @override
  _StateDetailScreenState createState() => _StateDetailScreenState();
}

class _StateDetailScreenState extends State<StateDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('Back');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: TextField(
          maxLines: 1,
          decoration: kAppBarSearchBarDecoration,
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StateDetailScrollWidget(detailsMap: widget.stateDetails),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.landscape_outlined), label: 'Guide'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: 'Favourites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}

class StateDetailScrollWidget extends StatelessWidget {
  final Map<String, Map<String, Map<String, List<String>>>> detailsMap;
  StateDetailScrollWidget({this.detailsMap});

  List<Widget> generateTemplate() {
    List<Widget> returnWidgets = [];
    detailsMap.forEach((key, value) {
      returnWidgets.add(
        Text(
          key.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
      );
      value.forEach((key, value) {
        returnWidgets.add(
          Text(
            key.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        );
        value.forEach((key, value) {
          returnWidgets.add(
            Text(
              key.toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          );
          returnWidgets.add(buildHozListView(value));
        });
      });
    });
    return returnWidgets;
  }

  Widget buildHozListView(List<String> listItems) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                height: 170.0,
                width: 170.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
              ),
              Text(
                listItems[index],
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
        itemCount: listItems.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: generateTemplate(),
        ),
      ],
    );
  }
}

/*final Map<String, Map<String, Map<String, List<String>>>> stateDetails = {
    'Tasmania': {
      'North East Tasmania': {
        'Launceston': [
          'Cataract Gorge',
        ],
        'Ben Lomond': [
          'Ben Lomond Guide',
        ],
        'North Esk': [
          'Near the Bridge',
        ],
        'Freycinet': [
          'Whitewater Wall',
          'The Underworld',
          'Nicholas\' Needle',
        ],
      },
      'North West Tasmania': {
        'Cradle Mountain - Lake St Clair National Park': [
          'Mt Geryon and The Acropolis',
        ],
        'Devils Gullet': [
          'Devils Gullet',
        ],
        'Tarkine and the North West': [
          'Sisters Beach',
          'Sumac Blockade',
          'Trowutta Arch',
        ],
        'Frenchmans Cap': [
          'Frenchmans Cap',
        ],
        'Tyndall Ranges': [
          'Tyndall\'s',
        ],
      },
      'South East Tasmania': {
        'Hobart': [
          'Suburban',
          'Mt Wellington',
          'Wellington Falls',
          'Tinderbox',
        ],
        'Tasman Peninsula': [
          'Cape Hauy',
          'The Moai',
          'Cape Pillar',
          'Mt Brown',
          'Cape Raoul',
          'Waterfall Bay',
        ],
      },
      'South West Tasmania': {
        'Mt Field National Park': [
          'Big Tree Reserve',
        ],
        'Lonnavale': [
          'Bluegum Forest',
        ],
        'Federation Peak': [
          'Fed Peak',
        ],
      },
      'Islands': {
        'Bruny Island': [],
      },
    }
  };*/
