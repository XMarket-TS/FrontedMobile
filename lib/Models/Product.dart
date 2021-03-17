import 'dart:ffi';
import 'package:flutter/material.dart';
class Product {
  int _productId;
  String _name;
  double _price;
  String _description;
  String _image;

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  int _unit;

  Product(this._productId,this._name,this._price,this._description,this._unit);

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
    image=json['image'];
    unit=json['unit'];
  }

}