import 'dart:ffi';
import 'package:flutter/material.dart';
class Offer {
  // int _productId;
  String _name;
  double _price;
  String _description;
  String _imageUrl;
  int _unit;
  String _branch;

  String get branch => _branch;

  set branch(String value) {
    _branch = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }
  double _discount;
  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  Offer(this._name,this._price,this._description,this._unit, this._imageUrl, this._discount,this._branch);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  double get discount => _discount;

  set discount(double value) {
    _discount = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }
  Offer.fromJson(Map<String, dynamic>json){
    name=json['name'];
    price=json['price'];
    description=json['description'];
    imageUrl=json['imageUrl'];
    discount=json['discount'];
    branch=json['branch'];
  }

}