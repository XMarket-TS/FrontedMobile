import 'package:bloc/bloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Repository/BranchRepository.dart';
import 'package:x_market/Repository/CategoriesRepository.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  ProductRepository _productRepository;
  OffersRepository _offersRepository;
  BranchRepository _branchRepository;
  CategoriesRepository _categoriesRepository;

  NavigationBloc(this._productRepository, this._offersRepository,
      this._branchRepository, this._categoriesRepository);

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
      yield ListProductPageState(_getListProduct, _getListOffer);
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
      yield ListCategoriesPageState(_getListCategories, _getListOffer);
    } else {}
  }
}
