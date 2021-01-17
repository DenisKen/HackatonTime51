import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    width: 110,
                    height: 110,
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                )),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.brown.shade800,
                      radius: 50,
                      child: Text('AH'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Align(alignment: Alignment.center, child: Text('1')),
                ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
