import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Bloc/ProductBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
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
  List _url=['fig1.jpg','fig2.jpg','fig3.png','fig1.jpg','fig4.jpg','fig5.jpg','fig2.jpg','sandwich.png','wrap.png'];
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
          // titleSpacing: 100.0,
          toolbarHeight: size.height*0.09,
          backgroundColor: color2,
          elevation: 5,
          title: Column(
            children: [
              Text("X-Market",style: TextStyle(fontSize: size.height*0.045),),
              Text("Sucursales",style: TextStyle(fontSize: size.height*0.03),),
            ],
          ),
          centerTitle: true,
          // title: Center(child: Text("X-Market")),
        ),
        body: BlocBuilder<NavigationBloc,NavigationStates>(
          builder: (context,state){
            if(state is ListBranchPageState){
              List<Branch> _listBranches=state.props[0];
              // print(_listBranches.toString());
              return Container(
                height: size.height,
                child: Column(
                  children: [
                    // Text("Sucursales",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                    SizedBox(height: 10,),
                    Container(
                      height: size.height*0.77,
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: ListView.builder(
                        // itemCount: snapshot.data.length,
                        padding: EdgeInsets.only(top: 5,bottom: 20),
                        itemCount: _listBranches.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: (){
                              // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent());
                              BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));
                            },
                            child: Card(
                              color: color1,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: size.height*0.17,
                                    // padding: EdgeInsets.only(top: 10,bottom: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: new AssetImage("assets/images/${_url[index]}"),
                                        fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }else{
              print("no ingresa");
              return Container(); //pantalla de error
            }

          },
        ),
      ),
    );
  }
}
