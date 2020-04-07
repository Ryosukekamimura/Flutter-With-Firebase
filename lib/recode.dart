import 'package:cloud_firestore/cloud_firestore.dart';

class Recode{

  final String name;
  final int votes;
  final DocumentReference reference;


  Recode.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Recode.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Recode<$name: $votes>";

}