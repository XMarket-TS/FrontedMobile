class ConfirmUser {
  String _userName;
  String _password;

  ConfirmUser();

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  Map toJsonUp() => {"username": userName, "password": password};
}
