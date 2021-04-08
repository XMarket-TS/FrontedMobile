import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class ProfilePage extends StatefulWidget {
  User _user;

  ProfilePage(this._user);

  @override
  _ProfilePageState createState() => _ProfilePageState(this._user);
}

class _ProfilePageState extends State<ProfilePage> {
  User _user;

  _ProfilePageState(this._user);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: color2,
        elevation: 5,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: size.height * 0.045),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, state) {
          if (state is ProfilePageState) {
            User _user = state.props[0];
            return SingleChildScrollView(
              child: Container(
                height: size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 10),
                          child: CircleAvatar(
                            radius: size.height * 0.085,
                            backgroundImage:
                                AssetImage('assets/images/burger.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 38.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nombre',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.035,
                                  color: color3,
                                ),
                              ),
                              Text(
                                'ejemplo@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.02,
                                  color: color3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: color3,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 20, left: 20),
                              child: Text(
                                "Editar Perfil",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.028),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // BlocProvider.of<NavigationBloc>(context).add(NavigationCategoriesPageEvent(_listBranches[index].branchId));
                            BlocProvider.of<NavigationBloc>(context).add(CardPageEvent(1));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: color3,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 20, left: 20),
                              child: Text(
                                "Editar Tarjetas",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.028),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Historial",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.04,
                                color: color4),
                          ),
                        ],
                      ),
                    )),
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
