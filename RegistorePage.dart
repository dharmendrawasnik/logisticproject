import 'dart:typed_data';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Dispatcher_Login_Register_Page/Dispatcher_Login_&_Register_Page.dart';
import '../DrawClip/DrawClip.dart';
import '../Privacy_ Policy_Page/Privacy_Policy_Page.dart';

bool registor = false;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double top = 1200;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        top = 130;
      });
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController carrierName = TextEditingController();
  TextEditingController uniqueId = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  @override
  bool _passwordVisible = false;

  var data;
  String? countryCode;

  File? selectImage;
  File? selectImage1;
  String? base64Image;

  String? imagePath;
  String? base64String;
  final imagePicker = ImagePicker();
  @override
  void dispose() {
    super.dispose();
  }

  late Uint8List decodeImage;
  String? url;
  Future<void> chooseImage() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    selectImage = File(image!.path);
    selectImage = await _cropImage(imageFile: selectImage);
    setState(() {
      selectImage = File(image!.path);
    });

    print(selectImage);
  }

  Future<File?> _cropImage({File? imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile!.path);
    if (croppedImage != null) {
      selectImage1 = File(croppedImage.path);
      Uint8List imageBytes = await croppedImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      print('$base64Image');
      setState(() {
        var baseUrl = "data:image/jpg;base64,";
        url = baseUrl + base64Image!;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: DrawClip2(),
          child: Container(
            width: size.width,
            height: size.height * 0.8,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5c6BC0), Color(0xFF82B1FF)],
            )),
          ),
        ),
        ClipPath(
          clipper: DrawClip(),
          child: Container(
            width: size.width,
            height: size.height * 0.8,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF82B1FF),
                Color(0xFF303F9F),
              ],
            )),
          ),
        ),
        AnimatedPositioned(
          top: 10,
          duration: Duration(milliseconds: 1),
          child: Container(
            child: Stack(
              children: [
                Image.asset('assets/images/bridgePointLogo.png'),
              ],
            ),
            width: size.width,
            height: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFF5c6BC0),
                  offset: Offset(5, 5),
                  blurRadius: 7,
                  spreadRadius: 1),
              BoxShadow(
                  color: Color(0xFF5c6BC0),
                  offset: Offset(-5, -5),
                  blurRadius: 7,
                  spreadRadius: 1),
            ], borderRadius: BorderRadius.circular(15), color: Colors.white),
          ),
        ),
        AnimatedPositioned(
          top: top,
          duration: Duration(milliseconds: 1000),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.shade500,
                      offset: Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.blue,
                      offset: Offset(-5, -5),
                      blurRadius: 15,
                      spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromRGBO(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(2.0, 1.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(125, 0, 0, 255),
                              ),
                            ],
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              AssetImage("assets/images/personImage.png"),
                          backgroundColor: Colors.blue[300],
                          child: ClipOval(
                            child: selectImage1 != null
                                ? Image.file(
                                    selectImage1!,
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 150,
                                  )
                                : null,
                          ),
                        ),
                        AnimatedPositioned(
                          top: 100,
                          left: 100,
                          duration: Duration(milliseconds: 1),
                          child: Container(
                            child: IconButton(
                              onPressed: () async {
                                PermissionStatus storageStatus =
                                    await Permission.storage.request();
                                if (storageStatus == PermissionStatus.granted) {
                                  chooseImage();
                                }
                                if (storageStatus == PermissionStatus.denied) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "The permission is recommended.")));
                                }
                                if (storageStatus ==
                                    PermissionStatus.permanentlyDenied) {
                                  openAppSettings();
                                }
                              },
                              icon: Icon(Icons.camera_alt_outlined,
                                  color: Colors.white, size: 30),
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            controller: fullName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                hintText: "Please enter full Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Carrier Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: carrierName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Carrier Name',
                                hintText: "Please enter carrier Name ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            controller: email1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: "Please enter email  ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mobile Number",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: DropdownButtonFormField(
                                  hint: Text("Select"),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("+91"),
                                      value: '+91',
                                    ),
                                    DropdownMenuItem(
                                      child: Text("+1"),
                                      value: '+1',
                                    )
                                  ],
                                  onChanged: (value) {
                                    countryCode = value.toString();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        controller: mobileNumber,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: "Enter Mobile Number",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Unique Id",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: uniqueId,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Unique Id',
                                hintText: "Please enter uniqueId ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: password1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Please enter password  ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    InkWell(
                      onTap: () {
                        data = {
                          "fullName": fullName.text.toString(),
                          "carrierName": carrierName.text.toString(),
                          "uniqueId": uniqueId.text.toString(),
                          "email": email1.text.toString(),
                          "countryCode": countryCode.toString(),
                          "mobileNo": mobileNumber.text.toString(),
                          "password": password1.text.toString(),
                          "image": url,
                        };

                        print(data);
                        print("hi");
                        if (fullName.text.isNotEmpty &&
                            base64Image!.isNotEmpty &&
                            uniqueId.text.isNotEmpty &&
                            email1.text.isNotEmpty &&
                            countryCode!.isNotEmpty &&
                            mobileNumber.text.isNotEmpty &&
                            password1.text.isNotEmpty) {
                          postApi(data);

                          setState(() {
                            registor = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Enter required Value')),
                          );
                        }

                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            registor = false;
                          });
                        });

                        setState(() {
                          fullName.clear();
                          base64Image = '';
                          carrierName.clear();
                          uniqueId.clear();
                          email1.clear();
                          countryCode = "";
                          mobileNumber.clear();
                          password1.clear();
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 325,
                        child: login
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 2,
                                ))
                            : Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.black,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Color.fromRGBO(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(2.0, 1.0),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5, -5),
                                  blurRadius: 1,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-5, -5),
                                  blurRadius: 15,
                                  spreadRadius: 1),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        Text(
                          "or sign in",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " have an Account?",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              controller1.animateTo(0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DispatcherLoginRegisterPage()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyPage()));
                        },
                        child: Text(
                          "PRIVACY POLICY",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        )),
                    SizedBox(
                      height: 300,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // https://canadalogistic.metalsart.in/dispatcherApp/SingUpAddAPI/
  Future<void> postApi(data) async {
    var dataa = jsonEncode(data);
    print(dataa);
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/SingUpAddAPI/"),
        body: dataa,
        headers: {"Content-type": "application/json;charset=UTF-8"});
    print("ApiFunction Calling");
    if (res.statusCode == 200) {
      print("ApiFunction Calling");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DispatcherLoginRegisterPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success..')),
      );
    } else {
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green, content: Text('Invalid Value')),
        );
      }
    }
  }
}
