import 'package:flutter/material.dart';

import '../Add_New_VehiclesPage/Add_New_VehiclePage.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../ModelsPage/VehicleDetailsModels.dart';
import 'package:http/http.dart' as http;

import '../VehiclesPage/VehiclesPage.dart';

class VehicleDetailsPage extends StatefulWidget {
  final int id;
  final int id2;

  const VehicleDetailsPage({Key? key, required this.id, required this.id2})
      : super(key: key);

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  var idView;
  var id1;

  _VehicleDetailsPageState() {}

  @override
  void initState() {
    idView = widget.id;
    id1 = widget.id2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 850,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: FutureBuilder<VehicleDetailsModels>(
                    future: getVehicleDetails(id1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Front Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].frontDeskDetail.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Main Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].mainDeskDetail.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Max Freight Weight",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].maxFreightWeight.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Real Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].rearDeskDetail.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer GPS",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trailerGps.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 160,
                                        child: Text(
                                          "Trailer Last Annual Safety Check",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trailerLastAnnualSafetyCheck.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Trailer Last Preventive Maintenance",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trailerLastPreventiveMaintenance.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer Number",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trailerNumber.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer Make Year",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trailermakeYear}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Track GPS",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].truckGps.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 160,
                                        child: Text(
                                          "Truck Last Annual Safety Check",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].truckLastAnnualSafetyCheck.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Truck Number",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot!.data!.result!.result![idView].truckNumber.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer ID",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    SizedBox(
                                        width: 120,
                                        child: Text(
                                          "${snapshot.data!.result!.result![idView].trailerId.toString()}",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 160,
                                        child: Text(
                                          "Truck Last Preventive Maintenance ",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].trucklastPreventiveMaintenance.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Truck Make Year",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].truckmakeYear.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "${snapshot.data!.result!.result![idView].status.toString()}",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date & Time",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    SizedBox(
                                        width: 80,
                                        child: Text(
                                          "${snapshot.data!.result!.result![idView].createdOn.toString()}",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                            onPressed: () {
                                              _showMyDialog(snapshot.data!
                                                  .result!.result![idView].id
                                                  .toString());
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'DELETE',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ))),
                                    SizedBox(
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                            onPressed: () {
                                              var btn = "Update";
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddNewVehiclesPage(
                                                            frontDesk:
                                                                '${snapshot.data!.result!.result![idView].frontDeskDetail.toString()}',
                                                            mainDeskDetail1:
                                                                '${snapshot.data!.result!.result![idView].mainDeskDetail.toString()}',
                                                            maxFreightWeight1:
                                                                '${snapshot.data!.result!.result![idView].maxFreightWeight.toString()}',
                                                            realDeskDetail1:
                                                                '${snapshot.data!.result!.result![idView].rearDeskDetail.toString()}',
                                                            trailerGPS1:
                                                                '${snapshot.data!.result!.result![idView].trailerGps.toString()}',
                                                            trailerLastAnnualSafetyCheck1:
                                                                '${snapshot.data!.result!.result![idView].trailerLastAnnualSafetyCheck.toString()}',
                                                            trailerLastPreventiveMaintenance1:
                                                                '${snapshot.data!.result!.result![idView].trailerLastPreventiveMaintenance.toString()}',
                                                            trailerNumber1:
                                                                '${snapshot.data!.result!.result![idView].trailerNumber.toString()}',
                                                            trailerMakeYear1:
                                                                '${snapshot.data!.result!.result![idView].trailermakeYear.toString()}',
                                                            truckGPS1:
                                                                '${snapshot.data!.result!.result![idView].truckGps.toString()}',
                                                            truckLastAnnualSafetyCheck1:
                                                                '${snapshot.data!.result!.result![idView].truckLastAnnualSafetyCheck.toString()}',
                                                            truckNumber1:
                                                                '${snapshot.data!.result!.result![idView].truckNumber.toString()}',
                                                            truckLastPreventiveMaintenance1:
                                                                '${snapshot.data!.result!.result![idView].trucklastPreventiveMaintenance.toString()}',
                                                            truckMakeYear1:
                                                                '${snapshot.data!.result!.result![idView].truckmakeYear.toString()}',
                                                            status2:
                                                                '${snapshot.data!.result!.result![idView].statusText.toString()}',
                                                            trailerNumber2:
                                                                '${snapshot.data!.result!.result![idView].trailerName.toString()}',
                                                            id1:
                                                                '${snapshot.data!.result!.result![idView].id.toString()}',
                                                            btn: '$btn',
                                                          )));
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.edit_outlined,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'UPDATE',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ))),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Future<void> _showMyDialog(String deleteId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.red, width: 3.0)),
                  child: Center(
                      child: Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                    size: 35,
                  )),
                ),
                Text(
                  "Are you sure?",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Do you really want  to delete this driver. ",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiclesPage()));
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            deleteVehiclesDetailsAppi(deleteId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiclesPage()));
                          },
                          child: Text(
                            "DELETE NOW ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMy1Dialog(String deleteId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.red, width: 3.0)),
                  child: Center(
                      child: Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                    size: 35,
                  )),
                ),
                Text(
                  "Are you sure?",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Do you really want  to update this Vehicles. ",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiclesPage()));
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VehiclesPage()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                      'Delete Vehicles Details Successfully!')),
                            );
                          },
                          child: Text(
                            "DELETE NOW ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // DeleteVehieclesDetailsApi

  Future<void> deleteVehiclesDetailsAppi(String deleteId) async {
    final res = await http
        .delete(Uri.parse("$baseUrl/VehicleDetailAPI/?id=$deleteId"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Delete Vehicles Details Successfully!')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VehiclesPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Something error')),
      );
    }
  }
}
