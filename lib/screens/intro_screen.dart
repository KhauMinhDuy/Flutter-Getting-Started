// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:getting_started/shared/menu_bottom.dart';
import 'package:getting_started/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Globo Fitness')),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/beach.jpg'), 
            fit: BoxFit.cover)
          ),
        child: Center(
          child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Text(
            'Commit to be fit, dare to be great \nwith Globo Fitness',
            textAlign: TextAlign.center,
            // ignore: prefer_const_literals_to_create_immutables
            style: TextStyle(fontSize: 22, shadows: [
              Shadow(
                  offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.grey)
            ]),
          ),
        )),
      ),
    );
  }
}


