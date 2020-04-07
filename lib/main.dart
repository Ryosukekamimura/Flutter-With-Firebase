import 'package:flutter/material.dart';
import 'recode.dart';

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
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context){
  //TODO: get actual snapshot from Cloud Firebae
  return _buildList(context, dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot){
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, Map data){

  final recode = Recode.fromMap(data);

  return Padding(
    key: ValueKey(recode.name),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0)
    ),
    child: ListTile(title: Text(recode.name),
    trailing: Text(recode.votes.toString()),
    onTap: () => print(recode),),
    ),

  );
}