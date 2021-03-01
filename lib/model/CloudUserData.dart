class CloudUserData {
  final String uid;
  final String username;
  final String email;

  CloudUserData({this.uid, this.username, this.email});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
    };
  }

  factory CloudUserData.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    } else {
      return CloudUserData(
        uid: data['uid'],
        username: data['username'],
        email: data['email'],
      );
    }
  }
}
