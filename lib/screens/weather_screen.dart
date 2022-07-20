// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:getting_started/data/weather.dart';
import 'package:getting_started/shared/menu_bottom.dart';
import 'package:getting_started/shared/menu_drawer.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtNamCity = TextEditingController();

  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: txtNamCity,
                  decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                      onPressed: getData, 
                      icon: Icon(Icons.search),
                    )
                  ),
                ),
              ),
              weatherRow('Place', result.name),
              weatherRow('Description', result.description),
              weatherRow('Temperature', result.temperature.toStringAsFixed(2)),
              weatherRow('Perceived', result.perceived.toStringAsFixed(2)),
              weatherRow('Humidity', result.humidity.toStringAsFixed(2)),
              weatherRow('Pressure', result.pressure.toStringAsFixed(2)),
            ],
          ),
        ) 
      );
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(txtNamCity.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
    return row;
  }

}