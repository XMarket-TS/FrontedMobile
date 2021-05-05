import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_market/Pages/RegisterPage.dart';

import '../Colors.dart';

class LoginPage extends StatelessWidget {
  // LoginPage(this._inputType,this._inputAction);
  // TextInputType _inputType;
  // TextInputAction _inputAction;
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
                  "assets/images/loginImage2.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(child: Center(child: Text("X-Market",style: TextStyle(color: color5,fontSize: 60,fontWeight: FontWeight.bold),))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: size.height*0.075,
                  width: size.width*0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
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
                    color: Colors.grey[500].withOpacity(0.5),
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
              SizedBox(height: size.height*0.05,),
              Container(
                height: size.height*0.075,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: color2
                ),
                child: FlatButton(
                  onPressed: (){},
                  child: Text("Login",style: TextStyle(color: color5,fontSize: size.height*0.025,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountPage()));
                },
                child: Container(
                  child: Text("Crear una cuenta nueva",style:  TextStyle(color: color5,fontSize: size.height*0.025),),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1,color: color5))
                  ),
                ),
              ),
              SizedBox(height: size.height*0.08,),
            ],
          ),
        ),
      ],
    );
  }
}

