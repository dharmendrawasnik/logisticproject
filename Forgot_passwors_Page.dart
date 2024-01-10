import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../DrawClip/DrawClip.dart';
import '../ModelsPage/OtpData.dart';
import '../Otppage/otppage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double top=1200;
  bool emailforgotPage=false;
@override
void initState() {
  Future.delayed(Duration(seconds: 1),(){
    setState(() {
      top=130;
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Forgot Password"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
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
                top: top,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),


                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              "Please enter your registerd email Id.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 15),
                            child: Center(
                                child: Text(
                              "We will send a verification code to your registerd email ID.",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, bottom: 5, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email.id ';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      hintText: "Please enter your email"),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  emailforgotPage=true;
                                });
                                var data = {"email": email.text.toString()};
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    emailforgotPage=true;
                                  });
                                  postResendPtpApi(data);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Fill valid value')),
                                  );
                                }
                                email.clear();
                                Future.delayed(Duration(seconds: 3),(){
                                  setState(() {
                                    emailforgotPage=false;
                                  });
                                });
                                setState(() {
                                  emailforgotPage=true;
                                });
                              },
                              child: Container(
                                child: Center(child: emailforgotPage?SizedBox(height: 20,width: 20,child: CircularProgressIndicator(),):Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                                height: 60,
                                width: size.width,
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
                          ),
                          SizedBox(height: 500,)

                        ],
                      ),
                    ),

                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  var otpres;
  Future<Otpdata> postResendPtpApi(Map<String, String> data) async {
    var datay = jsonEncode(data);
    final res = await http
        .post(Uri.parse("$baseUrl/ResendOtpAPI/"), body: datay, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    otpres = Otpdata.fromJson(jsonDecode(res.body.toString()));

    if (res.statusCode == 200) {
      var data2=jsonDecode(res.body.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpPage(otp: '${data2['result']['otp'].toString()}',)));
      await store1.write(key: "token3", value: otpres.result!.token.toString());
      token3 = (await store1.read(key: "token3")) ?? "";

      print("token:-${token3}");

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Otp send on email successfully')));
      return Otpdata.fromJson(jsonDecode(res.body.toString()));
    } else {
      throw Exception("Something error");
    }
  }
}
