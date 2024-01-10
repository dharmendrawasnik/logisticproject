import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Dispatcher_Login_Register_Page/Dispatcher_Login_&_Register_Page.dart';
import '../DrawClip/DrawClip.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  double createNewPasswordAnimation=1200;
  bool createNewPasswordCircleIndicator=false;
  @override
  void initState() {
   Future.delayed(Duration(seconds: 1),(){
     setState(() {
       createNewPasswordAnimation=130;
     });
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Stack(
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
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              title: Text("Create Password"),
            ),
            body: Stack(
              children: [
                AnimatedPositioned(
                  top: 10,
                  duration: Duration(milliseconds: 1),
                  child: Container(
                    child: Image.asset('assets/images/bridgePointLogo.png'),
                    width: size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
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
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                  ),
                ),
                AnimatedPositioned(

                  top: createNewPasswordAnimation,
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
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
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Create New Password .",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Text("New Password",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: oldPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid value';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Please enter here",
                                    labelText: "NEW",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("Confirm Password",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: newPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid value';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Please enter here",
                                    labelText: "Confirm",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              InkWell(
                                onTap: (){
                                  var data = {
                                    "password": oldPassword.text.toString(),
                                    "confirmPassword": newPassword.text.toString()
                                  };

                                  if (_formKey.currentState!.validate()) {
                                    if (oldPassword.text.toString() ==
                                        newPassword.text.toString()) {
                                      postNewPasswordApi(data);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text('Password does not match')),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Please enter valid value')),
                                    );
                                  }
                                  oldPassword.clear();
                                  newPassword.clear();
                                },
                                child: Container(
                                  child: Center(child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                                  height: 60,
                                  width: 330,

                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white30,
                                            offset: Offset(5, 5),
                                            blurRadius: 7,
                                            spreadRadius: 1),
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(-5, -5),
                                            blurRadius: 7,
                                            spreadRadius: 1),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                              ),
                              SizedBox(height: 500,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> postNewPasswordApi(Map<String, String> data) async {
    var datas = jsonEncode(data);
    final res = await http.patch(Uri.parse("$baseUrl/DispatcherProfileAPI/"),
        body: datas,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token3,
        });
    if (res.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => DispatcherLoginRegisterPage()),
          (Route<dynamic> route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Successfully')),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red, content: Text('Invalid value')),
      );
    }
  }
}
