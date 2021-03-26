import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:x_market/Models/Branch.dart';
import 'package:x_market/Repository/url.dart';
class BranchRepository {
  // List<Branch> _branchList=[
  //   Branch(1,1,"Sucursal 1",244534,"Centro","Av. Mariscal"),
  //   Branch(2,2,"Sucursal 2",242323,"San Pedro","Av. Castrillo"),
  //   Branch(3,3,"Sucursal 3",242346,"Zona Sur","Av. Calacoto"),
  //   Branch(4,4,"Sucursal 4",242342,"Irpavi","Av. Irpavi"),
  //   Branch(5,5,"Sucursal 5",246785,"Sopocachi","Av. Landaeta"),
  //   Branch(6,6,"Sucursal 6",243454,"El Alto","Av. Heroes"),
  // ];
  // List<Branch> get branchList => _branchList;
  //
  // set offerList(List<Branch> value) {
  //   _branchList = value;
  // }
  Future<List<Branch>> obtainListBranch () async{
    try{

      String url=directionUrl+"branchOffice/list";

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var branchCollection2 = json.decode(utf8.decode(res.bodyBytes));
      // var branchCollection2;
      var branchCollection3=List<Branch>();
      // var branchCollection2=jsonDecode(res.body);


      for(branchCollection2 in branchCollection2){
        branchCollection3.add(Branch.fromJson(branchCollection2));
      }
      print(branchCollection3[1].name);
      // body: jsonEncode(singleDriver.toJson()));
      if(res.statusCode == 200){
        print("DoneListaBranchs");
        return branchCollection3;
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