import 'dart:math';
import 'package:bridge_point_logistics/Trips/Trips.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';
import 'BottomBarPage/BottomBarPage.dart';

String? fcmToken;
class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings= await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print("User granted permission");

    }else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print("User granted provision permission");

    }else{
      print("User denied permission");

    }
  }

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    print("local Function");
    var androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);


    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context,message);



        });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {

      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        print(message.data['type'].toString());
        print(message.data['id'].toString());
      }
      initLocalNotification(context,message);
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    print("notification function");
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notification",
        importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Your Channel Description",
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentSound: true, presentBadge: true, presentAlert: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  Future<String?> getDevicetoken() async {
    fcmToken = await messaging.getToken();
    return fcmToken!;
  }

  isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }


  Future<void> setupInteractMessage(BuildContext context)async{
    RemoteMessage? initialMessage= await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!=null){
      handleMessage(context, initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }



  void handleMessage(BuildContext context,RemoteMessage message){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomBarPage()));
    controller.animateTo(4);
  }


}
