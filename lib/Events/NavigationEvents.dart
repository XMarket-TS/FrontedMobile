import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NavigationEvents extends Equatable {

}
class NavigationProductPageEvent extends NavigationEvents{
  // int x;
  // NavigationMenuPage(this.x);
  @override
  List<Object> get props => [];
  // List<Object> get props => [x];
}
class NavigationBranchPageEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class NavigationProfilePageEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class NavigationCartPageEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class NavigationCategoriesPageEvent extends NavigationEvents{
  int _branchId;
  NavigationCategoriesPageEvent(this._branchId);

  @override
  List<Object> get props => [_branchId];

}