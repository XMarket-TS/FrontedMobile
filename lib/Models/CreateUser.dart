class CreateUser {
  String _name;
  String _surname;
  String _username;
  String _gender;
  String _imageUrl;
  String _email;
  String _password;

  CreateUser();

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Map toJson() => {
        "name": name,
        "surname": surname,
        "username": username,
        "gender": gender,
        "userPhoto": imageUrl,
        "email": email,
        "password": password
      };
}
