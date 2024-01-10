import 'dart:async';
import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:bridge_point_logistics/Driver_Page/ScreenB.dart';
import 'package:bridge_point_logistics/Search_Page/Search_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../AccountPage/AccountPage.dart';

import '../Track_Page/Track_Page.dart';
import '../Trips/Trips.dart';
import '../splash_Screen_Page/Splash_Screen_Page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int currentIndex = 0;

  final screens = [
    TripsPage(),
    SearchPage(),
    TrackPage(dispature_Id: '${dispatureIdg}', order_Id: '${orderIdg}', driverName: '${driverNameg}',),
    AccountPage()
  ];
  @override
  void initState() {
    Timer(Duration(days: 3), () {
      setState(() {

        logoutFunction();

      });
    });
    super.initState();
  }
  // Future<void> notificationApiGetApi()async {
  //
  //
  //   final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/notificationAPI/"),headers: {
  //     'Content-type':'application/json;charset=UTF-8',
  //     "Authorization":token
  //
  //   });
  //   if(res.statusCode==200){
  //     var data=jsonDecode(res.body.toString());
  //     print(data['result'][0]['id'].toString());
  //     NotificationService()
  //         .showNotification(title: 'Simple title', body: '${data['result'][0]['id'].toString()}');
  //   }else{
  //     throw Exception("Something error in notificationAPI");
  //   }
  // }
Future<void> logoutFunction()async{
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => SplashScreenPage()),(Route<dynamic>route)=>false);
  await store.delete(key: "token");
  token = (await store.read(key: "token")) ?? "";
  print("token:-$token");
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Track",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "Account",
              backgroundColor: Colors.white),
        ],
      ),
    ));
  }
}



