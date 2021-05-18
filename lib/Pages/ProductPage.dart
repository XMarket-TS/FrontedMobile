import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Offer.dart';
import 'package:x_market/Repository/ProductRepository.dart';
import 'package:x_market/States/NavigationStates.dart';
import '../Models/Product.dart';
import '../Colors.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
class ProductPage extends StatefulWidget {
  List<Product> _listProduct;
  List<Offer> _listOffer;
  ProductPage(this._listProduct, this._listOffer);

  @override
  _ProductPageState createState() =>
      _ProductPageState(this._listProduct, this._listOffer);
}

class _ProductPageState extends State<ProductPage> {
  List<Product> _listProduct;
  List<Offer> _listOffer;
  int branchId;
  int categoryId;
  _ProductPageState(this._listProduct, this._listOffer);
  TextEditingController _search=TextEditingController();
  static const _pageSize = 10;
  final _pagingController = PagingController<int, Product>(
    firstPageKey: 1,
  );
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      final _listProduct1 = await ProductRepository.obtainListProduct(branchId,categoryId,pageKey, _pageSize);
      final isLastPage = _listProduct1.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(_listProduct1);
      } else {
        await Future.delayed(Duration(seconds: 2));
        final nextPageKey = pageKey + _listProduct1.length;
        _pagingController.appendPage(_listProduct1, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }


  // final ProductBloc _productBloc=new ProductBloc();
  // final CategoriesScroller categoriesScroller= CategoriesScroller();
  // @override
  // void dispose(){
  //   super.dispose();
  //   _productBloc.dispose();
  // }
  List<Widget> itemsData = [];

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
            if (state is ListProductPageState) {
              _listProduct = state.props[0];
              List<Offer> _listOffer = state.props[1];
              branchId = state.props[2];
              categoryId = state.props[3];
              // print("id sdjflajflk");
              // print(_branchId);
              return SingleChildScrollView(
                child: Container(
                  height: size.height,
                  // color: color5,
                  child: Column(
                    children: [
                      // Text("Ofertas",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
                      // SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: color5,
                            height: size.height*0.06,
                            width: size.width*0.8,
                            margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                            padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                                color: color5,
                          ),
                            child: TextField(
                                  // cursorWidth: size.width*0.5,
                                  controller: _search,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    hintText: "Buscar",
                                  ),
                                  style: TextStyle(color: color1),
                                  // cursorColor: color5,
                                ),
                          ),
                          Container(
                            height: size.height*0.06,
                            width: size.width*0.1,
                            margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                            padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                              color: color5,
                            ),
                            child: GestureDetector(
                                onTap: (){
                                  // print("search");
                                },
                                child: Icon(Icons.search)
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: size.height * 0.25,
                      //   // width: size.width*0.3,
                      //   margin: const EdgeInsets.symmetric(
                      //       vertical: 10, horizontal: 10),
                      //   child: ListView.builder(
                      //     // itemCount: snapshot.data.length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: _listOffer.length,
                      //     itemBuilder: (context, index) {
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
                      //             Image.asset(
                      //               "assets/images/${_listOffer[index].imageUrl}",
                      //               fit: BoxFit.fill,
                      //             ),
                      //             Positioned(
                      //               bottom: 0,
                      //               right: 0,
                      //               child: Container(
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.only(
                      //                       bottomRight: Radius.circular(10.0),
                      //                       topLeft: Radius.circular(30.0)),
                      //                   color: Colors.yellow.withOpacity(0.9),
                      //                 ),
                      //                 // color: Colors.white.withOpacity(0.7),
                      //                 padding: EdgeInsets.only(
                      //                     left: 20.0,
                      //                     right: 20.0,
                      //                     bottom: 5.0,
                      //                     top: 5.0),
                      //
                      //                 child: Center(
                      //                   child: Column(
                      //                     children: [
                      //                       Text(
                      //                         "${_listOffer[index].name}",
                      //                         style: TextStyle(
                      //                           fontSize: size.height * 0.025,
                      //                         ),
                      //                       ),
                      //                       Text(
                      //                         "Cantidad ${_listOffer[index].unit}",
                      //                         style: TextStyle(
                      //                           fontSize: size.height * 0.015,
                      //                         ),
                      //                       ),
                      //                       Text(
                      //                         "${_listOffer[index].price} Bs",
                      //                         style: TextStyle(
                      //                             fontSize: size.height * 0.015,
                      //                             color: color3),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               padding: EdgeInsets.all(5.0),
                      //               child: Text(
                      //                 "Oferta ${_listOffer[index].discount}%",
                      //                 style: TextStyle(
                      //                     fontSize: size.height * 0.03,
                      //                     color: Colors.black),
                      //               ),
                      //               // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Text(
                      //   "Productos",
                      //   style: TextStyle(
                      //       color: Colors.white, fontSize: size.width * 0.08),
                      // ),
                      // categoriesScroller,
                      Container(
                        height: size.height * 0.7,
                        child: RefreshIndicator(
                          onRefresh: () => Future.sync(
                            // 2
                                () => _pagingController.refresh(),
                          ),
                          child: PagedListView<int,Product>(
                            pagingController: _pagingController,
                            // itemCount: _listProduct.length,
                            builderDelegate: PagedChildBuilderDelegate<Product>(
                              itemBuilder: (context,product, index) {
                                return Dismissible(
                                  key: ObjectKey(product),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    // alignment: Alignment.centerRight,
                                    // padding: EdgeInsets.symmetric(horizontal: 50.0),
                                    color: color6,
                                    child: Icon(Icons.add),
                                  ),
                                  onDismissed: (direction) {
                                    // setState(() {
                                    //   _listProduct.removeAt(index);
                                    // });
                                    // print(_listProduct[index].productId);
                                    BlocProvider.of<NavigationBloc>(context).add(
                                        SpecificProductPageEvent(
                                            product.productId));
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      // BlocProvider.of<NavigationBloc>(context).add(NavigationProductPageEvent(_listCategories[index].branchId,_listCategories[index].categorieId));
                                      BlocProvider.of<NavigationBloc>(context).add(
                                          SpecificProductPageEvent(
                                              product.productId));
                                      // BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));
                                    },
                                    child: Card(
                                      color: color1,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width*0.34,
                                            height: size.height*0.2,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft:  Radius.circular(10)),
                                                image: DecorationImage(
                                                    image: NetworkImage(product.imageUrl),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),
                                          SizedBox(width: size.width*0.05,),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  child: AutoSizeText("${product.name}",
                                                    style: TextStyle(fontSize: size.width*0.037, color: Colors.white),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Text(
                                                  "Cantidad: ${product.unit}",
                                                  style: TextStyle(
                                                      fontSize: 15.0, color: color5),
                                                ),
                                                Text(
                                                  "Precio: ${product.price} Bs",
                                                  style: TextStyle(
                                                      fontSize: 15.0, color: color3),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: size.width*0.01,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              // firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                              //   error: _pagingController.error,
                              //   onTryAgain: () => _pagingController.refresh(),
                              // ),
                              // noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
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
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
// class loq extends StatefulWidget {
//   @override
//   _loqState createState() => _loqState();
// }
//
// class _loqState extends State<loq> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           body: BlocBuilder<NavigationBloc,NavigationStates>(
//             builder: (context,state){
//               if(state is NavigationProductPageState){
//                 return Container(
//                   height: size.height,
//                   child: Column(
//                     children: [
//                       Text("Ofertas",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
//                       SizedBox(height: 10,),
//
//                       BlocBuilder <NavigationBloc,NavigationStates>(
//                           builder: (context,state){
//                             if(state is NavigationProductPageState){
//                               List<Offer> _offersObtain=state.props[1];
//                               return Container(
//                                 height: size.height*0.2,
//                                 // width: size.width*0.3,
//                                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                 child: ListView.builder(
//                                   // itemCount: snapshot.data.length,
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: _offersObtain.length,
//                                   itemBuilder: (context, index){
//                                     return Card(
//                                       color: color6.withOpacity(0.8),
//                                       // color: color3.withOpacity(0.8),
//                                       // color: color2.withOpacity(0.7),
//                                       elevation: 10.0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Image.asset("assets/images/${_offersObtain[index].imageUrl}",fit: BoxFit.fill,),
//                                           Positioned(
//                                             bottom: 0,
//                                             right: 0,
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),topLeft: Radius.circular(30.0)),
//                                                 color: Colors.yellow.withOpacity(0.9),
//                                               ),
//                                               // color: Colors.white.withOpacity(0.7),
//                                               padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 5.0,top: 5.0),
//
//                                               child: Center(
//                                                 child: Column(
//                                                   children: [
//                                                     Text("${_offersObtain[index].name}",style: TextStyle(fontSize: size.height*0.025,),),
//                                                     Text("Cantidad ${_offersObtain[index].unit}",style: TextStyle(fontSize: size.height*0.015,),),
//                                                     Text("${_offersObtain[index].price} Bs",style: TextStyle(fontSize: size.height*0.015,color: color3),),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(5.0),
//                                             child: Text("Oferta ${_offersObtain[index].discount}%",style: TextStyle(fontSize: size.height*0.03,color: Colors.black),),
//                                             // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             }else{
//                               return Container();
//                             }
//                           }
//                       ),
//                       Text("Productos",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
//                       // categoriesScroller,
//                       BlocBuilder <NavigationBloc,NavigationStates>(
//                           builder: (context,state){
//                             if(state is NavigationProductPageState){
//                               List<Product> _productsObtain=state.props[0];
//                               return Container(
//                                 height: size.height*0.53,
//                                 child: ListView.builder(
//                                   // itemCount: snapshot.data.length,
//                                   itemCount: _productsObtain.length,
//                                   itemBuilder: (context, index){
//                                     return Card(
//                                       color: color1,
//                                       elevation: 5.0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.all(10.0),
//                                             child: Image.asset("assets/images/${_productsObtain[index].imageUrl}",height: size.width*0.2,width: size.width*0.2,),
//                                             // child: Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
//                                             // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
//                                           ),
//                                           Container(
//                                             child: Column(
//                                               children: [
//                                                 Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
//                                                 Text("Cantidad: ${_productsObtain[index].unit}",style: TextStyle(fontSize: 15.0,color: color5),),
//                                                 Text("Precio: ${_productsObtain[index].price} Bs",style: TextStyle(fontSize: 15.0,color: color3),),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             }else{
//                               return Container();
//                             }
//                           }
//                       ),
//                     ],
//                   ),
//                 );
//               }else{
//                 return Container();
//               }
//             },
//           ),
//         ));
//   }
// }

// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();
//
//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 130,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(color: Colors.orange.shade400,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Most\nFavorites",
//                         style: TextStyle(fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "20 Items",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 130,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(color: Colors.blue.shade400,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Newest",
//                           style: TextStyle(fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "20 Items",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 130,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlueAccent.shade400,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Super\nSaving",
//                         style: TextStyle(fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "20 Items",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// }
