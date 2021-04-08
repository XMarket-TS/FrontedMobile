class SpecificProduct {
  int _productId;
  String _name;
  double _price;
  double _percentage;
  String _description;
  int _unit;

  // List<String> _imagesUrl;
  // String _category; //si
  List<String> _imageUrl;

  // String _categoryName:
  int _categoryId;
  int _branchId;

  // int _categoryId; no
  // String _branch; //no

  // Double _discount;
  // ,this._unit,this._branchId,

  SpecificProduct(this._productId, this._categoryId, this._name, this._price,
      this._description);

  // this._percentage,
  // , this._imageUrl
  // ,this._category

  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }

  int get categoryId => _categoryId;

  set categoryId(int value) {
    _categoryId = value;
  }

  // String get category => _category;
  //
  // set category(String value) {
  //   _category = value;
  // }

  double get percentage => _percentage;

  set percentage(double value) {
    _percentage = value;
  } // String get branch => _branch;
  //
  // set branch(String value) {
  //   _branch = value;
  // }

  //
  // List<String> get imagesUrl => _imagesUrl;
  //
  // set imagesUrl(List<String> value) {
  //   _imagesUrl = value;
  // }
  // String get imageUrl => _imageUrl;
  //
  // set imageUrl(String value) {
  //   _imageUrl = value;
  // }

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get unit => _unit;

  set unit(int value) {
    _unit = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  SpecificProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['productCategoryId'];
    name = json['name'];
    price = json['price'];
    // percentage=json['percentage'];
    description = json['description'];
    // category=json['category'];
    // imageUrl=json['imagesUrl'];
    // unit=json['unit'];
    // branchId=json['branchId'];
  }
}
