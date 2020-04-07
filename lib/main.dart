import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: MyHomePage(),
    title: 'Baby Names',
  )
);

final dummySnapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},
];


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Name Votes'),
      ),
      body: Center(child: Text('Hello World')),
    );
  }
}

Widget _buildBody(BuildContext context){
  //TODO: get actual snapshot from Cloud Firebae
  return _buildList(context, dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot){
  return ListView()
}