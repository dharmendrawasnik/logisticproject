import 'dart:convert';

import 'package:bridge_point_logistics/ModelsPage/TripsIDModels.dart';
import 'package:flutter/material.dart';

import '../AddNewReadinessFormPage/AddNewReadinessFormPage.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../ModelsPage/ReadinessAllDetailsModels.dart';
import '../ModelsPage/ReadinessDetailsModels.dart';
import 'package:http/http.dart' as http;

import '../Readiness_page/Readiness_page.dart';
bool rediness=false;
class ReadinessDetailsPage extends StatefulWidget {
  final int indexid;
  const ReadinessDetailsPage({Key? key, required this.indexid})
      : super(key: key);

  @override
  State<ReadinessDetailsPage> createState() =>
      _ReadinessDetailsPageState(indexid);
}

class _ReadinessDetailsPageState extends State<ReadinessDetailsPage> {
  late int id;
  _ReadinessDetailsPageState(int indexid) {
    id = indexid;
  }

  @override
  void initState() {
    getTripsIdApiFunction('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

          child: Scaffold(
      appBar: AppBar(
          title: Text("Readiness Details"),
      ),
      body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FutureBuilder<ReadinessDetailsModels>(
                        future: getReadinessDetailsApiFunction(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Driver1Name",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].driver1PhoneNo.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "MobileNo",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].driver1PhoneNo.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Driver2Name",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].driver2PhoneNo.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "MobileNo",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].driver2PhoneNo.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "TruckMaintenanceDate",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15,overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].truckMacYear.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "Fit/Unfit",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].fitUnfit.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "CityDriverName",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].cityDriverName.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "TruckNumber",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].truckNumber.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "CityTruck",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].cityTruck.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              "TruckFuel",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].padLock.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "TruckMacYear",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].truckMac2Year.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "TruckNo.",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "${snapshot.data!.result!.result![id].truckNumber.toString()}",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),

                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: 120,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                onPressed: () {
                                                  _showMyDialog(snapshot.data!.result!.result![id].id.toString());
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "DELETE",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: 120,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.black87,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                onPressed: () {
                                                  rediness=true;

                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadinessFormNew2(
                                                 cityDriverName:"${snapshot.data!.result!.result![id].cityDriverName.toString()}",
                                                 truckMantananceDate: '${snapshot.data!.result!.result![id].truckMacYear.toString()}',
                                                 fitness: '${snapshot.data!.result!.result![id].fitUnfit.toString()}',
                                                 driver1Name: '${snapshot.data!.result!.result![id].driver1Id.toString()}',
                                                 driver2Name: '${snapshot.data!.result!.result![id].driver2Id.toString()}',
                                                 driver1PhoneNo: '${snapshot.data!.result!.result![id].driver1PhoneNo.toString()}',
                                                 driver2PhoneNo: '${snapshot.data!.result!.result![id].driver2PhoneNo.toString()}',
                                                 truckNo: '${snapshot.data!.result!.result![id].truckNumber.toString()}',
                                                 modelYear: '${snapshot.data!.result!.result![id].truckMac2Year.toString()}',
                                                 truckFuel: '${snapshot.data!.result!.result![id].padLock.toString()}',
                                                 id: '${snapshot.data!.result!.result![id].id.toString()}',
                                                 cityTruck: '${snapshot.data!.result!.result![id].cityTruck.toString()}', tripId: '',)));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "UPDATE",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
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
      ),
    ),
        );
  }

  Future<void> _showMyDialog(String? id) async {
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
                            Navigator.pop(context);
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
                            setState(() {
                              deleteReadinessDetailsData(id!);

                            });
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

  Future<ReadinessAllDetailsModels> deleteReadinessDetailsData(
      String id) async {
    final res = await http
        .delete(Uri.parse("$baseUrl/ReadinessFormAPI/?id=$id"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });

    if (res.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReadinessPage()));


      print("Success");
      return ReadinessAllDetailsModels.fromJson(
          jsonDecode(res.body.toString()));
    } else {
      throw Exception("Failed to load ReadinessAllDetailsModels");
    }
  }
}









