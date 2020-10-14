import 'package:flutter/material.dart';
import 'package:order_it/menuManagement/addCategory.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
        height: 60,
        width: 320,
        //Row holding the arrow and Cart button
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //back button
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87
                ),
              ),
              //Cart button at right side of screen
              FloatingActionButton(
                  onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCategory()));
                  },
                  backgroundColor: Color(0xFF03B5CF),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ))
            ]));
  }
}
