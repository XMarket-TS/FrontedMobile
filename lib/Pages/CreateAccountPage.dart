// import 'dart:html';

import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_market/Bloc/NavigationBloc.dart';
import 'package:x_market/Events/NavigationEvents.dart';
import 'package:x_market/Models/ImagesCloudinary.dart';
import 'package:x_market/Models/User.dart';
import 'package:x_market/Repository/ImageRepository.dart';
import 'package:x_market/States/NavigationStates.dart';

import '../Colors.dart';

class CreateAccountPage extends StatefulWidget {
  // ImageRepository _imageRepository;
  //
  // CreateAccountPage(this._imageRepository);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _cellphone = TextEditingController();
  ImageRepository _imageRepository = ImageRepository();
  ImagesCloudinary _imagesCloudinary = ImagesCloudinary();
  String _imageUrl = "";
  final cloudinary = CloudinaryPublic('fulano', 'ik1apwhk', cache: false);
  User _user = User();
  File _image;
  final picker = ImagePicker();
  CloudinaryResponse response;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    // final picture= await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
      // _image = File(pickedFile.path);
      // _image=picture;
    });
  }

  Future uploadImage() async {
    // setState(() {
    //
    //   _imagesCloudinary.preset="ik1apwhk";
    //   _imagesCloudinary.tags="browser-upload";
    //   _imagesCloudinary.fileContents=_image;
    // });
    // print("datos en la funcion");
    // print(_imagesCloudinary.preset);
    // print(_imagesCloudinary.tags);
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);
    response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(_image.path,
          resourceType: CloudinaryResourceType.Image),
    );
    print(response.secureUrl);
    print("subido");
    // try {
    //   CloudinaryResponse response = await cloudinary.uploadFile(
    //     CloudinaryFile.fromFile(_image.path, resourceType: CloudinaryResourceType.Image),
    //   );
    //
    //   print(response.secureUrl);
    //   print("subido");
    // } catch (e) {
    //   print(e.message);
    //   print(e.request);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginImage3.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, state) {
            if (state is RegisterPageState) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: size.width * 0.17,
                              backgroundColor:
                                  Colors.grey[400].withOpacity(0.5),
                              // backgroundColor: color7.withOpacity(0.9),
                              child: _image != null
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(
                                      Icons.perm_identity_rounded,
                                      color: color2,
                                      size: size.width * 0.2,
                                    ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.103,
                            left: size.width * 0.59,
                            child: GestureDetector(
                              onTap: () {
                                // print("ELEGIR IMAGEN");
                                getImage();
                              },
                              child: Container(
                                height: size.width * 0.12,
                                width: size.width * 0.12,
                                decoration: BoxDecoration(
                                    color: color2,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: color1, width: 2)),
                                child: Icon(
                                  Icons.add,
                                  color: color1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: color2),
                            child: FlatButton(
                              onPressed: () {
                                // setState(() {
                                _imagesCloudinary.preset = "ik1apwhk";
                                _imagesCloudinary.tags = "browser-upload";
                                _imagesCloudinary.fileContents = _image;
                                // });
                                uploadImage();
                                // print("para enviar al repo");
                                // print(_image);
                                // print(_imagesCloudinary.fileContents);
                                // print(imagesCloudinary.preset);
                                // _imageUrl=await  _imageRepository.uploadImageCloudinary(imagesCloudinary);
                              },
                              child: Text(
                                "Guardar Imagen",
                                style: TextStyle(
                                    color: color1,
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
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
                                      child: Icon(
                                        Icons.perm_contact_cal_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Nombre",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
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
                              height: size.height * 0.075,
                              width: size.width * 0.8,
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
                                      child: Icon(
                                        Icons.perm_contact_cal_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Apellido",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
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
                              height: size.height * 0.075,
                              width: size.width * 0.8,
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
                                      child: Icon(
                                        Icons.email_rounded,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Nombre de Usuario",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
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
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _gender,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Género (Male/Female)",
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.025,
                                        height: 1.5),
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
                              height: size.height * 0.075,
                              width: size.width * 0.8,
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
                                      child: Icon(
                                        Icons.email_rounded,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Email",
                                    // hintStyle: kBodyText,
                                  ),
                                  // obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
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
                                      child: Icon(
                                        FontAwesomeIcons.lock,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Contraseña",
                                    // hintStyle: kBodyText,
                                  ),
                                  obscureText: true,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _cellphone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.phone,
                                        size: 30,
                                      ),
                                    ),
                                    hintText: "Celular",
                                    // hintStyle: kBodyText,
                                  ),
                                  // obscureText: true,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: color3),
                                child: FlatButton(
                                  onPressed: () {
                                    _user.name = _firstName.text;
                                    _user.surName = _lastName.text;
                                    _user.userName = _username.text;
                                    _user.gender = _gender.text;
                                    _user.imageUrl = response.secureUrl;
                                    _user.email = _email.text;
                                    _user.password = _password.text;
                                    _user.cellphone = _cellphone.text;
                                    BlocProvider.of<NavigationBloc>(context)
                                        .add(RegisterEvent(_user));
                                  },
                                  child: Text(
                                    "Crear",
                                    style: TextStyle(
                                        color: color1,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: color2),
                                child: FlatButton(
                                  onPressed: () {
                                    BlocProvider.of<NavigationBloc>(context)
                                        .add(LoginPageEvent());
                                  },
                                  child: Text(
                                    "Cancelar",
                                    style: TextStyle(
                                        color: color1,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
