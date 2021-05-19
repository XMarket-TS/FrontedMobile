import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';

import '../Colors.dart';

class PopupMenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(onSelected: (result) {
      if (result == 1) {
        BlocProvider.of<NavigationBloc>(context).add(QrEvent());
      } else if (result == 2) {
        BlocProvider.of<NavigationBloc>(context).add(RecetasEvent());
      }
    }, itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.qr_code,
                color: color2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Qr Scan"),
              )
            ],
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.fiber_new_sharp,
                color: color2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Recetas"),
              )
            ],
          ),
          value: 2,
        ),
      ];
    });
  }
}
