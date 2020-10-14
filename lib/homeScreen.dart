/*This Screen holds
A Row wrapped inside a Container Widget which holds
  Drawer Button
  Search Bar
  Cart button
  
A listView at Center Holding
  Snack Button
  Drinks Button
  
Live Chat button at Bottom Right of Screen, which is under construction right now */

import 'package:flutter/material.dart';
import 'package:order_it/widgets/drawer.dart' as prefix1;
import 'package:order_it/drinksCategory.dart';
import 'package:order_it/cart.dart';
import 'package:order_it/snackCategory.dart';
import 'package:order_it/test.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: prefix1.MainDrawer(),
        body: new Stack(children: <Widget>[
          Container(
            //Background Image Hardcoded
            child: Image(
              image: AssetImage('assets/bghome.jpg'),
              fit: BoxFit.fitHeight,
              height: 760,
            ),
          ),
          Positioned(
              top: 40,
              child: Row(children: <Widget>[
                searchBar(context),
              ])),

          //A listView holding Snacks and Drinks Button at Center of Screen
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 200),
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 80,
                ),

                //Snack Button
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF03B5CF))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SnackCategory()));
                    },
                    color: Color(0xFF03B5CF),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/snacks.png'),
                              color: Colors.white,
                              height: 30,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Snacks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))),

                //Drinks Button
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF03B5CF))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrinkCategory()));
                    },
                    color: Color(0xFF03B5CF),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/coffee.png'),
                              color: Colors.white,
                              height: 30,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Drinks',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )))
              ])),

          //Live Chat button at Bottom Right of Screen
          liveChatBtn(context),
        ]));
  }

  Widget liveChatBtn(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(220, 670, 0, 0),
      child: RawMaterialButton(
          shape: StadiumBorder(),
          fillColor: Color(0xFF03B5CF),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Live Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 15),
                )
              ])),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Test()));
            Toast.show('Coming Soon!', context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          }),
    );
  }

  Widget searchBar(context) {
    return Row(
      children: <Widget>[
        Container(
            height: 50,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xFF03B5CF))),
            child: Row(children: <Widget>[
              FlatButton(
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Search',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ])),
        SizedBox(
          width: 8,
        ),
        FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            backgroundColor: Color(0xFF03B5CF),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )),
      ],
    );
  }
}
