import 'dart:convert';

import 'package:x_market/Models/ConfirmUser.dart';
import 'package:x_market/Models/ImagesCloudinary.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/url.dart';
import 'package:http/http.dart' as http;

class ImageRepository {

  Future<String> uploadImageCloudinary(ImagesCloudinary imagesCloudinary)async{
    try {
      String imageUrl=null;
      String cloudName="fulano";
      print("entro al repo image");
      print(imagesCloudinary.preset);
      // imagesCloudinary.preset="ik1apwhk";
      // imagesCloudinary.tags="browser-upload";
      String url = "https://api.cloudinary.com/v1_1/"+cloudName+"/upload";
      // User user=User();
      print("llego al repositorio del imagenCloudinary");
      // print("fusion branches");
      // print(confirmUser.userName);
      // print(confirmUser.password);
      var res = await http.post(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(imagesCloudinary.toJson()));
      // print("devolucion userconfirm");
      // print(jsonEncode(confirmUser.toJsonUp()));
      // print(res.body);
      var imageUrl2 = jsonDecode(res.body);
      print(imageUrl2);
      // imageUrl=imageUrl2["secure_url"];
      imageUrl="http";
      print("url obtenida de la subida");
      print(imageUrl);
      if (res.statusCode == 200) {
        print("Se subio cloudinary");
        return imageUrl;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

}
