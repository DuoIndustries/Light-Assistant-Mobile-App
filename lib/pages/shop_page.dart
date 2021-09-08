import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        child: ListWheelScrollView.useDelegate(
          itemExtent: mediaQuery.size.height-100,
          diameterRatio: 8,
          physics: FixedExtentScrollPhysics(),
          squeeze: 0.9,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: 3,
              builder: (context, index) => Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Stack(

                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30)
                  ),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    blurRadius: 10,
                    color: Colors.black
                  )]
                ),
              )
          ),
        ),
      ),
    );
  }
}