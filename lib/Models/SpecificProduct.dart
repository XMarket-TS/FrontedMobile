import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/ImagesUrl.dart';

class SpecificProduct {
  int _productId;
  String _name;
  double _price;
  int _percentage;
  String _description;
  int _unit;
  List<String> _imageUrl;
  Categories _categories;
  int _branchId;

  SpecificProduct(this._productId, this._name, this._price, this._description);

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  int get percentage => _percentage;

  set percentage(int value) {
    _percentage = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  List<String> get imageUrl => _imageUrl;

  set imageUrl(List<String> value) {
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
    var auxImageUrl=json['imagesUrl'];
    imageUrl=List();
    for(var image in auxImageUrl){
      imageUrl.add(image);
    }
    categories=Categories.fromJson(json['category']);
    branchId = json['branchId'];
  }

  @override
  String toString() {
    return 'SpecificProduct{_productId: $_productId, _name: $_name, _price: $_price, _percentage: $_percentage, _description: $_description, _unit: $_unit, _imageUrl: $_imageUrl, _categories: $_categories, _branchId: $_branchId}';
  }
}
