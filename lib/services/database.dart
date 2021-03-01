import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_stats/model/CloudUserData.dart';

class Database extends ChangeNotifier {
  final String uid;
  final _refrence = FirebaseFirestore.instance;

  Database({this.uid});
  Stream<List<CloudUserData>> dataUserC() {
    return _refrence
        .collection('User')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((e) =>
            e.docs.map((ed) => CloudUserData.fromJson(ed.data())).toList());
  }
}
