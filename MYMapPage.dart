import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class MyMapPage extends StatefulWidget {
  final String? dispature_Id;
  final String? order_Id;
  final String? driverName;


  final String? user_Id;
  const MyMapPage({super.key, required this.user_Id,required this.dispature_Id,required this.order_Id,required this.driverName});

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _Added = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('${widget.dispature_Id}').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(_Added){
            mymap(snapshot);
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GoogleMap(
              mapType: MapType.normal,

                markers:{Marker(position:LatLng(
                    snapshot.data!.docs.singleWhere((element) =>
                    element.id == widget.user_Id)['latitude'],
                    snapshot.data!.docs.singleWhere((element) =>
                    element.id == widget.user_Id)['longitude']) ,
                    markerId: MarkerId('id' ),icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor. hueMagenta))},
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        snapshot.data!.docs.singleWhere((element) =>
                            element.id == widget.user_Id)['latitude'],
                        snapshot.data!.docs.singleWhere((element) =>
                            element.id == widget.user_Id)['longitude']),zoom: 14.47
                ),onMapCreated: (GoogleMapController controller)async{
             setState(() {
               _controller=controller;
               _Added=true;
             });
            },
            );
          }
        },
      ),
    );

  }
  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot)async{
    await _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target:LatLng(
        snapshot.data!.docs.singleWhere((element) =>
        element.id == widget.user_Id)['latitude'],
        snapshot.data!.docs.singleWhere((element) =>
        element.id == widget.user_Id)['longitude']),zoom: 14.47)));
  }
}
