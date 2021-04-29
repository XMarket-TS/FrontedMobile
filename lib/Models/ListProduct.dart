class ListProduct{
  int _productId;
  String _productName;
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

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  ListProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName=json['productName'];
    price = json['price'];
    unit = json['unit'];
    imageUrl = json['firstImage'];
  }
}
