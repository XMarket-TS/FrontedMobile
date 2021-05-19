import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Components/PopupMenuComponent.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/States/NavigationStates.dart';
import '../Globals.dart' as globals;

import '../Colors.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String qrCode = 'unknown';
  String stateQr="En espera";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text(
          "Cart",
          style: TextStyle(fontSize: size.height * 0.045),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuComponent(),
          )
        ],
      ),
      body: BlocBuilder<NavigationBloc,NavigationStates>(
        builder: (context,state){
          if(state is QrState){
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  // color: color1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height*0.3,),
                      Container(
                        height: size.height * 0.1,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: color1,
                        ),
                        // color: color2,
                        child: Center(
                          child: Text(
                            // qrCode,
                            stateQr,
                            style:
                            TextStyle(color: color5, fontSize: size.height * 0.08),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // print("entro a escanear");
                          scanQrCode();
                        },
                        child: Container(
                          width: size.width*0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color3,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 10, left: 10),
                              // top: 8, bottom: 8, right: 20, left: 20),
                              child: Text(
                                "Scanear Qr",
                                style: TextStyle(
                                    color: Colors.white, fontSize: size.height * 0.024),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // print("entro a escanear");
                          if(stateQr=="¡Listo!") {
                            BlocProvider.of<NavigationBloc>(context).add(QrAditionEvent(qrCode));
                          }else{stateQr="Debe escanear";}
                        },
                        child: Container(
                          width: size.width*0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color2,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 30, left: 30),
                              // top: 8, bottom: 8, right: 20, left: 20),
                              child: Text(
                                "Agregar al Carro",
                                style: TextStyle(
                                    color: Colors.white, fontSize: size.height * 0.024),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }else{
            return Container();
          }
        },
      )
    );
  }

  Future<void> scanQrCode() async {
    String qrCode;
    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrCode = qrCode;
        this.stateQr="¡Listo!";
      });
    } catch (error) {
      qrCode = 'Error al tener la version de la plataforma';
    }
  }
}
