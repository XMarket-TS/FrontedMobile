import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Colors.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: color3,
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.5,
          child: Lottie.asset("assets/lottie/food1.json"),
        ),
      ),
    );
  }
}
