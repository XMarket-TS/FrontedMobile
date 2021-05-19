import 'package:equatable/equatable.dart';
import 'package:x_market/Models/ConfirmUser.dart';
import 'package:x_market/Models/Tarjeta.dart';
import 'dart:io';

import 'package:x_market/Models/User.dart';

abstract class NavigationEvents extends Equatable {}

class NavigationProductPageEvent extends NavigationEvents {
  int _branchId;
  // String _branchName;
  int _categorieId;
  int page;
  int size;
  String _data;

  NavigationProductPageEvent(this._branchId, this._categorieId, this.page, this.size,this._data);


  @override
  List<Object> get props => [_branchId, _categorieId,page,size,_data];
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

class SpecificProductPageEvent extends NavigationEvents {
  int _productId;

  SpecificProductPageEvent(this._productId);

  @override
  List<Object> get props => [_productId];
}

class ProfilePageEvent extends NavigationEvents {
  int _userId;

  ProfilePageEvent(this._userId);

  @override
  List<Object> get props => [_userId];
}

class CardPageEvent extends NavigationEvents {
  int _userId;

  CardPageEvent(this._userId);

  @override
  List<Object> get props => [_userId];
}

class SpecificCardPageEvent extends NavigationEvents {
  int _cardId;

  SpecificCardPageEvent(this._cardId);

  @override
  List<Object> get props => [_cardId];
}

class UpdateCardEvent extends NavigationEvents {
  Tarjeta _tarjeta;
  int _userId;

  UpdateCardEvent(this._tarjeta, this._userId);

  @override
  List<Object> get props => [_tarjeta, _userId];
}

class DeleteCardEvent extends NavigationEvents {
  int _cardId;
  int _userId;

  DeleteCardEvent(this._cardId, this._userId);

  @override
  List<Object> get props => [_cardId, _userId];
}
class ConfirmUserEvent extends NavigationEvents{
  ConfirmUser _confirmUser;
  ConfirmUserEvent(this._confirmUser);
  @override
  List<Object> get props => [_confirmUser];
}
class LogoutEvent extends NavigationEvents{
  @override
  List<Object> get props =>[];
}
class RegisterEvent extends NavigationEvents{
  User _user;
  RegisterEvent(this._user);
  @override
  List<Object> get props => [_user];

}
class QrEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class RecetasEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class UploadImageEvent extends NavigationEvents{
  File _imagefile;
  @override
  List<Object> get props => [_imagefile];
}
class RegisterPageEvent extends NavigationEvents{
  @override
  List<Object> get props => [];
}
class LoginPageEvent extends NavigationEvents{
  @override
  List<Object> get props => [];

}
