import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Models/Product.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class SpecificProductPage extends StatefulWidget {
  Product _product;

  SpecificProductPage(this._product);

  @override
  _SpecificProductPageState createState() =>
      _SpecificProductPageState(this._product);
}

class _SpecificProductPageState extends State<SpecificProductPage> {
  Product _product;

  _SpecificProductPageState(this._product);

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
          if (state is SpecificProductPageState) {
            Product _product = state.props[0];
            print("Prueba ahhh" + _product.productId.toString());
            // List<Offer> _listOffer=state.props[1];
            return Container(
              height: size.height,

              child: Column(
                children: [
                  // Text("${_product.productId}"),
                ],
              ),
              // child: Column(
              //   children: [
              //     // Text("Ofertas",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
              //     // SizedBox(height: 10,),
              //
              //     // Text("Productos",style: TextStyle(color: Colors.white,fontSize: size.width*0.08),),
              //     // categoriesScroller,
              //     Container(
              //       height: size.height*0.47,
              //       child: ListView.builder(
              //         // itemCount: snapshot.data.length,
              //         itemCount: _listProduct.length,
              //         itemBuilder: (context, index){
              //           return Dismissible(
              //             key: ObjectKey(_listProduct[index]),
              //             direction: DismissDirection.endToStart,
              //             background: Container(
              //               // alignment: Alignment.centerRight,
              //               // padding: EdgeInsets.symmetric(horizontal: 50.0),
              //               color: color6,
              //               child: Icon(Icons.add),
              //             ),
              //             onDismissed: (direction){
              //               setState(() {
              //                 _listProduct.removeAt(index);
              //               });
              //             },
              //             child: Card(
              //               color: color1,
              //               elevation: 5.0,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10.0),
              //               ),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Container(
              //                     padding: EdgeInsets.all(10.0),
              //                     child: Image.network("${_listProduct[index].imageUrl}",height: size.width*0.2,width: size.width*0.2,),
              //                     // child: Text("${_productsObtain[index].name}",style: TextStyle(fontSize: 20.0),),
              //                     // child: Text("${snapshot.data[index].name}",style: TextStyle(fontSize: 20.0),),
              //                   ),
              //                   Container(
              //                     child: Column(
              //                       children: [
              //                         Text("${_listProduct[index].name}",style: TextStyle(fontSize: 20.0,color: Colors.white),),
              //                         Text("Cantidad: ${_listProduct[index].unit}",style: TextStyle(fontSize: 15.0,color: color5),),
              //                         Text("Precio: ${_listProduct[index].price} Bs",style: TextStyle(fontSize: 15.0,color: color3),),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
            );
          } else {
            return Container(); //pantalla de error
          }
        },
      ),
    ));
  }
}
