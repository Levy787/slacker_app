import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/constants.dart';
import 'package:slacker/screens/state_detail_screen.dart';
import 'package:slacker/widgets/state_tile.dart';

class StateScreen extends StatefulWidget {
  static const id = 'state_screen';
  final List<dynamic> states;
  final HighlineDbProvider db;

  StateScreen({this.states, this.db});

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return StateTile(
            name: widget.states[index],
            description: 'Description Here',
            onTap: () {
              widget.db
                  .getStateDetailData(widget.states[index])
                  .then((stateDetailData) {
                Navigator.pushNamed(
                  context,
                  StateDetailScreen.id,
                  arguments: stateDetailData,
                );
              });
            },
          );
        },
        itemCount: widget.states.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed_outlined), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.landscape_outlined), label: 'Guide'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
