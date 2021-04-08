import 'package:flutter/material.dart';

class CardList{
  int _cardId;
  int _userId;
  String _bank;
  int _cardNumber;
  int _cvc;
  int _status;

  CardList(this._cardId, this._userId, this._bank, this._cardNumber, this._cvc,
      this._status);

  int get cardId => _cardId;

  set cardId(int value) {
    _cardId = value;
  }


  String get bank => _bank;

  set bank(String value) {
    _bank = value;
  }


  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int get cardNumber => _cardNumber;

  set cardNumber(int value) {
    _cardNumber = value;
  }

  int get cvc => _cvc;

  set cvc(int value) {
    _cvc = value;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  CardList.fromJson(Map<String, dynamic>json){
    cardId=json['cardId'];
    userId=json['userId'];
    bank=json['cardName'];
    cardNumber=json['cardNumber'];
    cvc=json['cvc'];
    status=json['status'];

  }
}