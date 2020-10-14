import 'package:flutter/material.dart';

import 'package:toast/toast.dart';

// class MainDrawer extends StatefulWidget {
//   @override
//   _MainDrawerState createState() => _MainDrawerState();
// }

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Stack(children: <Widget>[
      Container(
        //color: Color(0xFF213045),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF213045).withOpacity(0.8),
          Color(0xFF213045),
        ])),
      ),
      ListView(padding: EdgeInsets.zero, children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text(
            'Muhammad Hamza',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          accountEmail: Text(
            'hamza.6.shakeel@gmail.com',
            style: TextStyle(fontSize: 12),
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            //Color(0xFF03B5CF),
          ),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Color(0xFF03B5CF),
              backgroundImage: AssetImage('assets/d.jpg'),
            ),
          ),
        ),
        new Divider(
          color: Color(0xFF03B5CF),
        ),
        listTileDrawer(Icons.person, "Profile"),
        listTileDrawer(Icons.email, "Inbox"),
        listTileDrawer(Icons.history, "Recent Orders"),
        listTileDrawer(Icons.favorite_border, "Favorite"),
        new Divider(
          color: Color(0xFF03B5CF),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          child: new Text(
            "Here's Your Cart",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        new ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          title: Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            Toast.show('Cart Comming Soon!', context);
          },
        ),
        new Divider(
          color: Color(0xFF03B5CF),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          child: new Text(
            'Help us Grow',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        listTileDrawer(Icons.share, "Share App"),
        listTileDrawer(Icons.star, "Rate App"),
        new Divider(
          color: Color(0xFF03B5CF),
        ),
        new ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            })
      ])
    ]));
  }

  Widget listTileDrawer(IconData tileIcon, String tileTitle) => new ListTile(
        leading: Icon(
          tileIcon,
          color: Colors.grey,
        ),
        title: Text(
          tileTitle,
          style: TextStyle(color: Colors.grey),
        ),
      );
}
