import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Pages/CartPage.dart';
import 'package:x_market/Pages/CategoriesPage.dart';
import 'package:x_market/Pages/ProductPage.dart';
import 'package:x_market/Pages/ProfilePage.dart';
import 'package:x_market/Repository/BranchRepository.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';
import 'package:x_market/Pages/BranchPage.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex=1;

  // final page=[ProfilePage(),BranchPage(),CartPage()];
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          // height: size.height,
          items: [
            Icon(Icons.person,size: 40,),
            Icon(Icons.menu,size: 40,),
            Icon(Icons.add_shopping_cart,size: 40,),
            // Icon(Icons.add_shopping_cart,size: 40,),
          ],
          onTap: (index){
            setState(() {
              _selectedIndex=index;
            }
            );
            if(index==0){
              BlocProvider.of<NavigationBloc>(context).add(NavigationProfilePageEvent());
            }else if(index==1){
              BlocProvider.of<NavigationBloc>(context).add(NavigationBranchPageEvent());
            }else if(index==2){
              // print(context);
              BlocProvider.of<NavigationBloc>(context).add(NavigationBranchPageEvent());
              // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent());
            }else{
              BlocProvider.of<NavigationBloc>(context).add(NavigationProfilePageEvent());
            }
          },
          buttonBackgroundColor: color2,
          backgroundColor: color1,
          color: color6,
          animationCurve: Curves.easeInBack,
          animationDuration: const Duration(milliseconds: 300),
        ),
        body: BlocBuilder<NavigationBloc,NavigationStates>(
            builder: (context,state){
              if(state is NavigationLoadingState){
                return Container(); //pantalla de loading
              }else if(state is ListBranchPageState){
                List<Branch> _listBranches=state.props[0];
                return BranchPage(_listBranches);
              }else if(state is ListProductPageState){
                List<Product> _listProduct=state.props[0];
                List<Offer> _listOffer=state.props[1];
                return ProductPage(_listProduct,_listOffer);
              }else if(state is ListCategoriesPageState){
                List<Categories> _listCategories=state.props[0];
                List<Offer> _listOffer=state.props[1];
                return CategoriesPage(_listCategories,_listOffer);
              }else{
                return Container();
              }

            }
        )
      );
  }
}