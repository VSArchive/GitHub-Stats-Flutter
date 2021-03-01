import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_sign_in/github_sign_in.dart';

abstract class AuthID {
  Future<void> signout();
  Stream get onAuthChanges;
}

class AuthLogic extends AuthID with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _refrence = FirebaseFirestore.instance;
  final String _clientId = "fd6ab7bc6106a4cff12c";
  final String _clientSecret = "8d91176d6671c988e38092d76c2be4ba146f21c2";
  UserExtension _userFromFirebase(user) {
    if (user == null) {
      return null;
    } else {
      return UserExtension(
          uid: user.uid,
          displayName: user.displayName,
          emailVerified: user.emailVerified,
          isAnonymous: user.isAnonymous,
          phoneNumber: user.phoneNumber,
          photoURL: user.photoURL,
          tenantId: user.tenantId,
          email: user.email);
    }
  }

  ///Stream to check the user

  Stream get onAuthChanges => _auth.authStateChanges().map(_userFromFirebase);

  ///login user and return user

  Future<UserExtension> signInWithGitHub(context) async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: _clientId,
        clientSecret: _clientSecret,
        redirectUrl: 'https://github-stats-vs.firebaseapp.com/__/auth/handler');
    final result = await gitHubSignIn.signIn(context);
    final AuthCredential githubAuthCredential =
        GithubAuthProvider.credential(result.token);

    final UserCredential credential =
        await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
    print(credential.user.uid + ' ' + credential.additionalUserInfo.username);
    _refrence.collection('User').doc(credential.user.uid).set({
      'email': credential.user.email,
      'username': credential.additionalUserInfo.username,
      'uid': credential.user.uid,
    }).then((value) {
      print('Added');
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
    return _userFromFirebase(credential.user);
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}

class UserExtension {
  final String uid;
  final String email;
  final String displayName;
  final bool emailVerified;
  final bool isAnonymous;
  final bool phoneNumber;
  final String photoURL;
  final String tenantId;

  UserExtension(
      {this.uid,
      this.email,
      this.displayName,
      this.emailVerified,
      this.isAnonymous,
      this.phoneNumber,
      this.photoURL,
      this.tenantId});
}
