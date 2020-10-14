/*This Screen holds
A container with blue background
Email Text Field
Password Text Field
Login Button
Forget Password Button
A Container holding above widgets */

import 'package:flutter/material.dart';
import 'package:order_it/homeScreen.dart';
import 'package:toast/toast.dart';

class LoginForm extends StatefulWidget {
  static String tag = 'login-form';

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  int selectedRadioValue;

  @override
  void initState() {
    selectedRadioValue = 1;
    super.initState();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadioValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    //email Text Field in Login form created as a final variable
    final email = TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey)),
          hintText: 'Email Address',
          hintStyle: TextStyle(
            color: Colors.grey,
          )),
    );

    //Password Text Field in Login form created as a final variable
    final password = TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey)),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey)));

    //logIn Button in Login Form
    final loginBtn = Material(
      borderRadius: BorderRadius.circular(15.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        minWidth: double.maxFinite,
        height: 48,
        color: Color(0xFF03B5CF),
        child: Text(
          'Log In',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

    //Forget Password button
    final forgetPassword = Padding(
      padding: EdgeInsets.all(3.0),
      child: FlatButton(
        onPressed: () {
          Toast.show('Forgot Password Button', context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );

    Widget radioBtn(int initialValue){
      return Radio(
            value: initialValue,
            groupValue: selectedRadioValue,
            activeColor: Color(0xFF03B5CF),
            onChanged: (val) {
              setSelectedRadio(val);
            },
          );
    }

    final radioBtnForUser = Theme(
      data: ThemeData.dark(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Admin', style: TextStyle(color: Colors.white)),
          radioBtn(1),
          Text('Shopkeeper', style: TextStyle(color: Colors.white)),
          radioBtn(2),
          Text('Customer', style: TextStyle(color: Colors.white)),
          radioBtn(3),
        ],
      ),
    );

//Container holding Email, Password, Login Button and Forget password button
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            email,
            SizedBox(
              height: 12.0,
            ),
            password,
            SizedBox(
              height: 30.0,
            ),
            loginBtn,
            forgetPassword,
            radioBtnForUser
          ],
        ),
      ),
    );
  }
}
