import 'dart:convert';

import 'package:x_market/Models/ConfirmUser.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/url.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User> obtainUserProfile(int userId) async {
    try {
      // print("entra al obtainUserProfile");
      // print(userId);
      String url = directionUrl + "user/" + userId.toString();
      User user = User();
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var user2 = jsonDecode(res.body);
      user = User.fromJson(user2);
      // print(singleDriver2);
      // user.userId = (user2["userId"]);
      // user.personUserId = (user2["personId"]);
      // user.userName = (user2["userName"]);
      // user.name = (user2["name"]);
      // user.email = (user2["email"]);
      // user.imageUrl = (user2["imageUrl"]);
      // user.cellphone = (user2["cellphone"]);
      if (res.statusCode == 200) {
        // print("obtencion de datos del usuario");
        return user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User> confirmUser(ConfirmUser confirmUser) async {
    try {
      String url = directionUrl + "user/login";
      User user = User();
      // print("llego al repositorio del usuario");
      // print(confirmUser.userName);
      // print(confirmUser.password);
      var res = await http.post(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(confirmUser.toJsonUp()));
      // print("devolucion userconfirm");
      // print(jsonEncode(confirmUser.toJsonUp()));
      // print(res.body);
      var user2 = jsonDecode(res.body);
      // print("datos que devuelve usuario");
      // print(user2["userId"]);
      // print(singleDriver2);
      user = User.fromJson(user2);
      // user.userId = (user2["userId"]);
      // user.personUserId = (user2["personUserId"]);
      // user.name = (user2["name"]);
      // user.surName=(user2['surname']);
      // user.userName = (user2["username"]);
      // user.status=(user2['status']);
      // user.imageUrl = (user2["photo"]);
      // user.email = (user2["email"]);
      // user.cellphone = (user2["cellphone"]);
      if (res.statusCode == 200) {
        // print("DoneConfirmUser");
        return user;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User> addUser(User user) async {
    try {
      String url = directionUrl + "user";
      User user1 = User();
      print("llego al repositorio del addUser");
      // print(confirmUser.userName);
      // print(confirmUser.password);
      var res = await http.post(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user.toJson()));
      // print("devolucion userconfirm");
      // print(jsonEncode(confirmUser.toJsonUp()));
      // print(res.body);
      var user2 = jsonDecode(res.body);
      // print("datos que devuelve usuario");
      // print(user2["userId"]);
      user1 = User.fromJson(user2);
      if (res.statusCode == 200) {
        print("DoneCreateUser");
        return user1;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
