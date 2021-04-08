import 'package:equatable/equatable.dart';

abstract class NavigationEvents extends Equatable {}

class NavigationProductPageEvent extends NavigationEvents {
  int _branchId;

  // String _branchName;
  int _categorieId;

  NavigationProductPageEvent(this._branchId, this._categorieId);

  @override
  List<Object> get props => [_branchId, _categorieId];
}

class NavigationBranchPageEvent extends NavigationEvents {
  @override
  List<Object> get props => [];
}

class NavigationProfilePageEvent extends NavigationEvents {
  @override
  List<Object> get props => [];
}

class NavigationCartPageEvent extends NavigationEvents {
  @override
  List<Object> get props => [];
}

class NavigationCategoriesPageEvent extends NavigationEvents {
  int _branchId;

  NavigationCategoriesPageEvent(this._branchId);

  @override
  List<Object> get props => [_branchId];
}
class SpecificProductPageEvent extends NavigationEvents{
  int _productId;

  SpecificProductPageEvent(this._productId);
  @override
  List<Object> get props => [_productId];
}
class ProfilePageEvent extends NavigationEvents{
  int _userId;
  ProfilePageEvent(this._userId);
  @override
  List<Object> get props => [_userId];

}
class CardPageEvent extends NavigationEvents{
  int _userId;
  CardPageEvent(this._userId);
  @override
  List<Object> get props => [_userId];
}
class SpecificCardPageEvent extends NavigationEvents{
  int _cardId;
  SpecificCardPageEvent(this._cardId);
  @override
  List<Object> get props => [_cardId];
}