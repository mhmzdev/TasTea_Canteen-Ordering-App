import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_it/widgets/clippingStyle.dart';
import 'package:order_it/widgets/customTitle.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final bgcolor = Color(0xFF213045);
  final blueColor = Color(0xFF03B5CF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: blueColor,
        tooltip: 'Order Method',
        child: Icon(Icons.arrow_forward_ios),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClipBack(),
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
              top: 100,
              left: 30,
              child: CustomTitle(
                firstPart: 'My',
                secondPart: 'Cart',
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 560,
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  children: <Widget>[itemInCartContainer()],
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              child: SafeArea(
                  child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.black87,
                    ),
                  )
                ],
              ))),
        ],
      ),
    );
  }

  Widget itemInCartContainer() {
    return Container(
      height: 80,
      width: 250,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 8,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage('assets/tea.png'),
            height: 50,
          ),
          Text('Latte',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold)),
          Text('x3',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Text(
            'Rs 120',
            style: TextStyle(fontSize: 16, color: Colors.grey[530]),
          )
        ],
      ),
    );
  }
//   Widget itemInCartContainer() {
//     return new Draggable(
//       maxSimultaneousDrags: 1,
//       child: DraggableChild(),
//       feedback: DraggableChildFeedback(),
//       childWhenDragging: null,
//     );
//   }
// }

// class DraggableChild extends StatelessWidget {
//   const DraggableChild({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       width: 250,
//       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//           color: Colors.black,
//           blurRadius: 8,
//         )
//       ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Image(
//             image: AssetImage('assets/tea.png'),
//             height: 50,
//           ),
//           Text('Latte',
//               style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.grey[700],
//                   fontWeight: FontWeight.bold)),
//           Text('x3',
//               style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold)),
//           Text(
//             'Rs 120',
//             style: TextStyle(fontSize: 16, color: Colors.grey[530]),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DraggableChildFeedback extends StatelessWidget {
//   const DraggableChildFeedback({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 0.7,
//       child: Material(
//         child: Container(
//           height: 80,
//           width: 250,
//           decoration: BoxDecoration(color: Colors.white, boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: 8,
//             )
//           ]),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Image(
//                 image: AssetImage('assets/tea.png'),
//                 height: 50,
//               ),
//               Text('Latte',
//                   style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.grey[700],
//                       fontWeight: FontWeight.bold)),
//               Text('x3',
//                   style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold)),
//               Text(
//                 'Rs 120',
//                 style: TextStyle(fontSize: 16, color: Colors.grey[530]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

}
