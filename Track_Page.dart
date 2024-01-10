import 'package:bridge_point_logistics/Driver_Page/ScreenB.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;

import '../BottomBarPage/BottomBarPage.dart';
import '../DrawClip/DrawClip.dart';
import '../LocationPage/MYMapPage.dart';

class TrackPage extends StatefulWidget {
  final String? dispature_Id;
  final String? order_Id;
  final String? driverName;
  const TrackPage({Key? key,required this.dispature_Id,required this.order_Id,required this.driverName}) : super(key: key);

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscript;
  final fireStore =
      FirebaseFirestore.instance.collection('${dispatureIdg}').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('${dispatureIdg}');
  void initState() {
    super.initState();
    //  _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomBarPage()),
            (Route<dynamic> route) => false);
        return shouldPop;
      },
      child: SafeArea(
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
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text("Live Location Tracker System"),
              ),
              body:
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Image(
                          image: AssetImage("assets/images/route.gif"),
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Expanded(
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
                            } else {
                              return ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
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
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text(snapshot
                                                  .data!.docs[index]['name']
                                                  .toString()),
                                              Text('  OrderId:-${snapshot.data!.docs[index].id.toString()}'),
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [

                                              Text(snapshot
                                                  .data!.docs[index]['latitude']
                                                  .toString()),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(snapshot
                                                  .data!.docs[index]['longitude']
                                                  .toString()),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.directions),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyMapPage(
                                                                user_Id:
                                                                    '${snapshot.data!.docs[index].id}', dispature_Id: '${dispatureIdg}', order_Id: '${orderIdg}', driverName: '${driverNameg}',
                                                              )));
                                                },
                                              )
                                            ],
                                          ),
                                          trailing: IconButton(
                                            onPressed: () async {
                                            //  await FirebaseFirestore.instance.collection("${dispatureIdg}").doc(id).delete();
                                            },
                                            icon: Icon(Icons.delete,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                        )),
                      ],
                    ),
                  ),

            ),
          ],
        ),
      )),
    );
  }
}
