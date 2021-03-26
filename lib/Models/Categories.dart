import 'package:flutter/material.dart';

class Categories {
  int _categorieId;
  String _name;
  String _imageUrl;
  // String _branchName;
  int _branchId;

  Categories(this._categorieId,this._name,this._imageUrl);

  // ,this._branchId)
  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  int get categorieId => _categorieId;

  set categorieId(int value) {
    _categorieId = value;
  }
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  // String get branchName => _branchName;
  // set branchName(String value) {
  //   _branchName = value;
  // }
  Categories.fromJson(Map<String, dynamic>json){
    categorieId=json['categoryId'];
    name=json['category'];
    imageUrl=json['imageUrl'];
    // branchId=json['branchId'];
  }
}