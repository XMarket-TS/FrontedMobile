import 'package:flutter/material.dart';

class User{
  String _userId;
  String _personUserId;
  String _userName;
  String _password;
  String _name;
  String _email;
  String _imageUrl;
  int _cellphone;

  User(this._userId, this._personUserId, this._userName, this._password,
      this._name, this._email, this._imageUrl, this._cellphone);

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get personUserId => _personUserId;

  set personUserId(String value) {
    _personUserId = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
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

  int get cellphone => _cellphone;

  set cellphone(int value) {
    _cellphone = value;
  }


  User.fromJson(Map<String, dynamic>json){
    userId=json['userId'];
    personUserId=json['personId'];
    userName=json['userName'];
    password=json['password'];
    name=json['name'];
    email=json['email'];
    imageUrl=json['imageUrl'];
    cellphone=json['cellphone'];
  }

}