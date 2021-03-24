import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Pages/ProductPage.dart';
import 'package:x_market/Repository/BranchRepository.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  ProductRepository _productRepository;
  OffersRepository _offersRepository;
  BranchRepository _branchRepository;
  NavigationBloc(this._productRepository,this._offersRepository,this._branchRepository);

  @override
  NavigationStates get initialState => NavigationInitialState();
  // NavigationStates get initialState => NavigationBranchPageState(_branchRepository.branchList);
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    if(event is NavigationProductPageEvent){
      // event.
      yield NavigationLoadingState();
      List<Product> _getListProduct=_productRepository.productList;
      List<Offer> _getListOffer=_offersRepository.offerList;
      yield ListProductPageState(_getListProduct, _getListOffer);
    }else if(event is NavigationBranchPageEvent){
      // event.
      yield NavigationLoadingState();
      List<Branch> _getBranchList=_branchRepository.branchList;
      yield ListBranchPageState(_getBranchList);
    }else if(event is NavigationCategoriesPageEvent){
      String _nombre=event.props[0];
      // Lista<Categories> _listCategories=_branchRepository.branchList;

    }else {

    }
  }
}