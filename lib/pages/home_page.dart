import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'main_page.dart';
import 'lamp_page.dart';
import 'shop_page.dart';
import 'guide_page.dart';
import 'profile_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentTab = 0;

  final List<Widget> screens = [
    Main(),
    Shop(),
    Guide(),
    Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Main();

  Color blColor = Color(0xFFd7a0cf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.easeIn,
        backgroundColor: blColor,
        closeManually: true,
        icon: Icons.close,
        overlayOpacity: 0,
        animationSpeed: 1,
        child: Icon(Icons.lightbulb),
        onOpen: () {
          setState(() {
            blColor = Colors.redAccent;
          });
        },
        onClose: () {
          setState(() {
            blColor = Color(0xFFd7a0cf);
          });
        },
        children: [
          SpeedDialChild(
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.bluetooth,
              color: Colors.white,
            ),
            onTap: () {}
          ),
          SpeedDialChild(
              child: Icon(Icons.tab),
              onTap: () {}
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 70,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Main();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Color(0xFFd7a0cf) : Color(0xFF4d8b87),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 70,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Shop();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          color: currentTab == 1 ? Color(0xFFd7a0cf) : Color(0xFF4d8b87),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 70,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Guide();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          color: currentTab == 2 ? Color(0xFFd7a0cf) : Color(0xFF4d8b87),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 70,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Color(0xFFd7a0cf) : Color(0xFF4d8b87),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}