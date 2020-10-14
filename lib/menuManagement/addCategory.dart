import 'package:flutter/material.dart';
import 'package:order_it/menuManagement/forms/categoryInfoForm.dart';

class AddCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: CategoryInfoForm()),
    );
  }
}