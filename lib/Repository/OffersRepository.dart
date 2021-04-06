import 'package:flutter/material.dart';
import 'package:x_market/Models/Offer.dart';


class OffersRepository{
  List<Offer> _offerList=[
    Offer("Lechuga",2.44,"21-3-21","29-3-21","Fresca, traida del tropico",4,"burger.png",15.0,1,1),
    Offer("Tomate",3.44,"21-3-21","29-3-21","Fresca, traida del tropico",4,"cola.png",20.0,2,1),
    Offer("Pepino",4.44,"21-3-21","25-3-21","Fresca, traida del tropico",4,"fries.png",25.0,1,1),
    Offer("Carne",5.44,"21-3-21","26-3-21","Fresca, traida del tropico",4,"noodles.png",15.0,3,1),
    Offer("Pollo",6.44,"21-3-21","26-3-21","Fresca, traida del tropico",4,"wrap.png",35.0,4,1),
  ];

  List<Offer> get offerList => _offerList;

  set offerList(List<Offer> value) {
    _offerList = value;
  }
}