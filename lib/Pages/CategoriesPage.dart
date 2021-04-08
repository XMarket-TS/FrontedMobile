import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Categories.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class CategoriesPage extends StatefulWidget {
  List<Categories> _listCategories;
  List<Offer> _listOffer;

  CategoriesPage(this._listCategories, this._listOffer);

  @override
  _CategoriesPageState createState() =>
      _CategoriesPageState(this._listCategories, this._listOffer);
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Categories> _listCategories;
  List<Offer> _listOffer;

  _CategoriesPageState(this._listCategories, this._listOffer);

  List _url2 = [
    'burger.png',
    'cheese_dip.png',
    'cola.png',
    'fries.png',
    'ice_cream.png',
    'noodles.png',
    'pizza.png',
    'sandwich.png',
    'wrap.png',
    'burger.png',
    'cheese_dip.png',
    'cola.png',
    'fries.png',
    'burger.png',
    'cheese_dip.png',
    'cola.png',
    'fries.png'
  ];
  List _url = [
    'fig1.jpg',
    'fig2.jpg',
    'fig3.png',
    'fig1.jpg',
    'fig4.jpg',
    'fig5.jpg',
    'fig2.jpg',
    'sandwich.png',
    'wrap.png',
    'fig1.jpg',
    'fig2.jpg',
    'fig3.png',
    'fig1.jpg',
    'fig4.jpg',
    'fig5.jpg',
    'fig2.jpg',
    'sandwich.png',
    'wrap.png',
    'fig1.jpg',
    'fig2.jpg',
    'fig3.png',
    'fig1.jpg',
    'fig4.jpg',
    'fig5.jpg',
    'fig2.jpg',
    'sandwich.png',
    'wrap.png'
  ];

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
        body: BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, state) {
            if (state is ListCategoriesPageState) {
              List<Categories> _listCategories = state.props[0];
              List<Offer> _listOffer = state.props[1];
              return Container(
                height: size.height,
                child: Column(
                  children: [
                    // Text("Ofertas",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                    // SizedBox(height: 10,),
                    Container(
                      height: size.height * 0.25,
                      // width: size.width*0.3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: ListView.builder(
                        // itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemCount: _listOffer.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: color6.withOpacity(0.8),
                            // color: color3.withOpacity(0.8),
                            // color: color2.withOpacity(0.7),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                // Image.asset("assets/images/${_listOffer[index].imageUrl}",fit: BoxFit.fill,),
                                Image.asset(
                                  "assets/images/${_url2[index]}",
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(30.0)),
                                      color: Colors.yellow.withOpacity(0.9),
                                    ),
                                    // color: Colors.white.withOpacity(0.7),
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        bottom: 5.0,
                                        top: 5.0),

                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${_listOffer[index].name}",
                                            style: TextStyle(
                                              fontSize: size.height * 0.025,
                                            ),
                                          ),
                                          Text(
                                            "Cantidad ${_listOffer[index].unit}",
                                            style: TextStyle(
                                              fontSize: size.height * 0.015,
                                            ),
                                          ),
                                          Text(
                                            "${_listOffer[index].price} Bs",
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                color: color3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Oferta ${_listOffer[index].discount}%",
                                    style: TextStyle(
                                        fontSize: size.height * 0.03,
                                        color: Colors.black),
                                  ),
                                  // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Categorias",
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.08),
                    ),
                    // categoriesScroller,
                    Container(
                      height: size.height * 0.47,
                      child: ListView.builder(
                        // itemCount: snapshot.data.length,
                        itemCount: _listCategories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent(_listCategories[index].branchId,_listCategories[index].categorieId));
                              BlocProvider.of<NavigationBloc>(context).add(
                                  NavigationProductPageEvent(
                                      1, _listCategories[index].categorieId));
                              // BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));
                            },
                            child: Card(
                              color: color1,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    // child: Image.asset("assets/images/${_listCategories[index].imageUrl}",height: size.width*0.2,width: size.width*0.2,),
                                    child: Image.asset(
                                      "assets/images/${_url[index]}",
                                      height: size.width * 0.2,
                                      width: size.width * 0.2,
                                    ),
                                    // child: Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                    // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${_listCategories[index].name}",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        // Text("Cantidad: ${_listProduct[index].unit}",style: TextStyle(fontSize: 15.0,color: color5),),
                                        // Text("Precio: ${_listProduct[index].price} Bs",style: TextStyle(fontSize: 15.0,color: color3),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(); //pantalla de error
            }
          },
        ),
      ),
    );
  }
}
