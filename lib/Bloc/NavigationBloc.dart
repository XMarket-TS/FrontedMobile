import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Pages/MenuPage.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  ProductRepository _productRepository;
  OffersRepository _offersRepository;
  NavigationBloc(this._productRepository,this._offersRepository);

  @override
  NavigationStates get initialState => NavigationMenuPageState(_productRepository.productList,_offersRepository.offerList);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    if(event is NavigationMenuPageEvent){
      // event.
      yield NavigationMenuPageState(_productRepository.productList,_offersRepository.offerList);
    }
  }
}