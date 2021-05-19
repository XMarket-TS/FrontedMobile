import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Pages/BottomMenu.dart';
import 'package:x_market/Pages/BranchPage.dart';
import 'package:x_market/Pages/CreateAccountPage.dart';
import 'package:x_market/Pages/LoginPage.dart';
import 'package:x_market/Repository/CardRepository.dart';
import 'package:x_market/Repository/CategoriesRepository.dart';
import 'package:x_market/Repository/ImageRepository.dart';
import 'package:x_market/Repository/PurchaseRepository.dart';
import 'package:x_market/Repository/UserRepository.dart';

import 'Bloc/NavigationBloc.dart';
import 'Events/NavigationEvents.dart';
import 'Repository/BranchRepository.dart';
import 'Repository/OffersRepository.dart';
import 'Repository/ProductRepository.dart';
import 'Repository/RecipesRepository.dart';
import 'Globals.dart' as globals;
import 'States/NavigationStates.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black, primaryColor: Colors.black),
      // home: LoadingPage()
      home: BlocProvider(
          create: (context) => NavigationBloc(
              ProductRepository(),
              OffersRepository(),
              BranchRepository(),
              CategoriesRepository(),
              UserRepository(),
              CardRepository(),
              ImageRepository(),
              RecipesRepository(),
              PurchaseRepository())
            ..add(NavigationBranchPageEvent()),
          // child: BottomMenu()),
          child: BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context,state){
              if(state is RegisterPageState){
                return CreateAccountPage();
              }else if(state is LoginPageState){
                return LoginPage();
              }else if(state is ConfirmUserState){
                return LoginPage();
              }else {
                return BottomMenu();
              }
            },
          )),
    );
  }
}
