import 'package:flutter/material.dart';
import 'dart:async';
import '../Models/Product.dart';

class ProductBloc{
  List<Product> _productList=[
    Product(1,"Lechuga",2.44,"Fresca, traida del tropico",4,"burger.png",1,"Vegetales"),
    Product(2,"Tomate",3.44,"Fresca, traida del tropico",4,"burger.png",1,"Vegetasles"),
    Product(3,"Pepino",4.44,"Fresca, traida del tropico",4,"burger.png",1,"Vegetales"),
    Product(4,"Carne",5.44,"Fresca, traida del tropico",4,"burger.png",1,"Carnes"),
    Product(5,"Pollo",6.44,"Fresca, traida del tropico",4,"burger.png",1,"Carnes"),
  ];
  Stream <List<Product>> get getProductList async*{
    final List<Product> _products=[];
    for(Product product in _productList){
      // await Future.delayed(Duration(seconds: 2));
      _products.add(product);
      yield _products;
    }
  }
  //Streams Controller
  final _productListStreamController=StreamController<List<Product>>();
  final _productDecrementStreamController=StreamController<Product>();
  //Getter: streams y sinks
  Stream <List<Product>> get productListStream =>_productListStreamController.stream;
  StreamSink <List<Product>> get productListSink =>_productListStreamController.sink;

  StreamSink <Product> get productDecrement =>_productDecrementStreamController.sink;

  ProductBloc(){  //escucha cada que se llama a ProductBloc
    _productListStreamController.add(_productList);
    _productDecrementStreamController.stream.listen(_reductionProduct);
  }
  //Funciones principales
  _reductionProduct(Product product){
    int cantidad=product.unit;
    _productList[product.productId-1].unit=cantidad-1;
    productListSink.add(_productList);
  }
  // dispose, para liberar los recursos que usamos en los streams
  void dispose(){
    _productListStreamController.close();
    _productDecrementStreamController.close();
  }
}