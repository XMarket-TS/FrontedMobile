import 'package:flutter/material.dart';
import 'package:x_market/Models/Categories.dart';
class CategoriesRepository {
  List<Categories> _categoriesList=[
    Categories(1,"Vegetales","Sucursal 1"),
    Categories(2,"Carnes","Sucursal 2",),
    Categories(3,"Lacteos","Sucursal 3"),
    Categories(4,"Bebidas","Sucursal 4"),
    Categories(5,"Refrescos","Sucursal 5"),
    Categories(6,"Helados","Sucursal 6"),
  ];
  List<Categories> get categorieList => _categoriesList;

  set offerList(List<Categories> value) {
    _categoriesList = value;
  }
}