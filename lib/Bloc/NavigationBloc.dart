import 'package:bloc/bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/ConfirmUser.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/Models/Tarjeta.dart';
import 'package:x_market/Models/CardList.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/BranchRepository.dart';
import 'package:x_market/Repository/CardRepository.dart';
import 'package:x_market/Repository/CategoriesRepository.dart';
import 'package:x_market/Repository/ImageRepository.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/Repository/UserRepository.dart';
import 'package:x_market/States/NavigationStates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Globals.dart' as globals;

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  ProductRepository _productRepository;
  OffersRepository _offersRepository;
  BranchRepository _branchRepository;
  CategoriesRepository _categoriesRepository;
  UserRepository _userRepository;
  CardRepository _cardRepository;
  ImageRepository _imageRepository;

  NavigationBloc(
      this._productRepository,
      this._offersRepository,
      this._branchRepository,
      this._categoriesRepository,
      this._userRepository,
      this._cardRepository,
      this._imageRepository);

  @override
  NavigationStates get initialState => NavigationInitialState();

  // NavigationStates get initialState => NavigationBranchPageState(_branchRepository.branchList);
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    if (event is NavigationProductPageEvent) {
      // event.
      yield NavigationLoadingState();
      int _branchId = event.props[0];
      int _categoriesId = event.props[1];
      int page= event.props[2];
      int size= event.props[3];
      String _data=event.props[4];
      List<Product> _getListProduct =
          await ProductRepository.obtainListProduct(_branchId, _categoriesId,page,size,_data);
      List<Offer> _getListOffer = _offersRepository.offerList;
      yield ListProductPageState(_getListProduct, _getListOffer, _branchId,_categoriesId);
    } else if (event is NavigationBranchPageEvent) {
      // event.
      yield NavigationLoadingState();
      List<Branch> _getBranchList = await _branchRepository.obtainListBranch();
      yield ListBranchPageState(_getBranchList);
    } else if (event is NavigationCategoriesPageEvent) {
      yield NavigationLoadingState();
      int _branchId = event.props[0];
      List<Categories> _getListCategories =
          await _categoriesRepository.obtainListCategories(_branchId);
      List<Offer> _getListOffer = await _offersRepository.offerList;
      yield ListCategoriesPageState(
          _getListCategories, _getListOffer, _branchId);
    } else if (event is ProfilePageEvent) {
      // event.
      yield NavigationLoadingState();
      int _userId = event.props[0];
      // print("bloc profilepageevent");
      // print(_userId);
      User _getUser = await _userRepository.obtainUserProfile(_userId);
      yield ProfilePageState(_getUser);
    } else if (event is CardPageEvent) {
      // event.
      yield NavigationLoadingState();
      int _userId = event.props[0];
      List<CardList> _cardList = await _cardRepository.obtainCardList(_userId);
      yield CardPageState(_cardList);
    } else if (event is SpecificCardPageEvent) {
      // event.
      yield NavigationLoadingState();
      int _cardId = event.props[0];
      Tarjeta _card = await _cardRepository.obtainSpecificCard(_cardId);
      yield SpecificCardPageState(_card);
    } else if (event is SpecificProductPageEvent) {
      // event.
      yield NavigationLoadingState();
      int _productId = event.props[0];
      // Tarjeta _card = await _cardRepository.obtainSpecificCard(_cardId);
      SpecificProduct _product =
          await _productRepository.obtainSpecificProduct(_productId);
      yield SpecificProductPageState(_product);
      // yield SpecificProductPageState();
    } else if (event is NavigationCartPageEvent) {
      // event.
      yield NavigationLoadingState();

      yield NavigationCartPageState();
    } else if (event is UpdateCardEvent) {
      // event.
      yield NavigationLoadingState();
      Tarjeta _tarjeta = event.props[0];
      int _userId = event.props[1];
      // print("desde navigation update");
      // print(_tarjeta.bank);
      int _success = await _cardRepository.updateCard(_tarjeta);
      List<CardList> _cardList = await _cardRepository.obtainCardList(_userId);
      yield _success == 1
          ? CardPageState(_cardList)
          : NavigationCartPageState();
    } else if (event is DeleteCardEvent) {
      // event.
      yield NavigationLoadingState();
      int _cardId = event.props[0];
      int _userId = event.props[1];
      await _cardRepository.deleteCard(_cardId);
      List<CardList> _cardList = await _cardRepository.obtainCardList(_userId);
      yield CardPageState(_cardList);
    } else if (event is ConfirmUserEvent) {
      try{
        yield NavigationLoadingState();
        ConfirmUser _confirmUser= event.props[0];
        // print("datos para revisar");
        // print(_confirmUser.userName);
        User _user=await _userRepository.confirmUser(_confirmUser);
        // print("revision datos usuario");
        // print(_user.name);
        SharedPreferences userId=await SharedPreferences.getInstance();
        await userId.setInt('userId', _user.userId);
        List<Branch> _getBranchList = await _branchRepository.obtainListBranch();
        // print("Revision SharedPreferences");
        // print(userId.getInt('userId'));
        // print(globals.userProfile.userId);
        yield userId.getInt('userId')!=null?ListBranchPageState(_getBranchList):ConfirmUserState();
      }catch (error) {
        print(error);
      }
      // event.

    }else if (event is LogoutEvent) {
      // event.
      yield NavigationLoadingState();
      SharedPreferences userId=await SharedPreferences.getInstance();
      userId.remove('userId');
      yield ConfirmUserState();
    } else if (event is QrEvent) {
      // event.
      yield NavigationLoadingState();
      // SharedPreferences userId=await SharedPreferences.getInstance();
      // userId.remove('userId');
      yield QrState();
    }else if (event is RecetasEvent) {
      // event.
      yield NavigationLoadingState();
      yield RecetasState();
    } else if (event is RegisterEvent) {
      // event.
      User _user=event.props[0];
      yield NavigationLoadingState();
      User _user1=await _userRepository.addUser(_user);
      SharedPreferences userId=await SharedPreferences.getInstance();
      await userId.setInt('userId', _user1.userId);
      List<Branch> _getBranchList = await _branchRepository.obtainListBranch();
      // print("Revision SharedPreferences");
      // print(userId.getInt('userId'));
      // print(globals.userProfile.userId);
      yield userId.getInt('userId')!=null?ListBranchPageState(_getBranchList):ConfirmUserState();
      // yield RegisterState(_user1);
    } else if (event is RegisterPageEvent) {
      // event.
      yield NavigationLoadingState();
      yield RegisterPageState();
    }else if (event is LoginPageEvent) {
      // event.
      yield NavigationLoadingState();
      yield LoginPageState();
    }else {}
  }
}
