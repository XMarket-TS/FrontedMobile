import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/ImagesUrl.dart';

class SpecificProduct {
  int _productId;
  String _name;
  double _price;
  double _percentage;
  String _description;
  int _unit;
  List<ImagesUrl> _imageUrl;
  Categories _categories;
  int _branchId;

  SpecificProduct(this._productId, this._name, this._price, this._description);

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  double get percentage => _percentage;

  set percentage(double value) {
    _percentage = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  List<ImagesUrl> get imageUrl => _imageUrl;

  set imageUrl(List<ImagesUrl> value) {
    _imageUrl = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }

  Categories get categories => _categories;

  set categories(Categories value) {
    _categories = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  SpecificProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    percentage = json['percentage'];
    description = json['description'];
    unit = json['unit'];
    // imageUrl=json['imagesUrl'];
    // category=json['category'];
    branchId = json['branchId'];
  }
}
