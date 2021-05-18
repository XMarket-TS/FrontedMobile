import 'package:flutter/material.dart';
import 'package:x_market/Components/PopupMenuComponent.dart';

import '../Colors.dart';

class RecetasPage extends StatefulWidget {
  @override
  _RecetasPageState createState() => _RecetasPageState();
}

class _RecetasPageState extends State<RecetasPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(),
        ),
      ),
    );
  }
}
