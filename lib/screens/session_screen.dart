// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:getting_started/shared/menu_bottom.dart';
import 'package:getting_started/shared/menu_drawer.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {

  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();

  final SPHelper spHelper = SPHelper();
  List<Session> sessions = [];

  @override
  void initState() {
    spHelper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sessions = spHelper.getSessions();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),

    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insert Training Session'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(
                    hintText: 'Duration',
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                txtDescription.text = '';
                txtDuration.text = '';
              }, 
              child: Text('Cancel')
            ),
            ElevatedButton(
              onPressed: saveSession, 
              child: Text('Save')
            ),
          ],
        );
      }
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String toDay = '${now.year}-${now.month}-${now.day}';
    int id = spHelper.getCounter() + 1;
    Session newSession = Session(id, toDay, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    spHelper.writeSession(newSession).then((value) {
      updateScreen();
      spHelper.setCounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }
  
  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          spHelper.deleteSession(session.id).then((value) {
            updateScreen();
          });
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = spHelper.getSessions();
    setState(() {});
  }
}