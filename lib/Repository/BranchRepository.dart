import 'package:flutter/material.dart';
import 'package:x_market/Models/Branch.dart';
class BranchRepository {
  List<Branch> _branchList=[
    Branch(1,"Pedro Fuentes","Sucursal 1",244534,"Centro","Av. Mariscal"),
    Branch(2,"Ana Vera","Sucursal 2",242323,"San Pedro","Av. Castrillo"),
    Branch(3,"Rodrigo Perez","Sucursal 3",242346,"Zona Sur","Av. Calacoto"),
    Branch(4,"Luisa Cuevas","Sucursal 4",242342,"Irpavi","Av. Irpavi"),
    Branch(5,"Kevin Perez","Sucursal 5",246785,"Sopocachi","Av. Landaeta"),
    Branch(6,"Carlos Cadima","Sucursal 6",243454,"El Alto","Av. Heroes"),
  ];
  List<Branch> get branchList => _branchList;

  set offerList(List<Branch> value) {
    _branchList = value;
  }
}