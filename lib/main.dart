import 'package:flutter/material.dart';
import 'recode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() => runApp(
  MyApp()
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Baby Names',
    );
  }
}



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
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('baby').snapshots(),
    builder: (context, snapshot){
      if (!snapshot.hasData) return LinearProgressIndicator();
      return _buildList(context, snapshot.data.documents);
      },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data){

  final recode = Recode.fromSnapshot(data);

  return Padding(
    key: ValueKey(recode.name),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0)
    ),
    child: ListTile(title: Text(recode.name),
    trailing: Text(recode.votes.toString()),
    onTap: () => recode.reference.updateData({'votes': FieldValue.increment(1)}),),
    ),

  );
}