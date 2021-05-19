import 'package:x_market/Models/PurchaseProduct.dart';

class PurchaseData {
  List<PurchaseProduct> _productPurchases;
  String _billingAddress;
  String _city;
  int _cardId;

  PurchaseData();


  String get billingAddress => _billingAddress;

  set billingAddress(String value) {
    _billingAddress = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  int get cardId => _cardId;

  set cardId(int value) {
    _cardId = value;
  }


  List<PurchaseProduct> get productPurchases => _productPurchases;

  set productPurchases(List<PurchaseProduct> value) {
    _productPurchases = value;
  }

  PurchaseData.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billingAddress'];
    city = json['city'];
    cardId = json['cardId'];
  }
  Map toJson(){
    var auxProduct=List<Map>();
    for(var prod in productPurchases){
      auxProduct.add(prod.toJson());
    }
    return {
    "productPurchases": auxProduct,
    "billingAddress":billingAddress,
    "city":city,
    "cardId":cardId
    };
  }
}
