import 'package:equatable/equatable.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/Models/Tarjeta.dart';
import 'package:x_market/Models/CardList.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Models/User.dart';

abstract class NavigationStates extends Equatable {}

class NavigationInitialState extends NavigationStates {
  @override
  List<Object> get props => [];
}

class NavigationLoadingState extends NavigationStates {
  @override
  List<Object> get props => [];
}

class ListProductPageState extends NavigationStates {
  List<Product> _products;
  List<Offer> _offers;
  int _branchId;
  ListProductPageState(this._products, this._offers,this._branchId);

  List<Object> get props => [_products, _offers,_branchId];
}

class ListBranchPageState extends NavigationStates {
  List<Branch> _branch;

  // List<Offer> _offers;
  ListBranchPageState(this._branch);

  List<Object> get props => [_branch];
}

class NavigationProfilePageState extends NavigationStates {
  @override
  List<Object> get props => [];
}

class NavigationCartPageState extends NavigationStates {
  @override
  List<Object> get props => [];
}

class ListCategoriesPageState extends NavigationStates {
  List<Categories> _categories;
  List<Offer> _offers;
  int _branchId;
  ListCategoriesPageState(this._categories, this._offers,this._branchId);

  @override
  List<Object> get props => [_categories, _offers,_branchId];
}

class SpecificProductPageState extends NavigationStates {
  SpecificProduct _product;
  SpecificProductPageState(this._product);
  @override
  List<Object> get props => [_product];
  // List<Object> get props => [];
}

class ProfilePageState extends NavigationStates {
  User _user;

  ProfilePageState(this._user);

  @override
  List<Object> get props => [_user];
}

class CardPageState extends NavigationStates {
  List<CardList> _cardList;

  CardPageState(this._cardList);

  @override
  List<Object> get props => [_cardList];
}

class SpecificCardPageState extends NavigationStates {
  Tarjeta _card;
  SpecificCardPageState(this._card);

  @override
  List<Object> get props => [_card];
}
