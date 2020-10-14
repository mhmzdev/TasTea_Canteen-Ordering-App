import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:order_it/widgets/clippingStyle.dart';
import 'package:toast/toast.dart';

class ItemDetails extends StatefulWidget {
  final DocumentSnapshot item;

  ItemDetails({this.item});
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final bgColor = Color(0xff123045);
  final lightBlueColor = Color(0xFF03B5CF);

  @override
  Widget build(BuildContext context) {

    Widget addToCartBtn() {
      return FloatingActionButton(
        tooltip: 'Add to Cart',
        onPressed: () {

        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF03B5CF),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: bgColor,
            ),
            ClipPath(
              clipper: ClipBack(),
              child: Container(color: Colors.white),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(children: <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  Image(
                    image: NetworkImage(widget.item.data['sImg'].toString()),
                    height: 250,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: <Widget>[
                    shareFvtReportIcon("Favorite", Icons.favorite_border),
                    SizedBox(
                      height: 10,
                    ),
                    shareFvtReportIcon("Share", Icons.share),
                    SizedBox(
                      height: 10,
                    ),
                    shareFvtReportIcon("Report", Icons.report),
                  ])
                ]),
                SizedBox(
                  height: 10,
                ),

                /*This Container Hold the Deatils about a specific
                      item which is opend by the customer */
                Container(
                  height: 230,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                          offset: Offset(1, 1),
                        )
                      ]),
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                          clipper: ClippingBanner(),
                          child: Container(
                            color: lightBlueColor.withOpacity(0.3),
                          )),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 10),
                              child: itemNameText(),
                            )
                          ]),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 10),
                              child: itemQtyText(),
                            )
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            MaterialButton(
                              shape: StadiumBorder(),
                              minWidth: 10,
                              height: 30,
                              color: lightBlueColor,
                              onPressed: () {},
                              child: Text("-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.item.data['sQty'].toString(),
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(width: 10),
                            MaterialButton(
                              shape: StadiumBorder(),
                              minWidth: 10,
                              height: 30,
                              color: lightBlueColor,
                              onPressed: () {},
                              child: Text("+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              Text('Rs ',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.7),
                                  )),
                              Text(
                                widget.item.data['sPrice'].toString(),
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: addToCartBtn())
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   width: double.maxFinite,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
                //     child: addToCartBtn(),
                //   ),
                // ),
              ],
            ),
            Positioned(
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shareFvtReportIcon(String iconName, IconData iconData) =>
      GestureDetector(
        onTap: () {
          Toast.show(iconName, context);
        },
        child: Icon(
          iconData,
          color: Colors.grey.withOpacity(0.5),
          size: 30,
        ),
      );

  Widget itemNameText() => Text(
        widget.item.data['sName'].toString(),
        style: TextStyle(
          fontSize: 35,
          fontFamily: 'myFont4',
          letterSpacing: 1,
          color: Colors.black.withOpacity(0.7),
        ),
      );

  Widget itemQtyText() => Text(
        'Qty Available : ' + widget.item.data['sQty'].toString(),
        style: TextStyle(
          fontSize: 18,
          color: Colors.black.withOpacity(0.7),
        ),
      );
}
