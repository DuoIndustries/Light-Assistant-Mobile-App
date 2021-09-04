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
  Widget currentScreen = Lamp();

  Color blColor = Colors.blueAccent;

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
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0,
        animationSpeed: 1,
        child: Icon(Icons.bluetooth),
        onOpen: () {
          setState(() {
            blColor = Colors.redAccent;
          });
        },
        onClose: () {
          setState(() {
            blColor = Colors.blueAccent;
          });
        },
        children: [
          SpeedDialChild(
            child: Icon(Icons.bluetooth),
            label: "Bluetooth",
            onTap: () {}
          ),
          SpeedDialChild(
              child: Icon(Icons.tab),
              label: "Bluetooth",
              onTap: () {}
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
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
                          Icons.lightbulb,
                          color: currentTab == 0 ? Colors.amberAccent : Colors.grey,
                        ),
                        Text(
                          'Главная',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.amberAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
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
                          color: currentTab == 1 ? Colors.amberAccent : Colors.grey,
                        ),
                        Text(
                          'Магазин',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.amberAccent : Colors.grey,
                          ),
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
                    minWidth: 50,
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
                          color: currentTab == 2 ? Colors.amberAccent : Colors.grey,
                        ),
                        Text(
                          'Руководство',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.amberAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
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
                          Icons.settings_applications,
                          color: currentTab == 3 ? Colors.amberAccent : Colors.grey,
                        ),
                        Text(
                          'Профиль',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.amberAccent : Colors.grey,
                          ),
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