import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class SpecificProductPage extends StatefulWidget {
  // SpecificProduct _product;

  // SpecificProductPage(this._product);

  @override
  // _SpecificProductPageState createState() => _SpecificProductPageState(this._product);
  _SpecificProductPageState createState() => _SpecificProductPageState();
}

class _SpecificProductPageState extends State<SpecificProductPage> {
  // SpecificProduct _product;

  // _SpecificProductPageState(this._product);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text(
          "X-Market",
          style: TextStyle(fontSize: size.height * 0.045),
        ),
        centerTitle: true,
      ),
      // body: Container(
      //   child: Text("producto especifico",style: TextStyle(color: Colors.white),),
      // ),
      body: BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, state) {
          if (state is SpecificProductPageState) {
            // SpecificProduct _product = state.props[0];
            // print("Prueba ahhh" + _product.productId.toString());
            // List<Offer> _listOffer=state.props[1];
            return Container(
              height: size.height,

              child: Column(
                children: [
                  Text("prueba"),
                ],
              ),
            );
          } else {
            return Container(); //pantalla de error
          }
        },
      ),
    ));
  }
}
