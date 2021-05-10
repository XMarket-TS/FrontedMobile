class User {
  int _userId;
  int _personUserId;
  String _userName;
  String _name;
  String _surName;
  // String _password;
  int _status;
  String _email;
  String _imageUrl;
  String _cellphone;

  // User(this._userId, this._personUserId, this._name, this._surName,this._userName,this._status,
  //      this._imageUrl,this._email, this._cellphone);
  User();


  // String get password => _password;
  //
  // set password(String value) {
  //   _password = value;
  // }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int get personUserId => _personUserId;

  set personUserId(int value) {
    _personUserId = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }


  String get surName => _surName;

  set surName(String value) {
    _surName = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get cellphone => _cellphone;

  set cellphone(String value) {
    _cellphone = value;
  }


  int get status => _status;

  set status(int value) {
    _status = value;
  }

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    personUserId = json['personUserId'];
    name = json['name'];
    surName=json['surname'];
    userName = json['username'];
    status=json['status'];
    imageUrl = json['photo'];
    email = json['email'];
    cellphone = json['cellphone'];
  }

}
