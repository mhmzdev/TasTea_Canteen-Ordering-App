import 'package:flutter/material.dart';
import 'package:order_it/widgets/clippingStyle.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:toast/toast.dart';

class Test extends StatefulWidget {
  
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Testing'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/dairyMilk.png'),
                        height: 250,
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Toast.show("Favorite", context);
                            },
                            child: Icon(Icons.favorite_border),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Toast.show("Share", context);
                            },
                            child: Icon(Icons.share),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Toast.show("Report", context);
                            },
                            child: Icon(Icons.report),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /*This Container Hold the Deatils about a specific
                  item which is opend by the customer */
                  Container(
                      height: 230,
                      width: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 12,
                              offset: Offset(1, 2),
                            )
                          ]),
                      child: Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: ClippingBanner(),
                            child: Container(
                              color: Color(0xFF03B5CF).withOpacity(0.3),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13.0, vertical: 10),
                                    child: Text(
                                      'Dairy Milk',
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'myFont4',
                                        letterSpacing: 1,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13.0, vertical: 10),
                                    child: Text(
                                      'Qty Available : 99',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  RatingBar(
                                    onRatingChanged: null,
                                    initialRating: 3,
                                    emptyIcon: Icons.star_border,
                                    filledIcon: Icons.star,
                                    emptyColor: Colors.amber,
                                    filledColor: Colors.amber,
                                    isHalfAllowed: false,
                                    size: 25,
                                    maxRating: 5,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 7,
                                  ),
                                  MaterialButton(
                                    shape: StadiumBorder(),
                                    minWidth: 10,
                                    height: 30,
                                    color: Color(0xFF03B5CF),
                                    onPressed: () {},
                                    child: Text("-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  MaterialButton(
                                    shape: StadiumBorder(),
                                    minWidth: 10,
                                    height: 30,
                                    color: Color(0xFF03B5CF),
                                    onPressed: () {},
                                    child: Text("+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Rs ',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    '150',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
