import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:x_market/Models/CardList.dart';
import 'package:x_market/Models/Tarjeta.dart';

import 'package:x_market/Repository/url.dart';
import 'package:http/http.dart' as http;

class CardRepository {
  Future<List<CardList>> obtainCardList(int userId) async {
    try {
      // print(userId.toString());
      String url = directionUrl + "user/" + userId.toString() + "/listCards";
      // List<CardList> cardList;
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var cardList2 = json.decode(utf8.decode(res.bodyBytes));
      // var branchCollection2;
      var cardList3 = List<CardList>();
      // var branchCollection2=jsonDecode(res.body);
      for (cardList2 in cardList2) {
        cardList3.add(CardList.fromJson(cardList2));
      }
      // print(cardList3[0].bank);
      if (res.statusCode == 200) {
        // print("DoneListaCards");
        return cardList3;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<Tarjeta> obtainSpecificCard(int cardId) async {
    try {
      Tarjeta card = Tarjeta();
      print("pruebaespecific");
      print(cardId);
      String url = directionUrl + "card/" + cardId.toString();
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var card2 = jsonDecode(res.body);
      // print("blabla");
      // print(card2);
      card.cardId = (card2["cardId"]);
      // card.cardId=(card2["cardId"]);
      // print(card.cardId);
      card.userId = (card2["userId"]);
      // card.userId=;
      card.bank = (card2["cardName"]);
      card.cardNumber = (card2["cardNumber"]);
      card.expirationYear = (card2["expirationYear"]);
      card.expirationMonth = (card2["expirationMonth"]);
      card.cvc = (card2["cvc"]);
      card.creationDate = (card2["creationDate"]);
      card.status = (card2["status"]);
      print("specificpruebas");
      print(card.bank);
      if (res.statusCode == 200) {
        // print("exito en card especifico");
        return card;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<int> updateCard(Tarjeta tarjeta) async {
    try {
      String url = directionUrl + "updateCard";
      var res = await http.put(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(tarjeta.toJsonUp()));
      if (res.statusCode == 200) {
        print("Done Update");
        return 1;
      } else {
        return 0;
      }
    } catch (error) {
      print(error);
      return 0;
    }
  }

  Future<void> deleteCard(int cardId) async {
    String url = directionUrl + "card/" + cardId.toString();
    var res = await http.delete(url, //ip for virtualized devices
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (res.statusCode == 200) {
      print("exito al eliminar la tarjeta");
    }
  }
}
