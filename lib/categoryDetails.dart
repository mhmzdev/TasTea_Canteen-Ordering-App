import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_it/itemDetails.dart';
import 'package:order_it/widgets/clippingStyle.dart';
import 'package:order_it/widgets/customAppBar.dart';
import 'package:order_it/widgets/customTitle.dart';

import 'package:toast/toast.dart';

class CategoryDetails extends StatefulWidget {
  //this snapshot will be passed as a parameter for specific chocolate in Chocolate Category
  final DocumentSnapshot category;

  //String chocolate;
  //initializing the chocolate variable
  CategoryDetails({this.category});
  @override
  _CategoryDetailsState createState() =>
      _CategoryDetailsState(chocolateType: category);
}

class _CategoryDetailsState extends State<CategoryDetails> {
  DocumentSnapshot chocolateType;
  String temp = '';
  int query = 0;
  //String chocolateType;
  _CategoryDetailsState({this.chocolateType});

/*Future Type method is created to get Data from FireBase
  1. It will include a firestore instance variable
  2. then a QuerySnapshot to get data from specific Collection
  3. and finally returning the Array of Data fetched from Firebase*/
  Future getChocolate() async {
    var firestore = Firestore.instance;
    temp = chocolateType.documentID;
    QuerySnapshot qn = await firestore.collection(temp).getDocuments();
    query = qn.documents.length;
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot itemName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemDetails(
                  item: itemName,
                )));
  }

/*Future Builds everytime the screen is loaded, so to obtain the Future in advace
  lets initialize the state onces it is obtain. But if your database is dynamic then
  this approach is not good */
  Future _chocolateData;
  @override
  void initState() {
    super.initState();
    _chocolateData = getChocolate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF213045),
        body: Stack(children: <Widget>[
          ClipPath(
            clipper: ClipBack(),
            child: Container(color: Colors.white),
          ),
          CustomAppBar(),
          CustomTitle(
            firstPart: widget.category.data['snackType'],
            secondPart: "Menu",
          ),
          /*This widget will hold:
          1. future: that will get data from FireBase
          2. builder: which will get context and snapshot of data to be shown
          3. if-else condition: if data is not loaded and connection is in waiting state then a circular
              progress bar will be loaded at center of screen
              Otherwise, It will return List tile holding specifc detials from Firebase mentioned in method below */
          FutureBuilder(
              future: _chocolateData,
              builder: (context, snapshot) {
                //In case data is not yet loaded from Firebase and our connection is waiting for it, we will display a progress bar on screen
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFF03B5CF),
                    ),
                  );
                } else {
                  return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 570,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                        color: Colors.transparent,
                                      ),

                                  //itemCount simply gets the length of array that we are returning from Future
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2,
                                            horizontal: 5.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black54,
                                                      blurRadius: 2,
                                                      offset: Offset(1, 1)),
                                                ]),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: ListTile(
                                                    leading: Image(
                                                        image: NetworkImage(
                                                            snapshot.data[index]
                                                                .data['sImg']
                                                                .toString())),

                                                    //Arrow button to move on next screen
                                                    trailing: FlatButton(
                                                        color:
                                                            Color(0xFF03B5CF),
                                                        shape: CircleBorder(),
                                                        onPressed: () {
                                                          navigateToDetail(
                                                              snapshot
                                                                  .data[index]);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.white,
                                                        )),
                                                    onTap: () {
                                                      Toast.show(
                                                          snapshot.data[index]
                                                              .data['sName']
                                                              .toString(),
                                                          context);
                                                    },
                                                    title: Text(
                                                      snapshot.data[index]
                                                          .data['sName']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 22),
                                                    ),
                                                    subtitle: Text(
                                                      "Rs " +
                                                          snapshot.data[index]
                                                              .data['sPrice']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'myFont3',
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 17),
                                                    )))));
                                  }))));
                }
              })
        ]));
  }
}


