import 'dart:async';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../BottomBarPage/BottomBarPage.dart';
import '../Dispatcher_Login_Register_Page/Dispatcher_Login_&_Register_Page.dart';
import '../DrawClip/DrawClip.dart';
import '../Driver_Page/MyHomePage.dart';
import '../Driver_Page/driverApiPage/driverPageApi.dart';
import '../Driver_Page/driverLoginPage.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  double bottom = 500;
  double top = 0;
  bool dispatcher = false;
  bool driver = false;
  bool isPressed = false;
  @override
  void initState() {

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        bottom = 25;
        top = 300;
      });
    });
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      });
  @override
  void dispse() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    Color shadowColor = Colors.deepPurple;
    return SafeArea(child: Scaffold(
        body:SingleChildScrollView(
          child: Stack(
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

              Container(
                margin: EdgeInsets.all(10),
                width: size.width,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
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
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              setState(() {
                                dispatcher=true;
                                isPressed = true;
                              });
                              token = (await store.read(key: "token")) ?? "";
                              if(token.length==4 && token==null){
                                token=' ';
                                print("token:-$token <=token");
                                print("token:-${token.length} <=token");
                              }

                              print("token:-$token <=token");
                              print("token:-${token.length} <=token");
                              setState(() {

                                dispatcher = true;
                                if (token.isNotEmpty && token.length>100) {
                                  if (token.isNotEmpty  && token.length>100) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomBarPage()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DispatcherLoginRegisterPage()),
                                    );
                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DispatcherLoginRegisterPage()),
                                  );
                                }
                              });
                              Future.delayed(Duration(seconds: 3),(){
                                setState(() {
                                  dispatcher=false;
                                });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(5, 5),
                                        blurRadius: 7,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-5, -5),
                                        blurRadius: 7,
                                        spreadRadius: 1),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    child: Center(
                                        child:dispatcher?CircularProgressIndicator(color: Colors.blueAccent):
                                        Text('DISPATCHER',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                         ),
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(200),
                                          bottomLeft: Radius.circular(25),
                                          topLeft: Radius.circular(25)
                                      ),
                                      color: Color(0xFF5c6BC0),
                                    ),

                                  ),
                                  Icon(Icons.person,color: Color(0xFF5c6BC0),size: 70,)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {

                              token1 = (await store.read(key: "token1")) ?? "";
                              if(token1.length==4 && token1==null){
                                token1=' ';
                              }
                              print("token1:-$token1");
                              setState(() {
                                driver=true;
                                print(token1);
                                driver = true;

                                if (token1.isNotEmpty) {
                                  if (token1.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BridgePages()),
                                    );
                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BridgePages()),
                                  );
                                }
                              });
                              Future.delayed(Duration(seconds: 3),(){
                                setState(() {
                                  driver=false;
                                });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(5, 5),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(-5, -5),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF5c6BC0)
                              ),

                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Colors.white,size: 80,),

                                  Container(
                                    child: Center(child:driver?CircularProgressIndicator(color: Colors.blue,):Text('DRIVER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(200)
                                      ),
                                      color: Colors.white,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      width: size.width,
                      height: 270,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                blurRadius: 5,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, -5),
                                blurRadius: 1,
                                spreadRadius: 1),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)

                      ),

                    )


                  ],
                ),
              ),


            ],
          ),
        )
    ));
  }

  showDialogBox() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("No Connection"),
            content: Text("Please chack your internet conectivity"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Cancel");
                    setState(() async {
                      isAlertSet = false;
                      isDeviceConnected =
                          await InternetConnectionChecker().hasConnection;
                      if (isDeviceConnected) {
                        showDialogBox();
                        setState(() {
                          isAlertSet = true;
                        });
                      }
                    });
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
}
// DISPATCHER




