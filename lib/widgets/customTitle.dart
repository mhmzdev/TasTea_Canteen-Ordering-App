import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  CustomTitle({@required this.firstPart, @required this.secondPart});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 90, 0, 0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstPart,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                secondPart,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    letterSpacing: 2,
                    fontFamily: 'myFont3'
                    ),
              ),
            ],
          ),
    );
  }
}