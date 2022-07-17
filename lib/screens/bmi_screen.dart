// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getting_started/shared/menu_bottom.dart';
import 'package:getting_started/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Cacalutor'),),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}