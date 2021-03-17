import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Repository/OffersRepository.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';
import '../Models/Product.dart';
import '../Bloc/ProductBloc.dart';
import '../Colors.dart';
import '../constants.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ProductBloc _productBloc=new ProductBloc();
  final CategoriesScroller categoriesScroller= CategoriesScroller();
  @override
  void dispose(){
    super.dispose();
    _productBloc.dispose();
  }
  List<Widget> itemsData=[];
  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.white.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: color2,
          //   leading: IconButton(
          //     icon: Icon(Icons.menu,color: Colors.white,),
          //   ),
          //   actions: <Widget>[
          //     IconButton(icon: Icon(Icons.search, color: Colors.white,),
          //         onPressed: (){},
          //     ),
          //     IconButton(icon: Icon(Icons.person, color: Colors.white,),
          //       onPressed: (){},
          //     ),
          //   ],
          // ),

          body: BlocProvider(
            create: (context)=>NavigationBloc(ProductRepository(),OffersRepository()),
            child: Container(
              height: size.height,
              child: Column(
                children: [
                  Text("Ofertas",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                  SizedBox(height: 10,),

                  BlocBuilder <NavigationBloc,NavigationStates>(
                      builder: (context,state){
                        if(state is NavigationMenuPageState){
                          List<Product> _offersObtain=state.props[1];
                          return Container(
                              height: size.height*0.30,
                              // width: size.width*0.3,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              child: ListView.builder(
                                  // itemCount: snapshot.data.length,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _offersObtain.length,
                                  itemBuilder: (context, index){
                                    return Card(
                                      elevation: 5.0,
                                      child: Stack(
                                        children: [
                                          Image.asset("assets/images/burger.png",fit: BoxFit.fill,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text("${_offersObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                                // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Text("${_offersObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                                    Text("${_offersObtain[index].price}",style: TextStyle(fontSize: 20.0),),
                                                    Text("${_offersObtain[index].unit}",style: TextStyle(fontSize: 20.0),)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],

                                      ),
                                    );
                                  },
                                ),
                          );
                        }else{
                          return Container();
                        }
                      }
                  ),
                  Text("Sucursales",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                  // categoriesScroller,
                 BlocBuilder <NavigationBloc,NavigationStates>(
                     builder: (context,state){
                       if(state is NavigationMenuPageState){
                         List<Product> _productsObtain=state.props[0];
                         return Container(
                           height: size.height*0.45,
                           child: ListView.builder(
                                          // itemCount: snapshot.data.length,
                             itemCount: _productsObtain.length,
                             itemBuilder: (context, index){
                               return Card(
                                 elevation: 5.0,
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
                                           Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
                                           Text("${_productsObtain[index].price}",style: TextStyle(fontSize: 20.0),),
                                           Text("${_productsObtain[index].unit}",style: TextStyle(fontSize: 20.0),)
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               );
                               },
                           ),
                         );
                       }else{
                         return Container();
                       }
                     }
                 ),

                 // StreamBuilder<List<Product>>(
                 //      stream: _productBloc.getProductList,
                 //      builder: (BuildContext context,AsyncSnapshot <List<Product>> snapshot){
                 //        final _products=snapshot.data ?? []; //Si es nulo, se devuelve un arreglo vacio
                 //        return Container(
                 //          height: size.height*0.5,
                 //          child: ListView.builder(
                 //              // itemCount: snapshot.data.length,
                 //              itemCount: _products.length,
                 //              itemBuilder: (context, index){
                 //                return Card(
                 //                  elevation: 5.0,
                 //                  child: Row(
                 //                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                 //                    children: [
                 //                      Container(
                 //                        padding: EdgeInsets.all(10.0),
                 //                        child: Text("${_products[index].unit}",style: TextStyle(fontSize: 20.0),),
                 //                        // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                 //                      ),
                 //                    ],
                 //                  ),
                 //                );
                 //              },
                 //          ),
                 //        );
                 //      },
                 //    ),
                  // Expanded(
                  //     child: ListView.builder
                  //       (
                  //         itemCount: itemsData.length,
                  //       physics: BouncingScrollPhysics(),
                  //       itemBuilder:(context,index){
                  //           return itemsData[index];
                  //       }
                  //     )
                  // ),
                ],
              ),
            ),
          ),
        ))
    ;
  }
}
class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 130,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 130,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 130,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

