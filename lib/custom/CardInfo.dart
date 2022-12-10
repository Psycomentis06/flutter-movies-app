import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
     height: 200,
     decoration: BoxDecoration(),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         title("Amor Ali", 20.0, FontWeight.bold),
         title("Student", 17.0, FontWeight.normal),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Icon(Icons.email),
             const Padding(padding: EdgeInsets.only(right: 10.0)),
             title("alibenamor30@gmail.com", 14.0, FontWeight.normal)
           ],
         )
       ],
     ),
    );
  }

  Widget title(String text, double size, FontWeight weight) {
    return Text(
     text,
     style: TextStyle(
       color: Colors.white,
       fontSize: size,
       fontWeight: weight
     ),
    );
  }
}
