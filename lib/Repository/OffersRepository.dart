import 'dart:convert';
import 'package:x_market/Models/Offer.dart';
import 'package:http/http.dart' as http;
import 'package:x_market/Repository/url.dart';

class OffersRepository {
  // List<Offer> _offerList = [
  //   Offer("Lechuga", 2.44, "21-3-21", "29-3-21", "Fresca, traida del tropico",
  //       4, "burger.png", 15.0, 1, 1),
  //   Offer("Tomate", 3.44, "21-3-21", "29-3-21", "Fresca, traida del tropico", 4,
  //       "cola.png", 20.0, 2, 1),
  //   Offer("Pepino", 4.44, "21-3-21", "25-3-21", "Fresca, traida del tropico", 4,
  //       "fries.png", 25.0, 1, 1),
  //   Offer("Carne", 5.44, "21-3-21", "26-3-21", "Fresca, traida del tropico", 4,
  //       "noodles.png", 15.0, 3, 1),
  //   Offer("Pollo", 6.44, "21-3-21", "26-3-21", "Fresca, traida del tropico", 4,
  //       "wrap.png", 35.0, 4, 1),
  // ];
  //
  // List<Offer> get offerList => _offerList;
  //
  // set offerList(List<Offer> value) {
  //   _offerList = value;
  // }
  Future<List<Offer>> obtainOffersByBranch(int branchId)async{
    try {
      // var _branchId=branchId.toString();
      print("entro a repo de ofertas");
      Offer offer=Offer();
      String url = directionUrl + "offer/product/branch/" + branchId.toString();

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var offer2 = jsonDecode(res.body);
      var offer3=List<Offer>();
      for(offer2 in offer2){
        offer3.add(Offer.fromJson(offer2));
      }
      // product = Product.fromJson(offer2);
      if (res.statusCode == 200) {
        print("se obtuvo lista de ofertas");
        print(offer3[0].name);
        return offer3;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
