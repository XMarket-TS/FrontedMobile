import 'package:flutter/material.dart';
import 'package:x_market/Models/Offer.dart';


class OffersRepository{
  List<Offer> _offerList=[
    Offer("Lechuga",2.44,"Fresca, traida del tropico",4,"burger.png",15.0,"Branch1"),
    Offer("Tomate",3.44,"Fresca, traida del tropico",4,"cola.png",20.0,"Branch2"),
    Offer("Pepino",4.44,"Fresca, traida del tropico",4,"fries.png",25.0,"Branch3"),
    Offer("Carne",5.44,"Fresca, traida del tropico",4,"noodles.png",15.0,"Branch4"),
    Offer("Pollo",6.44,"Fresca, traida del tropico",4,"wrap.png",35.0,"Branch5"),
  ];

  List<Offer> get offerList => _offerList;

  set offerList(List<Offer> value) {
    _offerList = value;
  }
}