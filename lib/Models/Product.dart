import 'dart:ffi';
import 'package:flutter/material.dart';
class Product {
  int _productId;
  String _name;
  double _price;
  String _description;
  // List<String> _imageUrl;
  String _imageUrl;
  int _unit;
  // int _branchId; si
  // int _categoryId; no
  String _branch; //no
  String _category; //si



  Product(this._productId,this._name,this._price,this._description,this._unit, this._imageUrl,this._branch,this._category);
  String get category => _category;

  set category(String value) {
    _category = value;
  }
  String get branch => _branch;

  set branch(String value) {
    _branch = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }
  Product.fromJson(Map<String, dynamic>json){
    productId=json['productId'];
    name=json['name'];
    price=json['price'];
    description=json['description'];
    imageUrl=json['imageUrl'];
    unit=json['unit'];
    branch=json['branch'];
    category=json['category'];
  }

}