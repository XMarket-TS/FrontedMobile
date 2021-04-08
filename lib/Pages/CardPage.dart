import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Models/CardList.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';
class CardPage extends StatefulWidget {
  List<CardList> _cardList;
  CardPage(this._cardList);
  @override
  _CardPageState createState() => _CardPageState(this._cardList);
}

class _CardPageState extends State<CardPage> {
  List<CardList> _cardList;
  _CardPageState(this._cardList);
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size.height*0.08,
            backgroundColor: color2,
            elevation: 5,
            title: Text("Cards",style: TextStyle(fontSize: size.height*0.045),),
            centerTitle: true,
          ),
          body: BlocBuilder<NavigationBloc,NavigationStates>(
            builder: (context,state){
              if(state is CardPageState){
                List<CardList> _cardList=state.props[0];
                return SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: size.height*0.77,
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 5,bottom: 20),
                              itemCount: _cardList.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent());
                                    // BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));
                                  },
                                  child: Card(
                                    color: color1,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset("assets/images/burger.png",height: size.width*0.2,width: size.width*0.2,),
                                          // child: Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                          // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Text("${_cardList[index].bank}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                              Text("${_cardList[index].cardNumber}",style: TextStyle(fontSize: 15.0,color: color5),),
                                              Text("${_cardList[index].cvc}",style: TextStyle(fontSize: 15.0,color: color3),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }else{
                return Container();
              }
            },
          ),
        )
    );
  }
}
