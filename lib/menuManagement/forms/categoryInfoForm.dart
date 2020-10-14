import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryInfoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 70, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
                label: Text(
                  'Back',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Enter New Category",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          textFields(TextInputType.text, 'Category Name', Icons.category),
          SizedBox(
            height: 12,
          ),
          textFields(TextInputType.text, 'Sub Categories', Icons.all_inclusive),
          SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                Firestore.instance
                    .collection('_snacks')
                    .document('snackType')
                    .setData({
                  'snackType': 'New Category!',
                  'subCat': 'sub categories'
                });
              },
              color: Color(0xFF03B5CF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              shape: StadiumBorder(),
            ),
          )
        ],
      ),
    );
  }

  Widget textFields(
      TextInputType inputType, String labelText, IconData prefixIcon) {
    return TextFormField(
      keyboardType: inputType,
      autofocus: false,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
