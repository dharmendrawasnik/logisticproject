import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bridge_point_logistics/ModelsPage/ModelsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../BottomBarPage/BottomBarPage.dart';
import '../DrawClip/DrawClip.dart';
import '../Forgot _password_page/Forgot_passwors_Page.dart';
import '../NotificationService.dart';
import '../Privacy_ Policy_Page/Privacy_Policy_Page.dart';
import '../RegistorePage/RegistorePage.dart';

bool login=false;
String token2="";
late TabController controller1;
class DispatcherLoginRegisterPage extends StatefulWidget {
  const DispatcherLoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<DispatcherLoginRegisterPage> createState() =>
      _DispatcherLoginRegisterPageState();
}

class _DispatcherLoginRegisterPageState

    extends State<DispatcherLoginRegisterPage>
with SingleTickerProviderStateMixin
{

  NotificationServices notificationServices = NotificationServices();
  Future<LoginModels>? _futureAlbum;
  final _formKey = GlobalKey<FormState>();
  double top=1200;
  var countryCode;
  var cc;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _passwordVisible = false;
  bool rinkoo=false;
  File? image;
  String image2 = "assets/images/personImage.png";

@override
void initState() {
  notificationServices.requestNotificationPermission();
  notificationServices.firebaseInit(context);
  notificationServices.setupInteractMessage(context);
  notificationServices.isTokenRefresh();
  notificationServices.getDevicetoken().then((value){
     print("device token");

    print("device token:-$fcmToken");
  });
  super.initState();
  Future.delayed(Duration(milliseconds: 100),(){
    setState(() {
      top=130;
    });
  });
    controller1=TabController(length: 4,vsync: this);
    controller1.addListener(() {
      setState(() {

      });
    }
    );
  }
@override
void dispose(){
  controller1.dispose();
}
  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(

        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.lightBlue,
        //   bottom: PreferredSize(
        //     preferredSize: Size(300, 00),
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       child: TabBar(
        //           labelColor: Colors.white,
        //           indicatorColor: Colors.white,
        //           controller: controller1,
        //           tabs: [
        //             Tab(
        //               text: "LOGIN",
        //             ),
        //             Tab(
        //               text: "REGISTER",
        //             )
        //           ]),
        //     ),
        //   ),
        // ),
        body: TabBarView(
          controller: controller1,
          children: [
            LoginPage(),
            RegisterPage(),
          ],
        ),
      ),
    ));
  }

  //https://canadalogistic.metalsart.in/dispatcherApp/LoginAPI/
//http://localhost:3000/posts

  Future<LoginModels> loginDispatchFunction(Map<String, String> data) async {

    var datay=jsonEncode(data);
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/LoginAPI/"),
        body: datay,


        headers: {
           'Content-Type': 'application/json;charset=UTF-8',
        });
   var response = LoginModels.fromJson(jsonDecode(res.body.toString()));

    await store.write(key: "token", value: response!.result!.token.toString());
    token = (await store.read(key: "token")) ?? "";

    print("token:-${token} <=token");

    if (res.statusCode == 200) {

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBarPage()),
          (Route<dynamic> route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.green, content: Text('Success...')),
      );
      return LoginModels.fromJson(jsonDecode(res.body.toString()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Invalid Email & Password')),
      );
      throw Exception("Failed to load LoginModels");
    }
  }

  Widget LoginPage() {
  final Size size=MediaQuery.of(context).size;
    return
      Stack(

        children: [
          ClipPath(
            clipper: DrawClip2(),
            child: Container(
              width: size.width,
              height: size.height*0.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF5c6BC0),
                      Color(0xFF82B1FF)
                    ],

                  )
              ),
            ),
          ),
          ClipPath(
            clipper: DrawClip( ),
            child: Container(
              width: size.width,
              height: size.height*0.8,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [

                      Color(0xFF82B1FF),
                      Color(0xFF303F9F),
                    ],

                  )
              ),
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
                  color: Colors.white
              ),
            ),
          ),

          AnimatedPositioned(
            top: top,
            duration: Duration(milliseconds: 1000),
            child:

              Container(
                height:600,

                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
               color: Colors.white,
                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                          color: Colors
                              .blue
                              .shade500,
                          offset: Offset(
                              5, 5),
                          blurRadius: 15,
                          spreadRadius:
                          1),
                      BoxShadow(
                          color: Colors
                              .blue,
                          offset: Offset(
                              -5, -5),
                          blurRadius: 15,
                          spreadRadius:
                          1),
                    ]
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Login',style: TextStyle(
                              color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,  shadows: <Shadow>[
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
                          ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
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

                                keyboardType: TextInputType.emailAddress,

                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Email",
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
                                controller: password,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,

                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  labelText: "Password",
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
                                    hintText: "Please enter password",
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
                          onTap: ()async {

                            var data={
                              "email": email.text.toString(),
                              "password": password.text.toString(),
                              "fcmtoken":fcmToken.toString(),
                            };
                            print(data);
                            email.text.toString();
                            password.text.toString();
                            if (email.text.isNotEmpty && password.text.isNotEmpty) {
                              _futureAlbum = loginDispatchFunction(data);
                              setState(() {

                                login=true;
                              });
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Fill Email & Password')),
                              );
                            }
                            email.clear();
                            password.clear();
                            setState(() {
                              Future.delayed(Duration(seconds: 3),(){
                                setState(() {
                                  login=false;
                                });
                              });
                            }
                            );

                          },
                          child: Container(
                            height: 60,
                            width: 325,
                            child:login?Center(

                                child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)): Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,  shadows: <Shadow>[
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
                                      color: Colors
                                          .white,
                                      offset: Offset(
                                          -5, -5),
                                      blurRadius: 1,
                                      spreadRadius:
                                      1),
                                  BoxShadow(
                                      color: Colors
                                          .grey,
                                      offset: Offset(
                                          -5, -5),
                                      blurRadius: 15,
                                      spreadRadius:
                                      1),
                                ]
                            ),
                          ),
                        ),


                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                )),
                            Text(
                              "or sign in",
                              style: TextStyle(color: Colors.black, fontSize: 18,),
                            ),
                            Expanded(
                                child: Divider(
                                  thickness: 1,color: Colors.black,
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
                              "Don't have an Account?",
                              style: TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller1.animateTo(1);
                                },
                                child: Text(
                                  "Register",
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
                        SizedBox(height: 200,)
                      ],
                    ),
                  ),
                ),
              ),




          ),
        ],
      );

  }

}

