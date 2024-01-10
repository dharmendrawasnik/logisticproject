import 'package:bridge_point_logistics/Driver_Page/ScreenB.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

import '../DrawClip/DrawClip.dart';

class LocationPage extends StatefulWidget {
  final String? dispatureId;
  final String? orderId;
  final String? driverName;
  @override
  LocationPage(
      {super.key,
      required this.dispatureId,
      required this.orderId,
      required this.driverName});

  @override
  State<LocationPage> createState() => _LocationPage();
}

class _LocationPage extends State<LocationPage> {
  RangeValues values = RangeValues(0, 100);


  double _value = 0;
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                automaticallyImplyLeading: true,
                title: Text('Live Location Tracking'),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        _getLocation();
                      },
                      child: Container(
                        height: 60,
                        width: 325,
                        child: Center(
                          child: Text(
                            "Add my location",
                            style: TextStyle(
                                color: Colors.black,
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
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        listenLocation();
                      },
                      child: Container(
                        height: 60,
                        width: 325,
                        child: Center(
                          child: Text(
                            "Enable live location",
                            style: TextStyle(
                                color: Colors.black,
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
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        _stopListening();
                      },
                      child: Container(
                        height: 60,
                        width: 325,
                        child: Center(
                          child: Text(
                            "Stop live location",
                            style: TextStyle(
                                color: Colors.black,
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
                      height: 15,
                    ),

                    // TextButton(
                    //     onPressed: () {
                    //       _getLocation();
                    //     },
                    //     child: Text('Add my location')),
                    // TextButton(
                    //     onPressed: () {
                    //       listenLocation();
                    //     },
                    //     child: Text('Enable live location')),
                    // TextButton(
                    //     onPressed: () {
                    //       _stopListening();
                    //     },
                    //     child: Text('Stop live location')),
                    Container(
                      height: 60,
                      width: 325,
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
                      child: Expanded(
                          child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('${dispatureIdg}')
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Text(snapshot.data!.docs[index]['name']
                                        .toString()),
                                    Text(
                                        '  OrderId:-${snapshot.data!.docs[index].id.toString()}'),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(snapshot.data!.docs[index]['latitude']
                                        .toString()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(snapshot.data!.docs[index]['longitude']
                                        .toString()),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.directions),
                                  onPressed: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => MyMap(
                                    //       user_id:snapshot.data!.docs[index].id.toString(),
                                    //     ))
                                    //  );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      )),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      print(
          'latitude:-${_locationResult.latitude},longitude:-${_locationResult.longitude}');
      await FirebaseFirestore.instance
          .collection('${widget.dispatureId}')
          .doc('${widget.orderId}')
          .set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': '${widget.driverName}'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      print(
          'latitude:-${currentlocation.latitude},longitude:-${currentlocation.longitude}');
      await FirebaseFirestore.instance
          .collection('${widget.dispatureId}')
          .doc('${widget.orderId}')
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': '${widget.driverName}'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() async {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
