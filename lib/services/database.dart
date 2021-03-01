import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:github_stats/model/CloudUserData.dart';

class Database {
  final _refrence = FirebaseFirestore.instance;
  Future<void> createUser({CloudUserData data,String uid}) async {
    
  }
}
