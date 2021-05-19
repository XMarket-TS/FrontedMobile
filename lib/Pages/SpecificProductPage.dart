import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Models/ListProduct.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/Repository/MyBehavior.dart';
import 'package:x_market/States/NavigationStates.dart';
import '../Globals.dart' as globals;

import '../Colors.dart';

class SpecificProductPage extends StatefulWidget {
  SpecificProduct _product;

  SpecificProductPage(this._product);

  @override
  _SpecificProductPageState createState() =>
      _SpecificProductPageState(this._product);
// _SpecificProductPageState createState() => _SpecificProductPageState();
}

class _SpecificProductPageState extends State<SpecificProductPage> {
  SpecificProduct _product;

  _SpecificProductPageState(this._product);

  TextEditingController _units = TextEditingController();

  // _units.text="0";
  ListProduct _addProduct = ListProduct();

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
                SpecificProduct _product = state.props[0];
                _units.text = "";
                // _units.text=_product.unit.toString();
                // print("Prueba ahhh" + _product.productId.toString());
                // List<Offer> _listOffer=state.props[1];
                return SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.28,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _product.imageUrl.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: color6.withOpacity(0.8),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Image.network(_product.imageUrl[index],
                                      fit: BoxFit.fill),
                                );
                              }),
                        ),
                        Container(
                          height: size.height * 0.49,
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            // borderRadius: BorderRadius.circular(20),
                            color: color1,
                          ),
                          // color: color1,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  _product.name,
                                  style: TextStyle(
                                      color: color2, fontSize: size.height * 0.03),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  _product.description,
                                  style: TextStyle(
                                      color: color5, fontSize: size.height * 0.02),
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: color3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8, right: 10, left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Disponible: ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: size.height * 0.024),
                                            ),
                                            Text(
                                              _product.unit.toString(),
                                              style: TextStyle(
                                                  color: color5,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.height * 0.024),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: color3,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8, right: 10, left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Precio: ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: size.height * 0.024),
                                            ),
                                            Text(
                                              "${_product.price.toString()} Bs",
                                              style: TextStyle(
                                                  color: color5,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.height * 0.024),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // print("Alert producto");
                                        // return _chooseProduct();
                                        return showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return chooseProduct(size, _product,
                                                  _units, _addProduct);
                                            });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: color4,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              right: 20,
                                              left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Agregar",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: size.height * 0.024),
                                              ),
                                              Icon(
                                                Icons.add_shopping_cart,
                                                color: Colors.white,
                                                size: size.height * 0.028,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Text("dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf vdadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf vvdadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf vvvdadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf dadslajflsjdf;jaldfjda;ljfldasjfl sldfj l lsjdfl jf jsldj fl jsldj lfsjd ljsf ")
                              ],
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
    ));
  }
}

class chooseProduct extends StatefulWidget {
  Size size;
  SpecificProduct _product;
  TextEditingController _units;
  ListProduct _addProduct;

  chooseProduct(this.size, this._product, this._units, this._addProduct);

  @override
  _chooseProductState createState() => _chooseProductState(
      this.size, this._product, this._units, this._addProduct);
}

class _chooseProductState extends State<chooseProduct> {
  Size size;
  SpecificProduct _product;
  TextEditingController _units;
  ListProduct _addProduct;

  _chooseProductState(this.size, this._product, this._units, this._addProduct);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.only(top: 0),
      contentPadding: EdgeInsets.only(top: 8, left: 8, right: 8),
      title: Container(
        width: size.width * 0.3,
        height: size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage(_product.imageUrl[0]), fit: BoxFit.cover)),
      ),
      backgroundColor: color1,
      content: Container(
          width: size.width,
          height: size.height * 0.2,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.025,
                ),
                Text(
                  "Cantidad:",
                  style: TextStyle(
                      color: color5, fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  color: color1,
                  child: TextField(
                    controller: _units,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(size.height * 0.01),
                    ),
                    style: TextStyle(color: color5),
                    cursorColor: color2,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Text(
                  "Precio:",
                  style: TextStyle(
                      color: color5, fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  _product.price.toString(),
                  style: TextStyle(
                      color: color5, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                // SizedBox(height: 10,),
                // Text(_news.source,style: TextStyle(color: color5),),
              ],
            ),
          )),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Agregar',
            style: TextStyle(color: color4),
          ),
          onPressed: () {
            // print(_product.productId);
            setState(() {
              // print(_product.productId);
              _addProduct.productId = _product.productId;
              _addProduct.productName = _product.name;
              _addProduct.price = _product.price;
              _addProduct.unit = int.parse(_units.text);
              _addProduct.imageUrl = _product.imageUrl[0];
              globals.listProductCard.add(_addProduct);
              // print("prueba de agregar un producto al carro");
              // print(globals.listProductCard.length);
              Navigator.of(context).pop();
            });
          },
        ),
        TextButton(
          child: Text(
            'Cancelar',
            style: TextStyle(color: color2),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
