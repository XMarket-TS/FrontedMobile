import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Components/PopupMenuComponent.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/ListProduct.dart';
import 'package:x_market/Models/PurchaseData.dart';
import 'package:x_market/Models/PurchaseProduct.dart';
import 'package:x_market/Repository/MyBehavior.dart';
import 'package:x_market/States/NavigationStates.dart';
import '../Globals.dart' as globals;
import 'package:auto_size_text/auto_size_text.dart';
import '../Colors.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double costo = 0;
  PurchaseData _purchaseData=PurchaseData();
  TextEditingController _billingAddres=TextEditingController();
  TextEditingController _city=TextEditingController();
  ListProduct _addProduct = ListProduct();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // print(globals.listProductCard.length);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text(
          "Compras",
          style: TextStyle(fontSize: size.height * 0.045,color: color1),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuComponent(),
          )
        ],
      ),
      body: BlocBuilder<NavigationBloc,NavigationStates>(
        builder: (context,state){
          if(state is NavigationCartPageState || state is QrAditionState){
            return SingleChildScrollView(
                child: globals.listProductCard.length > 0
                    ? Container(
                  height: size.height,
                  color: color1,
                  // padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        height: size.height * 0.6,
                        color: color1,
                        child: ListView.builder(
                            itemCount: globals.listProductCard.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: color1,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.width * 0.3,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(globals
                                                  .listProductCard[index]
                                                  .imageUrl),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.08,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.width * 0.07,
                                            width: size.width * 0.36,
                                            child: AutoSizeText(
                                              globals.listProductCard[index]
                                                  .productName,
                                              style: TextStyle(
                                                  color: color2,
                                                  fontSize: 30.0),
                                              maxLines: 1,
                                            ),
                                          ),
                                          // Text(globals.listProductCard[index].productName,style: TextStyle(color: color2,fontSize: size.width*0.05),),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Cant. ",
                                                style: TextStyle(
                                                    color: color5,
                                                    fontSize:
                                                    size.width * 0.04),
                                              ),
                                              Text(
                                                globals
                                                    .listProductCard[index].unit
                                                    .toString(),
                                                style: TextStyle(
                                                    color: color4,
                                                    fontSize:
                                                    size.width * 0.04),
                                              ),
                                            ],
                                          ),
                                          // Text(globals.listProductCard[index].price.toString(),style: TextStyle(color: color5),),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            "${globals.listProductCard[index].price.toString()} Bs",
                                            style: TextStyle(
                                                color: color3,
                                                fontSize: size.width * 0.04),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.06,
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            height: size.width * 0.1,
                                            width: size.width * 0.1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              color: color2,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              globals.listProductCard[index]
                                                  .unit++;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: size.width * 0.035,
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            height: size.width * 0.1,
                                            width: size.width * 0.1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              color: color2,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (globals.listProductCard[index]
                                                  .unit >
                                                  0) {
                                                globals.listProductCard[index]
                                                    .unit--;
                                              } else if (globals
                                                  .listProductCard[index]
                                                  .unit ==
                                                  0) {
                                                globals.listProductCard
                                                    .removeAt(index);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0)),
                          color: color3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      color: color2,
                                      fontSize: size.width * 0.05),
                                ),
                                Text(
                                  "${costoTotal(costo).toString()} Bs",
                                  style: TextStyle(
                                      color: color1,
                                      fontSize: size.width * 0.05),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.width * 0.04,
                            ),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                color: color2,
                                minWidth: size.width * 0.65,
                                height: size.width * 0.1,
                                child: Text(
                                  "Comprar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.05),
                                ),
                                onPressed: () {
                                  return showDialog(
                                      context: context,
                                      builder: (_) {
                                        return BlocProvider.value(value: BlocProvider.of<NavigationBloc>(context),
                                          child: buyProduct(size, _purchaseData,
                                              _billingAddres,_city, _addProduct,costoTotal(costo)),
                                        );
                                      }
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    : Container(
                  height: size.height - size.height * 0.08,
                  width: size.width,
                  color: color1,
                  child: Center(
                    child: Container(
                      child: Text(
                        "  Usted no tiene ningún producto agregado  ",
                        style: TextStyle(
                            color: color2, fontSize: size.width * 0.05),
                      ),
                    ),
                  ),
                ));
          }else{return Container();}
        },
      )
    );
  }
}

double costoTotal(double costo) {
  int taman = globals.listProductCard.length;
  for (int i = 0; i < taman; i++) {
    costo +=
        (globals.listProductCard[i].unit * globals.listProductCard[i].price);
  }
  return costo;
}

class buyProduct extends StatefulWidget {
  Size size;
  PurchaseData _product;
  TextEditingController _billingAddress;
  TextEditingController  _city;
  ListProduct _addProduct;
  double _total;

  buyProduct(this.size, this._product, this._billingAddress, this._city,this._addProduct,this._total);

  @override
  _buyProductState createState() => _buyProductState(
      this.size, this._product, this._billingAddress, this._city,this._addProduct,this._total);
}

class _buyProductState extends State<buyProduct> {
  Size size;
  PurchaseData _product;
  TextEditingController _billingAddress;
  TextEditingController  _city;
  ListProduct _addProduct;
  double _total;

  _buyProductState(this.size, this._product, this._billingAddress, this._city,this._addProduct,this._total);
  PurchaseProduct _purchaseProduct=PurchaseProduct();

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
                // image: NetworkImage(_product.productPurchases[0].), fit: BoxFit.cover)),
                image: AssetImage("assets/images/loginImage2.jpg"),fit: BoxFit.cover)),
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
                  "Ingrese la Ciudad:",
                  style: TextStyle(
                      color: color5, fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  color: color1,
                  child: TextField(
                    controller: _city,
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
                  "Ingrese la Calle:",
                  style: TextStyle(
                      color: color5, fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  color: color1,
                  child: TextField(
                    controller: _billingAddress,
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
                  "Total:",
                  style: TextStyle(
                      color: color5, fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${_total.toString()} Bs",
                  style: TextStyle(
                      color: color3, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                // SizedBox(height: 10,),
                // Text(_news.source,style: TextStyle(color: color5),),
              ],
            ),
          )),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Comprar',
            style: TextStyle(color: color3),
          ),
          onPressed: () {
            // print(_product.productId);
            _product.productPurchases=List();
            setState(() {
              for (int i = 0; i < globals.listProductCard.length; i++) {
                _purchaseProduct.productId=globals.listProductCard[i].productId;
                _purchaseProduct.price=globals.listProductCard[i].price;
                _purchaseProduct.unit=globals.listProductCard[i].unit;
                _product.productPurchases.add(_purchaseProduct);
              }
              _product.billingAddress=_billingAddress.text;
              _product.city=_city.text;
              _product.cardId=1;

              // print("prueba de agregar un producto al carro");
              // print(globals.listProductCard.length);
              BlocProvider.of<NavigationBloc>(context).add(PurchaseEvent(_product));
              Navigator.pop(context);
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
