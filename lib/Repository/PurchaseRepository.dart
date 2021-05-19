import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Models/PurchaseProduct.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/Repository/url.dart';

class PurchaseRepository {

  Future<int> makePurchase(PurchaseProduct purchaseProduct,int userId) async {
    try {
      print("entro a repo de purchase");
      int result=0;
      // Product product=Product();
      String url = directionUrl + "purchase/user/" + userId.toString();

      var res = await http.post(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(purchaseProduct.toJson()));
      var purchase2 = jsonDecode(res.body);
      if(purchase2!=null){
        result=1;
      }
      // product = Product.fromJson(product2);
      if (res.statusCode == 200) {
        // print("se obtuvo producto por hash");
        // print(product.name);
        return result;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

}
