import 'package:bloc/bloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Branch.dart';
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
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/Repository/UserRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  ProductRepository _productRepository;
  OffersRepository _offersRepository;
  BranchRepository _branchRepository;
  CategoriesRepository _categoriesRepository;
  UserRepository _userRepository;
  CardRepository _cardRepository;

  NavigationBloc(
      this._productRepository,
      this._offersRepository,
      this._branchRepository,
      this._categoriesRepository,
      this._userRepository,
      this._cardRepository);

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
      List<Product> _getListProduct =
          await _productRepository.obtainListProduct(_branchId, _categoriesId);
      List<Offer> _getListOffer = _offersRepository.offerList;
      yield ListProductPageState(_getListProduct, _getListOffer, _branchId);
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
    } else {}
  }
}
