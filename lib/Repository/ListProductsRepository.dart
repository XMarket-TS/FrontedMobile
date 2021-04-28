import 'package:flutter/material.dart';
import 'package:x_market/Models/ListProduct.dart';

class ListProductsRepository{
  List<ListProduct> _listProducts;

  List<ListProduct> get listProducts => _listProducts;
  set listProducts(List<ListProduct> value) {
    _listProducts = value;
  }

}