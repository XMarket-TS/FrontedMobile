import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/url.dart';
import 'package:http/http.dart' as http;

class CardRepository{
  Future <User> obtainUserProfile (int userId) async{
    try{


      String url=directionUrl+"user/"+userId.toString();
      User user;
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var user2=jsonDecode(res.body);
      // print(singleDriver2);
      user.userId=(user2["userId"]);
      user.personUserId=(user2["personId"]);
      user.userName=(user2["userName"]);
      user.password=(user2["password"]);
      user.name=(user2["name"]);
      user.email=(user2["email"]);
      user.imageUrl=(user2["imageUrl"]);
      user.cellphone=(user2["cellphone"]);
      if(res.statusCode == 200){
        // print("DoneListaBranchs");
        return user;
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