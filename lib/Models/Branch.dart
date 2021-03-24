import 'package:flutter/material.dart';

class Branch{
  int _branchId;
  String _manager;
  String _name;
  int _phone;
  String _zone;
  String _address;

  Branch(this._branchId,this._manager,this._name,this._phone,this._zone,this._address);
  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
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

  String get manager => _manager;

  set manager(String value) {
    _manager = value;
  }
  Branch.fromJson(Map<String, dynamic>json){
    branchId=json['branchId'];
    manager=json['manager'];
    name=json['name'];
    phone=json['phone'];
    zone=json['zone'];
    address=json['address'];
  }
}