import 'dart:async';

import 'package:flutter/material.dart';

import '../NotificationService.dart';
import '../Selection_Page/Selection_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  NotificationServices notificationServices = NotificationServices();

  double top = 0;

  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          top = 300;
        });
      });
    });
    NotificationServices notificationServices = NotificationServices();

    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDevicetoken().then((value) {
      // print("device token");

      print("device token:-$value");
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SelectionPage()),
            (Route<dynamic> route) => false);
      });
    });
    super.initState();
  }

  // void _modalBottomSheetMenu(){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder){
  //         return new Container(
  //           height: 350.0,
  //           color: Colors.transparent, //could change this to Color(0xFF737373),
  //           //so you don't have to change MaterialApp canvasColor
  //           child: new Container(
  //               decoration: new BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: new BorderRadius.only(
  //                       topLeft: const Radius.circular(10.0),
  //                       topRight: const Radius.circular(10.0))),
  //               child: new Center(
  //                 child: new Text("This is a modal sheet"),
  //               )),
  //         );
  //       }
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: top,
              left: 120,
              duration: Duration(milliseconds: 1000),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo-01.png"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
