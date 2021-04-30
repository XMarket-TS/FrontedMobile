import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/Tarjeta.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class SpecificCardPage extends StatefulWidget {
  Tarjeta _card;

  SpecificCardPage(this._card);

  @override
  _SpecificCardPageState createState() => _SpecificCardPageState(this._card);
}

class _SpecificCardPageState extends State<SpecificCardPage> {
  Tarjeta _card;

  _SpecificCardPageState(this._card);

  TextEditingController _bank = TextEditingController();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _expirationYear = TextEditingController();
  TextEditingController _expirationMonth = TextEditingController();
  TextEditingController _cvc = TextEditingController();

  Tarjeta _update=Tarjeta();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text("Card", style: TextStyle(fontSize: size.height * 0.045),),
        centerTitle: true,
      ),
      body: BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, state) {
          if (state is SpecificCardPageState) {
            Tarjeta _card = state.props[0];
            // _bank.text=null;
            // _cardNumber.text =null;
            // _expirationYear.text =null;
            // _expirationMonth.text=null;
            // _cvc.text=null;
            // _bank.text = _card.bank;
            // _cardNumber.text = _card.cardNumber.toString();
            // _expirationYear.text = _card.expirationYear.toString();
            // _expirationMonth.text = _card.expirationMonth.toString();
            // _cvc.text = _card.cvc.toString();
            // print(_card);
            return SingleChildScrollView(
              child: Container(
                // alignment: Alignment.topCenter,
                padding: EdgeInsets.only(left: 8,right: 8),
                // height: size.height,
                color: color1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.width*0.2,),
                    Container(
                      width: size.width*0.97,
                      decoration: BoxDecoration(
                        color: color7,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _bank,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(size.height * 0.01),
                          labelText: "Banco Actual: ${_card.bank}",
                        ),
                        // maxLines: 100,
                        style: TextStyle(color: Colors.white),
                        cursorColor: color2,
                      ),
                    ),
                    SizedBox(height: size.width*0.04,),
                    Container(
                      width: size.width*0.97,
                      decoration: BoxDecoration(
                        color: color7,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _cardNumber,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(size.height * 0.01),
                          labelText: "Numero Tarjeta: ${_card.cardNumber}",),
                        // maxLines: 100,
                        style: TextStyle(color: Colors.white),
                        cursorColor: color2,
                      ),
                    ),
                    SizedBox(height: size.width*0.04,),
                    Container(
                      width: size.width*0.97,
                      decoration: BoxDecoration(
                        color: color7,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _expirationYear,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(size.height * 0.01),
                          labelText: "Año Expiración: ${_card.expirationYear}",),
                        // maxLines: 100,
                        style: TextStyle(color: Colors.white),
                        cursorColor: color2,
                      ),
                    ),
                    SizedBox(height: size.width*0.04,),
                    Container(
                      width: size.width*0.97,
                      decoration: BoxDecoration(
                        color: color7,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _expirationMonth,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(size.height * 0.01),
                          labelText: "Mes Expiración: ${_card.expirationMonth}",),
                        // maxLines: 100,
                        style: TextStyle(color: Colors.white),
                        cursorColor: color3,
                      ),
                    ),
                    SizedBox(height: size.width*0.04,),
                    Container(
                      width: size.width*0.97,
                      decoration: BoxDecoration(
                        color: color7,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _cvc,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(size.height * 0.01),
                          labelText: "CVC: ${_card.cvc}",
                        ),
                        // maxLines: 100,
                        style: TextStyle(color: Colors.white),
                        cursorColor: color3,
                      ),
                    ),
                    SizedBox(height: size.width*0.2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            _update.cardId=_card.cardId;
                            _update.userId=_card.userId;
                            _bank.text.isNotEmpty?_update.bank=_bank.text:_update.bank=_card.bank;
                            _cardNumber.text.isNotEmpty?_update.cardNumber=int.parse(_cardNumber.text):_update.cardNumber=_card.cardNumber;
                            _expirationYear.text.isNotEmpty?_update.expirationYear=int.parse(_expirationYear.text):_update.expirationYear=_card.expirationYear;
                            _expirationMonth.text.isNotEmpty?_update.expirationMonth=int.parse(_expirationMonth.text):_update.expirationMonth=_card.expirationMonth;
                            _cvc.text.isNotEmpty?_update.cvc=int.parse(_cvc.text):_update.cvc=_card.cvc;
                            _update.creationDate=_card.creationDate;
                            _update.status=_card.status;
                            print("prueba list update");
                            print(_update.bank);
                            BlocProvider.of<NavigationBloc>(context).add(UpdateCardEvent(_update,_card.userId));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width*0.3,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: color3,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Guardar",style: TextStyle(color: Colors.white,fontSize: size.width*0.05),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<NavigationBloc>(context).add(DeleteCardEvent(_card.cardId, _card.userId));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width*0.3,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: color2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Eliminar",style: TextStyle(color: Colors.white,fontSize: size.width*0.05),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.width*0.3,),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    ));
  }
}
