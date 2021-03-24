import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Pages/BottomMenu.dart';
import 'package:x_market/Pages/BranchPage.dart';
import 'package:x_market/Pages/ProductPage.dart';

import 'Bloc/NavigationBloc.dart';
import 'Events/NavigationEvents.dart';
import 'Repository/BranchRepository.dart';
import 'Repository/OffersRepository.dart';
import 'Repository/ProductRepository.dart';

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
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black
      ),
      home: BlocProvider(
          create: (context)=>NavigationBloc(ProductRepository(),OffersRepository(),BranchRepository())..add(NavigationBranchPageEvent()),
          child: BottomMenu()
      ),
    );
  }
}

