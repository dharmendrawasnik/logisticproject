import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CreateNewPasswors/CreateNewPassword.dart';
import '../DrawClip/DrawClip.dart';

class OtpPage extends StatefulWidget {
  final String? otp;
  const OtpPage({Key? key, required this.otp}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool otpPageCircleIdicator=false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otp = TextEditingController();
  double otpPageAnimation = 1200;
  @override
  void initState() {
    otp.text = widget.otp.toString();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        otpPageAnimation = 130;

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
              title: Text("Forgot Password"),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: size.height,
              decoration: BoxDecoration(),
              child: Stack(
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
                    top: otpPageAnimation,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: size.width,
                      height: size.height,
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
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  "Please enter your verification code.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                    child: Text(
                                        "We have send a verification code to your registered email Id.")),
                                SizedBox(height: 70),
                                Row(
                                  children: [
                                    Text("OTP",
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
                                  controller: otp,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid value';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Please enter here",
                                      labelText: "OTP",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                InkWell(
                                  onTap: () {
                                    var data = {
                                      "otp": otp.text.toString(),
                                    };

                                    if (_formKey.currentState!.validate()) {

                                      postOtpApi(data);
                                      setState(() {
                                        otpPageCircleIdicator=true;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                'Please enter valid value')),
                                      );
                                    }
                                    Future.delayed(Duration(seconds: 3),(){
                                      setState(() {
                                        otpPageCircleIdicator=false;
                                      });
                                    });
                                    otp.clear();
                                  },
                                  child: Container(
                                    child: Center(child:otpPageCircleIdicator?SizedBox(height: 20,width: 20,child: CircularProgressIndicator(),): Text("Submit",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
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
                                    height: 60,
                                    width: 330,


                                  ),
                                ),
                                SizedBox(
                                  height: 500,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> postOtpApi(Map<String, String> data) async {
    var datas = jsonEncode(data);
    final res = await http
        .post(Uri.parse("$baseUrl/VerifyotpAPI/"), body: datas, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token3,
    });
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateNewPassword()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Successfull')),
      );
    }
  }
}
