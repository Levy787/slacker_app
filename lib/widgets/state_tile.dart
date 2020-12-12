import 'package:flutter/material.dart';

class StateTile extends StatelessWidget {
  final String name;
  final String description;
  final Function onTap;

  StateTile({
    this.name,
    this.description,
    this.onTap,
  });

  String getStateImageDirectory(String state) {
    String path = 'assets/images/states/';
    path += state.replaceAll(' ', '_');
    path += '_state.png';
    path = path.toLowerCase();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  getStateImageDirectory(name),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 20.0,
                  top: 20.0,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 0, maxWidth: 300),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xCD9E9E9E),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
