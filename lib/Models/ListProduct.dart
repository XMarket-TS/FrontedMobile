class ListProduct{
  int _productId;
  double _price;
  int _unit;
  String _imageUrl;
  // ListProduct(this._productId,this._price,this._unit,this._imageUrl);
  ListProduct();
  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  double get price => _price;

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }

  set price(double value) {
    _price = value;
  }
  ListProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    price = json['price'];
    unit = json['unit'];
    imageUrl = json['firstImage'];
  }
}
