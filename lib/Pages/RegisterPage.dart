import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Colors.dart';
class CreateAccountPage extends StatelessWidget {
  TextEditingController _firstName=TextEditingController();
  TextEditingController _lastName=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect)=>LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black,Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                  "assets/images/loginImage3.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height*0.1,),
                Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: size.width*0.17,
                        backgroundColor: Colors.grey[400].withOpacity(0.5),
                        // backgroundColor: color7.withOpacity(0.9),
                        child: Icon(Icons.perm_identity_rounded,color: color5,size: size.width*0.2,),
                      ),
                    ),
                    Positioned(
                      top: size.height*0.11,
                      left: size.width*0.59,
                      child: Container(
                        height: size.width*0.12,
                        width: size.width*0.12,
                        decoration: BoxDecoration(
                          color: color2,
                          shape: BoxShape.circle,
                          border: Border.all(color: color5,width: 2)
                        ),
                        child: Icon(Icons.add,color: color5,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height*0.075,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _firstName,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(Icons.email_rounded,size: 30,),
                              ),
                              hintText: "Nombre",
                              hintStyle: TextStyle(fontSize: size.height*0.025,height: 1.5),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height*0.075,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _lastName,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(Icons.email_rounded,size: 30,),
                              ),
                              hintText: "Apellido",
                              hintStyle: TextStyle(fontSize: size.height*0.025,height: 1.5),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height*0.075,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(Icons.email_rounded,size: 30,),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: size.height*0.025,height: 1.5),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height*0.075,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(Icons.email_rounded,size: 30,),
                              ),
                              hintText: "Nombre de Usuario",
                              hintStyle: TextStyle(fontSize: size.height*0.025,height: 1.5),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height*0.075,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _password,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Icon(FontAwesomeIcons.lock,size: 30,),
                              ),
                              hintText: "Contraseña",
                              // hintStyle: kBodyText,
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height*0.06,
                          width: size.width*0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: color3
                          ),
                          child: FlatButton(
                            onPressed: (){},
                            child: Text("Crear",style: TextStyle(color: color5,fontSize: size.height*0.025,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(width: size.width*0.1,),
                        Container(
                          height: size.height*0.06,
                          width: size.width*0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: color2
                          ),
                          child: FlatButton(
                            onPressed: (){},
                            child: Text("Cancelar",style: TextStyle(color: color5,fontSize: size.height*0.025,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.1,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

