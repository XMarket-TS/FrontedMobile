class Branch {
  int _branchId;

  // String _manager;
  int _managerId;
  String _name;
  int _phone;
  String _zone;
  String _address;
  String _imageUrl;

  // String _status;
  // List<String> _transaction;

  // String get status => _status;
  //
  // set status(String value) {
  //   _status = value;
  // }
  Branch(this._branchId, this._managerId, this._name, this._phone, this._zone,
      this._address,this._imageUrl);

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  } // Branch();

  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }

  int get managerId => _managerId;

  set managerId(int value) {
    _managerId = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get zone => _zone;

  set zone(String value) {
    _zone = value;
  }

  int get phone => _phone;

  set phone(int value) {
    _phone = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  // String get manager => _manager;
  //
  // set manager(String value) {
  //   _manager = value;
  // }
  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branchOfficeId'];
    managerId = json['managerId'];
    name = json['name'];
    phone = json['phone'];
    zone = json['zone'];
    address = json['address'];
    imageUrl=json['image'];
    // status=json['status'];
    // transaction=json['transaction'];
  }

// List<String> get transaction => _transaction;
//
// set transaction(List<String> value) {
//   _transaction = value;
// }
}
