class UserModel {
  final String name;
  final String email;

  UserModel({this.name, this.email});

  List<UserModel> _userGet = [
    UserModel(name: "ABS", email: "V@gmail.com"),
    UserModel(name: "AB", email: "I@gmail.com"),
    UserModel(name: "ABOS", email: "VX@gmail.com"),
    UserModel(name: "ABIS", email: "VP@gmail.com"),
    UserModel(name: "ABS", email: "V@gmail.com"),
    UserModel(name: "AB", email: "I@gmail.com"),
    UserModel(name: "BOS", email: "VX@gmail.com"),
    UserModel(name: "BIS", email: "VP@gmail.com"),
    UserModel(name: "BS", email: "V@gmail.com"),
    UserModel(name: "CAB", email: "I@gmail.com"),
    UserModel(name: "CABOS", email: "VX@gmail.com"),
    UserModel(name: "CABIS", email: "VP@gmail.com"),
    UserModel(name: "CABS", email: "V@gmail.com"),
    UserModel(name: "CAB", email: "I@gmail.com"),
    UserModel(name: "CBOS", email: "VX@gmail.com"),
    UserModel(name: "ZABIS", email: "VP@gmail.com"),
    UserModel(name: "ZABS", email: "V@gmail.com"),
    UserModel(name: "ZAB", email: "I@gmail.com"),
    UserModel(name: "ZSABOS", email: "VX@gmail.com"),
    UserModel(name: "QQABIS", email: "VP@gmail.com"),
  ];
  List<UserModel> get userGetSearch => [..._userGet];
}
