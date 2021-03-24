import 'package:flutter/material.dart';

class Categories {
  int _categorieId;
  String _name;
  String _branchName;

  Categories(this._categorieId,this._name,this._branchName);

  int get categorieId => _categorieId;

  set categorieId(int value) {
    _categorieId = value;
  }
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get branchName => _branchName;
  set branchName(String value) {
    _branchName = value;
  }
  Categories.fromJson(Map<String, dynamic>json){
    categorieId=json['categorieId'];
    name=json['name'];
    branchName=json['branchName'];
  }
}