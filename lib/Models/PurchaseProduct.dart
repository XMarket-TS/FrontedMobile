class PurchaseProduct {
  int _productId;
  double _price;
  int _unit;

  PurchaseProduct();

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  } // this._percentage,
  // , this._imageUrl
  // ,this._category

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }

  PurchaseProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    price = json['price'];
    unit = json['unit'];
  }
  Map toJson()=>{
    "productId":productId,
    "price":price,
    "unit":unit
  };
}
