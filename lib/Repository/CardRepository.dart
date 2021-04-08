import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:x_market/Models/CardList.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/url.dart';
import 'package:http/http.dart' as http;

class CardRepository{
  Future <List<CardList>> obtainCardList (int userId) async{
    try{
      print(userId.toString());

      String url=directionUrl+"user/"+userId.toString()+"/listCards";
      // List<CardList> cardList;
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var cardList2 = json.decode(utf8.decode(res.bodyBytes));
      // var branchCollection2;
      var cardList3=List<CardList>();
      // var branchCollection2=jsonDecode(res.body);
      for(cardList2 in cardList2){
        cardList3.add(CardList.fromJson(cardList2));
      }
      print(cardList3[0].bank);
      if(res.statusCode == 200){
        // print("DoneListaCards");
        return cardList3;
      }else{
        return null;
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }
}