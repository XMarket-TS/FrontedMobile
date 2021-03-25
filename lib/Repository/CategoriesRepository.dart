import 'package:flutter/material.dart';
import 'package:x_market/Models/Categories.dart';
class CategoriesRepository {
  List<Categories> _categoriesList=[
    Categories(1,"Vegetales",'fig1.jpg',1),
    Categories(2,"Carnes",'fig2.jpg',2),
    Categories(3,"Lacteos",'fig3.png',3),
    Categories(4,"Bebidas",'fig4.jpg',4),
    Categories(5,"Refrescos",'fig5.jpg',5),
    Categories(6,"Helados",'fig2.jpg',6),
  ];
  List<Categories> get categorieList => _categoriesList;

  set offerList(List<Categories> value) {
    _categoriesList = value;
  }
}