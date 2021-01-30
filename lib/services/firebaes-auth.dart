import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthID {}

class AuthLogic extends AuthID with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  UserExtension _userFromFirebase(user) {
    if (user == null) {
      return null;
    } else {
      return UserExtension(uid: user.uid, email: user.email);
    }
  }

  Stream get onAuthChanges => _auth.authStateChanges().map(_userFromFirebase);
}

class UserExtension {
  final String uid;
  final String email;
  UserExtension({this.uid, this.email});
}
