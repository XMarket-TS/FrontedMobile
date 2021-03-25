import 'package:flutter/material.dart';
import 'package:x_market/Models/Product.dart';
class ProductRepository{
  List<Product> _productList=[
    Product(1,"Lechuga",2.44,"Fresca, traida del tropico",4,"burger.png",1,"Vegetales"),
    Product(2,"Tomate",3.44,"Fresca, traida del tropico",4,"cheese_dip.png",1,"Vegetales"),
    Product(3,"Pepino",4.44,"Fresca, traida del tropico",4,"ice_cream.png",1,"Vegetales"),
    Product(4,"Carne",5.44,"Fresca, traida del tropico",4,"pizza.png",1,"Carnes"),
    Product(5,"Pollo",6.44,"Fresca, traida del tropico",4,"cola.png",1,"Carnes"),
  ];

  List<Product> get productList => _productList;

  set productList(List<Product> value) {
    _productList = value;
  }
}