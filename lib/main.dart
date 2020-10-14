import 'package:flutter/material.dart';
import 'package:order_it/widgets/loginForm.dart';
import 'package:flutter/services.dart';

void main() => runApp(OrderIt());

class OrderIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF213045)),
        primaryColor: Color(0xFF213045),
      ),
      home: LogInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final signUpBtn = FlatButton(
      shape: StadiumBorder(),
      onPressed: () {},
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('New Here?', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 5),
            Text(
              'Sign Up.',
              style: TextStyle(
                  color: Color(0xFF03B5CF), fontWeight: FontWeight.bold),
            )
          ]));

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: new Scaffold(
        //Login Screen with Stack as its Root widget
        body: new Stack(
          children: <Widget>[
            //Blue Background Widget
            Container(
              color: Color(0xFF213045),
              child: Align(alignment: Alignment.bottomCenter, child: signUpBtn),
            ),
            appTitle(),

            Container(
              margin: EdgeInsets.fromLTRB(5, 150, 0, 0),
              height: 400,
              width: 350,
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget appTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
      height: 150,
      width: 360,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tas',
                style: TextStyle(
                    fontSize: 65, fontFamily: 'myFont2', color: Colors.white60),
              ),
              Text(
                'Tea',
                style: TextStyle(
                    fontSize: 65, fontFamily: 'myFont2', color: Color(0xFF03B5CF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
