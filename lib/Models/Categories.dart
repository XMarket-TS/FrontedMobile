import 'package:flutter/material.dart';

class Categories {

  String _name;
  String _branchName;

  Categories(this._name,this._branchName);

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get branchName => _branchName;
  set branchName(String value) {
    _branchName = value;
  }
  Categories.fromJson(Map<String, dynamic>json){
    name=json['name'];
    branchName=json['branchName'];
  }
}