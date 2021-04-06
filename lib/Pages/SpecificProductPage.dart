import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class SpecificProductPage extends StatefulWidget {
  Product _product;
  SpecificProductPage(this._product);
  @override
  _SpecificProductPageState createState() => _SpecificProductPageState(this._product);
}

class _SpecificProductPageState extends State<SpecificProductPage> {
  Product _product;
  _SpecificProductPageState(this._product);
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size.height*0.08,
            backgroundColor: color2,
            elevation: 5,
            title: Text("X-Market",style: TextStyle(fontSize: size.height*0.045),),
            centerTitle: true,
          ),
          // body: BlocBuilder<NavigationBloc,NavigationStates>(
          //   builder: (context,state){
          //     if(state is )
          //   },
          // ),
        )
    );
  }


}
