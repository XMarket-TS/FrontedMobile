import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Pages/ProductPage.dart';
abstract class NavigationStates extends Equatable{

}
class NavigationInitialState extends NavigationStates{
  @override
  List<Object> get props =>[];
}
class NavigationLoadingState extends NavigationStates{
  @override
  List<Object> get props => [];
}
class ListProductPageState extends NavigationStates{
  List<Product> _products;
  List<Offer> _offers;
  ListProductPageState(this._products,this._offers);
  List<Object> get props => [_products,_offers];
}
class ListBranchPageState extends NavigationStates{
  List<Branch> _branch;
  // List<Offer> _offers;
  ListBranchPageState(this._branch);
  List<Object> get props => [_branch];
}
class NavigationProfilePageState extends NavigationStates{
  @override
  List<Object> get props => [];

}
class NavigationCartPageState extends NavigationStates{
  @override
  List<Object> get props => [];

}