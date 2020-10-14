import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_it/categoryDetails.dart';
import 'package:toast/toast.dart';

class CustomListViewTile extends StatelessWidget {
  final String imgURL;
  final String title;
  final String subcategories;
  final DocumentSnapshot documentSnapshot;

  CustomListViewTile({
    @required this.imgURL,
    @required this.title,
    @required this.subcategories,
    this.documentSnapshot
  });

  @override
  Widget build(BuildContext context) {

    navigateToDetail(DocumentSnapshot snackCategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetails(
          category: snackCategory,
        ),
      ),
    );
  }
  
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 1, offset: Offset(1, 1)),
          ]
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
                leading: Image(image: NetworkImage(imgURL.toString())),
                trailing: FlatButton(
                    color: Color(0xFF03B5CF),
                    shape: CircleBorder(),
                    onPressed: () {
                      navigateToDetail(
                        documentSnapshot
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
                onTap: () {
                  Toast.show(title.toString(), context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                },
                title: Text(
                  title.toString(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
                subtitle: Text(
                  subcategories,
                  style: TextStyle(fontSize: 11, fontFamily: 'myFont3', fontWeight: FontWeight.bold, letterSpacing: 1)
                ))));
  }
}
