class ImagesUrl {
  int _productId;
  String _photo;

  ImagesUrl();

  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  String get photo => _photo;

  set photo(String value) {
    _photo = value;
  }

  ImagesUrl.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    photo = json['photo'];
  }
}
