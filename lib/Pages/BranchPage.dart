import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Bloc/ProductBloc.dart';
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Repository/BranchRepository.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class BranchPage extends StatefulWidget {
  List<Branch> _listBranch;
  BranchPage(this._listBranch);
  @override
  _BranchPageState createState() => _BranchPageState(_listBranch);
}

class _BranchPageState extends State<BranchPage> {
  List<Branch> _listBranch;
  List _url=['burger.png','cheese_dip.png','cola.png','fries.png','ice_cream.png','noodles.png','pizza.png','sandwich.png','wrap.png'];
  _BranchPageState(this._listBranch);
  final ProductBloc _productBloc=new ProductBloc();
  // final CategoriesScroller categoriesScroller= CategoriesScroller();
  @override
  void dispose(){
    super.dispose();
    _productBloc.dispose();
  }
  List<Widget> itemsData=[];
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color2,
          title: Text("X-Market"),
        ),
        body: BlocBuilder<NavigationBloc,NavigationStates>(
          builder: (context,state){
            if(state is ListBranchPageState){
              List<Branch> _listBranches=state.props[0];
              return Container(
                height: size.height,
                child: Column(
                  children: [
                    Text("Sucursales",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                    SizedBox(height: 10,),
                    // Container(
                    //   height: size.height*0.2,
                    //   // width: size.width*0.3,
                    //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //   child: ListView.builder(
                    //     // itemCount: snapshot.data.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: _listBranches.length,
                    //     itemBuilder: (context, index){
                    //       return Card(
                    //         color: color6.withOpacity(0.8),
                    //         // color: color3.withOpacity(0.8),
                    //         // color: color2.withOpacity(0.7),
                    //         elevation: 10.0,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //         child: Stack(
                    //           children: [
                    //             // Image.asset("assets/images/${_listBranches[index].imageUrl}",fit: BoxFit.fill,),
                    //             Positioned(
                    //               bottom: 0,
                    //               right: 0,
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),topLeft: Radius.circular(30.0)),
                    //                   color: Colors.yellow.withOpacity(0.9),
                    //                 ),
                    //                 // color: Colors.white.withOpacity(0.7),
                    //                 padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 5.0,top: 5.0),
                    //
                    //                 child: Center(
                    //                   child: Column(
                    //                     children: [
                    //                       Text("${_listBranches[index].name}",style: TextStyle(fontSize: size.height*0.025,),),
                    //                       Text("${_listBranches[index].zone}",style: TextStyle(fontSize: size.height*0.015,),),
                    //                       Text("${_listBranches[index].address}",style: TextStyle(fontSize: size.height*0.015,color: color3),),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               padding: EdgeInsets.all(5.0),
                    //               child: Text("Oferta ${_listBranches[index].name}%",style: TextStyle(fontSize: size.height*0.03,color: Colors.black),),
                    //               // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Container(
                      height: size.height*0.744,
                      child: ListView.builder(
                        // itemCount: snapshot.data.length,
                        itemCount: _listBranches.length,
                        itemBuilder: (context, index){
                          return Card(
                            color: color1,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image.asset("assets/images/${_url[index]}",height: size.width*0.2,width: size.width*0.2,),
                                      // child: Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                      // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text("${_listBranches[index].name}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                          Text("${_listBranches[index].zone}",style: TextStyle(fontSize: 15.0,color: color5),),
                                          Text("${_listBranches[index].address} ",style: TextStyle(fontSize: 15.0,color: color3),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),topLeft: Radius.circular(30.0)),
                                        color: color2.withOpacity(0.9),
                                      ),
                                      // color: Colors.white.withOpacity(0.7),
                                      padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 5.0,top: 5.0),
                                      child: Column(
                                        children: [
                                          Text("${_listBranches[index].name}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                          Text("${_listBranches[index].zone}",style: TextStyle(fontSize: 15.0,color: color5),),
                                          Text("${_listBranches[index].address} ",style: TextStyle(fontSize: 15.0,color: color3),),
                                        ],
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }else{
              return Container(); //pantalla de error
            }

          },
        ),
      ),
    );
  }
}
