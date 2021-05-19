class Offer {
  int _offerId;
  int _productId;
  String _name;
  double _price;
  String _description;
  String _startDate;
  String _endDate;
  String _imageUrl;
  int _unit;
  int _discount;
  int _categoryId;
  int _branchId;

  // String _branch;
  Offer();
  // Offer(
  //     this._offerId, this._productId,
  //     this._name, this._price,
  //     this._startDate, this._endDate,
  //     this._description, this._unit,
  //     this._imageUrl, this._discount,
  //     this._categoryId, this._branchId);

  String get startDate => _startDate;

  set startDate(String value) {
    _startDate = value;
  }

  int get categoryId => _categoryId;

  set categoryId(int value) {
    _categoryId = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }



  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get discount => _discount;

  set discount(int value) {
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

  String get endDate => _endDate;

  set endDate(String value) {
    _endDate = value;
  }

  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }


  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }


  int get offerId => _offerId;

  set offerId(int value) {
    _offerId = value;
  }

  Offer.fromJson(Map<String, dynamic> json) {
    offerId=json['offerId'];
    productId= json['productId'];
    name = json['name'];
    price = json['price'];
    startDate = json["startDate"];
    endDate = json['endDate'];
    imageUrl = json['imageUrl'];
    discount = json['percentage'];
    categoryId = json['categoryId'];
    branchId = json['branchId'];
  }
}
