import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Repository/url.dart';
class CategoriesRepository {
  // List<Categories> _categoriesList=[
  //   Categories(1,"Vegetales",'fig1.jpg',1),
  //   Categories(2,"Carnes",'fig2.jpg',2),
  //   Categories(3,"Lacteos",'fig3.png',3),
  //   Categories(4,"Bebidas",'fig4.jpg',4),
  //   Categories(5,"Refrescos",'fig5.jpg',5),
  //   Categories(6,"Helados",'fig2.jpg',6),
  // ];
  // List<Categories> get categorieList => _categoriesList;
  //
  // set offerList(List<Categories> value) {
  //   _categoriesList = value;
  // }
  Future<List<Categories>> obtainListCategories (int branchId) async{
    try{
      int _branchId=branchId;

      String url=directionUrl+"category/list";

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var categoriesCollection2 = json.decode(utf8.decode(res.bodyBytes));
      // var branchCollection2;
      var categoriesCollection3=List<Categories>();
      // var branchCollection2=jsonDecode(res.body);


      for(categoriesCollection2 in categoriesCollection2){
        categoriesCollection3.add(Categories.fromJson(categoriesCollection2));
      }
      // print(categoriesCollection3[1].name);
      // body: jsonEncode(singleDriver.toJson()));
      if(res.statusCode == 200){
        // print("DoneListaBranchs");
        return categoriesCollection3;
      }else{
        return null;
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }
}