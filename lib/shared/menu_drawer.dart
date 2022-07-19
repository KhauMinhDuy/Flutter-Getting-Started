// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:getting_started/screens/bmi_screen.dart';
import 'package:getting_started/screens/intro_screen.dart';
import 'package:getting_started/screens/weather_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Caculator',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Text(
        'Globo Fitness',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    ));

    menuTitles.forEach((element) {
      Widget screen = Container(

      );
      menuItems.add(ListTile(
        title: Text(
          element,
          style: TextStyle(fontSize: 18, ),
        ),
        onTap: () {
          switch(element) {
            case 'Home': 
              screen = IntroScreen();
              break;
            case 'BMI Caculator':
              screen = BmiScreen();
              break;
            case 'Weather':
              screen = WeatherScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        },
      ));
    });

    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }
}
