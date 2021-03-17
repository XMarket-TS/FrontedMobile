import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Pages/MenuPage.dart';
abstract class NavigationStates extends Equatable{

}

class NavigationMenuPageState extends NavigationStates{
  List<Product> _products;
  List<Product> _offers;
  NavigationMenuPageState(this._products,this._offers);
  List<Object> get props => [_products,_offers];


}