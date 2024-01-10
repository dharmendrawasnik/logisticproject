import 'dart:convert';

import 'package:bridge_point_logistics/ModelsPage/VehicleDetailsModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Add_New_VehiclesPage/Add_New_VehiclePage.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';
import '../Vehicle Details/Vehicle Details.dart';

Offset distance = Offset(28, 28);
double blur = 30.0;

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  bool loader = false;
  bool loader1 = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController frontDeskDetail = TextEditingController();
  final TextEditingController mainDeskDetail = TextEditingController();
  final TextEditingController maxFreightWeight = TextEditingController();
  final TextEditingController realDeskDetail = TextEditingController();
  final TextEditingController trailerGPS = TextEditingController();
  final TextEditingController trailerLastAnnualSafetyCheck =
      TextEditingController();
  final TextEditingController trailerLastPreventiveMaintenance =
      TextEditingController();
  final TextEditingController trailerNumber = TextEditingController();
  final TextEditingController trailerMakeYear = TextEditingController();
  final TextEditingController truckGPS = TextEditingController();
  final TextEditingController truckLastAnnualSafetyCheck =
      TextEditingController();
  final TextEditingController truckNumber = TextEditingController();
  final TextEditingController truckLastPreventiveMaintenance =
      TextEditingController();
  final TextEditingController truckMakeYear = TextEditingController();
  var id = 1;
  var id2 = 0;
  double vDetailTop = 1200;
  double newAddFormTop = 1200;
  double dialogTop = 1200;
  String? updateId = "";
  String? status1 = "";
  String? trailerNumber1 = "";

  String? trailerName = "";
  String? trailerId = "";
  var trailerNameData;
  var status2;
  var valueStatus1;

  var valueStatus;
  var valueTN;
  var id1;
  var btn1 = "Add New Vehicles";

  bool seStatus = false;

  String? vehicleID2 = "";
  String? vehicleID3 = "";

  String? seStatus1 = "";

  var frontDeskDetails;
  String? mainDeskDetails1 = " ";
  var maxFrieghtWeight1;
  var realDeskDetail1;
  String? trailerGps1 = "";
  var trailerlastAnnualSeftyCheck;
  var trailerlastpreventiveMaintanance1;
  var trailerNumber12;
  var trailerMakeYear1;
  var truckGPS1;
  var trucklastAnnualSeftyCheck;
  var TruckNumber;
  String? trailerId1 = "";
  var tracklastpreventiveMaintanance1;
  var truckMakeYear1;
  var status;
  var dateTime;

  @override
  void initState() {
    getVehicleDetails(id);
    getVehicleDetails1(id2);
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {});
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
                drawer: Drawer(
                  child: DrawerPage(),
                ),
                appBar: AppBar(
                  backgroundColor: Colors.indigo,
                  centerTitle: false,
                  title: Text("Vehicles"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            seStatus = false;
                            newAddFormTop = 0;
                            vDetailTop = 1200;
                            var btn = "Add";

                            frontDeskDetail.clear();

                            mainDeskDetail.clear();

                            maxFreightWeight.clear();
                            realDeskDetail.clear();

                            trailerGPS.clear();

                            trailerLastAnnualSafetyCheck.clear();

                            trailerLastPreventiveMaintenance.clear();
                            trailerNumber.clear();

                            trailerMakeYear.clear();

                            truckGPS.clear();

                            truckLastAnnualSafetyCheck.clear();
                            truckNumber.clear();
                            truckLastPreventiveMaintenance.clear();
                            truckMakeYear.clear();
                            vehicleID2 = "";

                            seStatus1 = "";
                            vehicleID3 = "";
                            updateId = "";
                          });
                        },
                        child: Text(
                          "Add New ",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(300, 50),
                    child: ColoredBox(
                        color: Colors.indigo,
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          indicatorColor: Colors.red,
                          labelColor: Colors.red,
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontSize: 13),
                          tabs: [
                            Tab(
                              text: "ACTIVE",
                            ),
                            Tab(
                              text: "INACTIVE",
                            )
                          ],
                        )),
                  ),
                ),
                body: Stack(
                  children: [
                    TabBarView(
                      children: [
                        RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          edgeOffset: 20,
                          displacement: 20,
                          strokeWidth: 2,
                          color: Colors.blue,
                          backgroundColor: Colors.white,
                          onRefresh: _refresh,
                          child: FutureBuilder<VehicleDetailsModels>(
                            future: getVehicleDetails(id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return (snapshot.data!.result!.result!.length >
                                        0)
                                    ? Column(
                                        children: [
                                          ListView.builder(
                                              itemCount: snapshot
                                                  .data!.result!.result!.length,
                                              scrollDirection: Axis.vertical,
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Container(
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color(
                                                                    0xFFA7A9AF),
                                                                offset: Offset(
                                                                    5, 5),
                                                                blurRadius: 3,
                                                                spreadRadius:
                                                                    1),
                                                            BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -5, -5),
                                                                blurRadius: 3,
                                                                spreadRadius:
                                                                    1),
                                                          ]),
                                                      height: 150,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width: 250,
                                                            height: size.height,
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  width: size
                                                                      .width,
                                                                  height: 250,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .indigo,
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(
                                                                              25),
                                                                          topLeft: Radius.circular(
                                                                              25),
                                                                          bottomRight:
                                                                              Radius.circular(200))),
                                                                ),
                                                                Container(
                                                                  width: size
                                                                      .width,
                                                                  height: 250,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .indigo,
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(
                                                                              25),
                                                                          topLeft: Radius.circular(
                                                                              25),
                                                                          topRight:
                                                                              Radius.circular(200))),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 170,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Vehicle No.",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data!.result!.result![index].truckNumber.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Text(
                                                                          "Model",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data!.result!.result![index].truckmakeYear.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 35,
                                                                  width: 100,
                                                                  child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(primary: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                                                      onPressed: () {
                                                                        var id =
                                                                            index;
                                                                        var id2 =
                                                                            1;
                                                                        setState(
                                                                            () {
                                                                          vDetailTop =
                                                                              0;
                                                                          frontDeskDetails = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .frontDeskDetail
                                                                              .toString();

                                                                          mainDeskDetails1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .mainDeskDetail
                                                                              .toString();
                                                                          maxFrieghtWeight1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .maxFreightWeight
                                                                              .toString();
                                                                          realDeskDetail1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .rearDeskDetail
                                                                              .toString();
                                                                          trailerGps1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerGps
                                                                              .toString();
                                                                          trailerlastAnnualSeftyCheck = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerLastAnnualSafetyCheck
                                                                              .toString();
                                                                          trailerlastpreventiveMaintanance1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerLastPreventiveMaintenance
                                                                              .toString();
                                                                          trailerNumber12 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerNumber
                                                                              .toString();
                                                                          trailerMakeYear1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailermakeYear
                                                                              .toString();
                                                                          truckGPS1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .truckGps
                                                                              .toString();
                                                                          trucklastAnnualSeftyCheck = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .truckLastAnnualSafetyCheck
                                                                              .toString();
                                                                          TruckNumber = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .truckNumber
                                                                              .toString();
                                                                          trailerId1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerId
                                                                              .toString();
                                                                          tracklastpreventiveMaintanance1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trucklastPreventiveMaintenance
                                                                              .toString();
                                                                          truckMakeYear1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .truckmakeYear
                                                                              .toString();
                                                                          status = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .status
                                                                              .toString();
                                                                          dateTime = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .truckmakeYear
                                                                              .toString();
                                                                          updateId = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .id
                                                                              .toString();
                                                                          vehicleID2 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerName
                                                                              .toString();
                                                                          seStatus1 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .statusText
                                                                              .toString();
                                                                          vehicleID3 = snapshot
                                                                              .data!
                                                                              .result!
                                                                              .result![index]
                                                                              .trailerId
                                                                              .toString();
                                                                        });
                                                                      },
                                                                      child: Text("View")),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }),

                                        ],
                                      )
                                    : Center(
                                        child: Container(
                                        height: 400,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/delivery-truck.gif'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 100),
                                                child: Text(
                                                  "Data not available",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          edgeOffset: 20,
                          displacement: 20,
                          strokeWidth: 2,
                          color: Colors.blue,
                          backgroundColor: Colors.white,
                          onRefresh: _refresh,
                          child: FutureBuilder<VehicleDetailsModels>(
                            future: getVehicleDetails(id2),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return (snapshot.data!.result!.result!.length >
                                        0)
                                    ? SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                itemCount: snapshot.data!
                                                    .result!.result!.length,
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Container(
                                                        width: size.width,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                  offset:
                                                                      Offset(
                                                                          5, 5),
                                                                  blurRadius: 3,
                                                                  spreadRadius:
                                                                      1),
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(-5,
                                                                          -5),
                                                                  blurRadius: 3,
                                                                  spreadRadius:
                                                                      1),
                                                            ]),
                                                        height: 150,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              width: 250,
                                                              height:
                                                                  size.height,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: size
                                                                        .width,
                                                                    height: 250,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .indigo,
                                                                        borderRadius: BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(25),
                                                                            topLeft: Radius.circular(25),
                                                                            bottomRight: Radius.circular(200))),
                                                                  ),
                                                                  Container(
                                                                    width: size
                                                                        .width,
                                                                    height: 250,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .indigo,
                                                                        borderRadius: BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(25),
                                                                            topLeft: Radius.circular(25),
                                                                            topRight: Radius.circular(200))),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 170,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Vehicle No.",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "${snapshot.data!.result!.result![index].truckNumber.toString()}",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "Model",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "${snapshot.data!.result!.result![index].truckmakeYear.toString()}",
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 35,
                                                                    width: 100,
                                                                    child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(primary: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                                                        onPressed: () {
                                                                          var id =
                                                                              index;
                                                                          var id2 =
                                                                              0;

                                                                          setState(
                                                                              () {
                                                                            vDetailTop =
                                                                                0;
                                                                            frontDeskDetails =
                                                                                snapshot.data!.result!.result![index].frontDeskDetail.toString();
                                                                            mainDeskDetails1 =
                                                                                snapshot.data!.result!.result![index].mainDeskDetail.toString();
                                                                            maxFrieghtWeight1 =
                                                                                snapshot.data!.result!.result![index].maxFreightWeight.toString();
                                                                            realDeskDetail1 =
                                                                                snapshot.data!.result!.result![index].rearDeskDetail.toString();
                                                                            trailerGps1 =
                                                                                snapshot.data!.result!.result![index].trailerGps.toString();
                                                                            trailerlastAnnualSeftyCheck =
                                                                                snapshot.data!.result!.result![index].trailerLastAnnualSafetyCheck.toString();
                                                                            trailerlastpreventiveMaintanance1 =
                                                                                snapshot.data!.result!.result![index].trailerLastPreventiveMaintenance.toString();
                                                                            trailerNumber12 =
                                                                                snapshot.data!.result!.result![index].trailerNumber.toString();
                                                                            trailerMakeYear1 =
                                                                                snapshot.data!.result!.result![index].trailermakeYear.toString();
                                                                            truckGPS1 =
                                                                                snapshot.data!.result!.result![index].truckGps.toString();
                                                                            trucklastAnnualSeftyCheck =
                                                                                snapshot.data!.result!.result![index].truckLastAnnualSafetyCheck.toString();
                                                                            TruckNumber =
                                                                                snapshot.data!.result!.result![index].truckNumber.toString();
                                                                            trailerId1 =
                                                                                snapshot.data!.result!.result![index].trailerId.toString();
                                                                            tracklastpreventiveMaintanance1 =
                                                                                snapshot.data!.result!.result![index].trucklastPreventiveMaintenance.toString();
                                                                            truckMakeYear1 =
                                                                                snapshot.data!.result!.result![index].truckmakeYear.toString();
                                                                            status =
                                                                                snapshot.data!.result!.result![index].status.toString();
                                                                            dateTime =
                                                                                snapshot.data!.result!.result![index].truckmakeYear.toString();
                                                                            updateId =
                                                                                snapshot.data!.result!.result![index].id.toString();
                                                                            vehicleID2 =
                                                                                snapshot.data!.result!.result![index].trailerName.toString();
                                                                            seStatus1 =
                                                                                snapshot.data!.result!.result![index].statusText.toString();
                                                                            vehicleID3 =
                                                                                snapshot.data!.result!.result![index].trailerId.toString();
                                                                          });
                                                                        },
                                                                        child: Text("View")),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 300),
                                              child: Text(""),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Center(
                                        child: Container(
                                        height: 400,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/delivery-truck.gif'),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 100),
                                                child: Text(
                                                  "Data not available",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      top: vDetailTop,
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          vDetailTop = 1200;
                                        });
                                      },
                                      icon: Icon(Icons.arrow_back_ios_new)),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                    'Vehicle Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Front Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$frontDeskDetails",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Main Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$mainDeskDetails1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Max Freight Weight",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$maxFrieghtWeight1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Real Desk Detail",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$realDeskDetail1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer GPS",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$trailerGps1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                      "$trailerlastAnnualSeftyCheck",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                      "$trailerlastpreventiveMaintanance1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer Number",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$trailerNumber1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer Make Year",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$trailerMakeYear1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Track GPS",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$truckGPS1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                      "$trucklastAnnualSeftyCheck",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Truck Number",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$TruckNumber",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Trailer ID",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$trailerId1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                      "$tracklastpreventiveMaintanance1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Truck Make Year",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$truckMakeYear1",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$status",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date & Time",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      "$dateTime",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        dialogTop = 150;
                                        vDetailTop=1200;
                                        
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(-5, -5),
                                              blurRadius: blur,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.white12,
                                              offset: Offset(-5, -5),
                                              blurRadius: 7,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        seStatus = true;
                                        vDetailTop = 800;
                                        newAddFormTop = 0;
                                        frontDeskDetail.text =
                                            frontDeskDetails.toString();
                                        mainDeskDetail.text =
                                            mainDeskDetails1.toString();
                                        maxFreightWeight.text =
                                            maxFrieghtWeight1.toString();
                                        realDeskDetail.text =
                                            realDeskDetail1.toString();
                                        trailerGPS.text =
                                            trailerGps1.toString();
                                        trailerLastAnnualSafetyCheck.text =
                                            trailerlastAnnualSeftyCheck
                                                .toString();

                                        trailerLastPreventiveMaintenance.text =
                                            trailerlastpreventiveMaintanance1
                                                .toString();
                                        trailerNumber.text =
                                            trailerNumber12.toString();
                                        trailerMakeYear.text =
                                            trailerMakeYear1.toString();
                                        truckGPS.text = truckGPS1.toString();
                                        truckLastAnnualSafetyCheck.text =
                                            trucklastAnnualSeftyCheck
                                                .toString();
                                        truckNumber.text =
                                            TruckNumber.toString();
                                        truckLastPreventiveMaintenance.text =
                                            tracklastpreventiveMaintanance1
                                                .toString();
                                        truckMakeYear.text =
                                            truckMakeYear1.toString();

                                        var trailerId1;

                                        var status;
                                        var dateTime;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(-5, -5),
                                              blurRadius: blur,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.white12,
                                              offset: Offset(-5, -5),
                                              blurRadius: 7,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Update',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 150,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: newAddFormTop,
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              newAddFormTop = 1200;

                                              frontDeskDetail.clear();

                                              mainDeskDetail.clear();

                                              maxFreightWeight.clear();
                                              realDeskDetail.clear();

                                              trailerGPS.clear();

                                              trailerLastAnnualSafetyCheck
                                                  .clear();

                                              trailerLastPreventiveMaintenance
                                                  .clear();
                                              trailerNumber.clear();

                                              trailerMakeYear.clear();

                                              truckGPS.clear();

                                              truckLastAnnualSafetyCheck
                                                  .clear();
                                              truckNumber.clear();
                                              truckLastPreventiveMaintenance
                                                  .clear();
                                              truckMakeYear.clear();
                                              vehicleID2 = "";

                                              seStatus1 = "";
                                              vehicleID3 = "";
                                              updateId = "";
                                            });
                                          },
                                          icon: Icon(Icons.arrow_back_ios_new)),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                        seStatus
                                            ? 'Edit Details'
                                            : 'Add New Vehicle',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Front Desk Detail",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: frontDeskDetail,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Front Desk Detail';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Main Desk Detail",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: mainDeskDetail,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Main Desk Detail';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("MaxFreight Weight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: maxFreightWeight,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'MaxFreight Weight';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Real Desk Detail",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: realDeskDetail,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Real Desk Detail';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Trailer GPS",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: trailerGPS,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Trailer GPS';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Trailer Last Annual Safety Check",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            trailerLastAnnualSafetyCheck,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Trailer Last Annual Safety Check';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Trailer Last Preventive Maintenance",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            trailerLastPreventiveMaintenance,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Trailer Last Preventive Maintenance';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Trailer Number",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: trailerNumber,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Trailer Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Trailer Make Year",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: trailerMakeYear,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Trailer Make Year';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Truck GPS",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: truckGPS,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Truck GPS';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Truck Last Annual Safety Check",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: truckLastAnnualSafetyCheck,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Truck Last Annual Safety Check';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Truck Number",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: truckNumber,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Truck Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Truck Last Preventive Maintenance",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            truckLastPreventiveMaintenance,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Truck Last Preventive Maintenance';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Truck Make Year",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: truckMakeYear,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Truck Make Year';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type her",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Status",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      DropdownButtonFormField(
                                          hint: Text(seStatus1 != null
                                              ? "$seStatus1"
                                              : "Select Status"),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text('Active'),
                                              value: '1',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Inctive'),
                                              value: '0',
                                            ),
                                          ],
                                          onChanged: (value) {
                                            seStatus1 = value.toString();

                                            if (value == "1") {
                                              setState(() {
                                                seStatus1 = "Active";
                                              });
                                            } else {
                                              setState(() {
                                                seStatus1 = "Inctive";
                                              });
                                            }
                                          })
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Trailer Name",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FutureBuilder(
                                          future: getTrailerNameApi(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                child: Text("Loading..."),
                                              );
                                            } else {
                                              return DropdownButtonFormField(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                hint: Text(vehicleID3 != null
                                                    ? "$vehicleID3"
                                                    : "Select Id"),
                                                items: [
                                                  for (var i = 0;
                                                      i <
                                                          trailerNameData[
                                                                      "result"]
                                                                  ["Result"]
                                                              .length;
                                                      i++)
                                                    DropdownMenuItem<String>(
                                                      value: trailerNameData[
                                                                      "result"]
                                                                  ["Result"][i]
                                                              ["id"]
                                                          .toString(),
                                                      child: Center(
                                                        child: Text(trailerNameData[
                                                                        "result"]
                                                                    [
                                                                    "Result"][i]
                                                                ["trailerName"]
                                                            .toString()),
                                                      ),
                                                    ),
                                                ],
                                                onChanged: (value) {
                                                  vehicleID2 = value.toString();

                                                  for (var k = 0;
                                                      k <
                                                          trailerNameData[
                                                                      "result"]
                                                                  ["Result"]
                                                              .length;
                                                      k++) {
                                                    if (vehicleID2 ==
                                                        trailerNameData["result"]
                                                                    ["Result"]
                                                                [k]["id"]
                                                            .toString()) {
                                                      vehicleID3 = trailerNameData[
                                                                      "result"]
                                                                  ["Result"][k]
                                                              ["trailerName"]
                                                          .toString();

                                                      print(
                                                          "+++++++++$vehicleID3");
                                                      print(
                                                          "+++++++++$vehicleID2");
                                                    }
                                                  }
                                                },
                                              );
                                            }
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 330,
                                    height: 60,
                                    child: seStatus
                                        ? InkWell(
                                            onTap: () {
                                              var data = {
                                                "frontDeskDetail":
                                                    frontDeskDetail.text
                                                        .toString(),
                                                "mainDeskDetail": mainDeskDetail
                                                    .text
                                                    .toString(),
                                                "maxFreightWeight":
                                                    maxFreightWeight.text
                                                        .toString(),
                                                "rearDeskDetail": realDeskDetail
                                                    .text
                                                    .toString(),
                                                "trailerGPS":
                                                    trailerGPS.text.toString(),
                                                "trailerLastAnnualSafetyCheck":
                                                    trailerLastAnnualSafetyCheck
                                                        .text
                                                        .toString(),
                                                "trailerLastPreventiveMaintenance":
                                                    trailerLastPreventiveMaintenance
                                                        .text
                                                        .toString(),
                                                "trailerNumber": trailerNumber
                                                    .text
                                                    .toString(),
                                                "trailermakeYear":
                                                    trailerMakeYear.text
                                                        .toString(),
                                                "truckGPS":
                                                    truckGPS.text.toString(),
                                                "truckLastAnnualSafetyCheck":
                                                    truckLastAnnualSafetyCheck
                                                        .text
                                                        .toString(),
                                                "truckNumber":
                                                    truckNumber.text.toString(),
                                                "trucklastPreventiveMaintenance":
                                                    truckLastPreventiveMaintenance
                                                        .text
                                                        .toString(),
                                                "truckmakeYear": truckMakeYear
                                                    .text
                                                    .toString(),
                                                "trailerName":
                                                    vehicleID2.toString(),
                                                "statusText":
                                                    seStatus1.toString(),
                                                "trailerId":
                                                    vehicleID3.toString(),
                                                "id": updateId
                                              };
                                              if (frontDeskDetail.text.isNotEmpty &&
                                                  mainDeskDetail
                                                      .text.isNotEmpty &&
                                                  maxFreightWeight
                                                      .text.isNotEmpty &&
                                                  realDeskDetail
                                                      .text.isNotEmpty &&
                                                  trailerGPS.text.isNotEmpty &&
                                                  trailerLastAnnualSafetyCheck
                                                      .text.isNotEmpty &&
                                                  trailerLastPreventiveMaintenance
                                                      .text.isNotEmpty &&
                                                  trailerNumber
                                                      .text.isNotEmpty &&
                                                  trailerMakeYear
                                                      .text.isNotEmpty &&
                                                  truckGPS.text.isNotEmpty &&
                                                  truckLastAnnualSafetyCheck
                                                      .text.isNotEmpty &&
                                                  truckNumber.text.isNotEmpty &&
                                                  truckLastPreventiveMaintenance
                                                      .text.isNotEmpty &&
                                                  truckMakeYear
                                                      .text.isNotEmpty &&
                                                  seStatus1!.isNotEmpty &&
                                                  vehicleID2!.isNotEmpty &&
                                                  updateId!.isNotEmpty) {
                                                upDateVehiclesApi(data);
                                                print("********Success");
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'fill all required fields')),
                                                );
                                              }

                                              print("********$data");
                                            },
                                            child: Container(
                                              height: size.height,
                                              width: size.width,
                                              child: Center(
                                                  child: Text(
                                                'Update',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(-5, -5),
                                                      blurRadius: 7,
                                                      spreadRadius: 1),
                                                  BoxShadow(
                                                      color: Colors.white12,
                                                      offset: Offset(-5, -5),
                                                      blurRadius: 7,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              var data = {
                                                "frontDeskDetail":
                                                    frontDeskDetail.text
                                                        .toString(),
                                                "mainDeskDetail": mainDeskDetail
                                                    .text
                                                    .toString(),
                                                "maxFreightWeight":
                                                    maxFreightWeight.text
                                                        .toString(),
                                                "rearDeskDetail": realDeskDetail
                                                    .text
                                                    .toString(),
                                                "trailerGPS":
                                                    trailerGPS.text.toString(),
                                                "trailerLastAnnualSafetyCheck":
                                                    trailerLastAnnualSafetyCheck
                                                        .text
                                                        .toString(),
                                                "trailerLastPreventiveMaintenance":
                                                    trailerLastPreventiveMaintenance
                                                        .text
                                                        .toString(),
                                                "trailerNumber": trailerNumber
                                                    .text
                                                    .toString(),
                                                "trailermakeYear":
                                                    trailerMakeYear.text
                                                        .toString(),
                                                "truckGPS":
                                                    truckGPS.text.toString(),
                                                "truckLastAnnualSafetyCheck":
                                                    truckLastAnnualSafetyCheck
                                                        .text
                                                        .toString(),
                                                "truckNumber":
                                                    truckNumber.text.toString(),
                                                "trucklastPreventiveMaintenance":
                                                    truckLastPreventiveMaintenance
                                                        .text
                                                        .toString(),
                                                "truckmakeYear": truckMakeYear
                                                    .text
                                                    .toString(),
                                                "trailerId":
                                                    vehicleID3.toString(),
                                                "statusText":
                                                    seStatus1.toString(),
                                                "id": updateId
                                              };

                                              if (frontDeskDetail.text.isNotEmpty &&
                                                  mainDeskDetail
                                                      .text.isNotEmpty &&
                                                  maxFreightWeight
                                                      .text.isNotEmpty &&
                                                  realDeskDetail
                                                      .text.isNotEmpty &&
                                                  trailerGPS.text.isNotEmpty &&
                                                  trailerLastAnnualSafetyCheck
                                                      .text.isNotEmpty &&
                                                  trailerLastPreventiveMaintenance
                                                      .text.isNotEmpty &&
                                                  trailerNumber
                                                      .text.isNotEmpty &&
                                                  trailerMakeYear
                                                      .text.isNotEmpty &&
                                                  truckGPS.text.isNotEmpty &&
                                                  truckLastAnnualSafetyCheck
                                                      .text.isNotEmpty &&
                                                  truckNumber.text.isNotEmpty &&
                                                  truckLastPreventiveMaintenance
                                                      .text.isNotEmpty &&
                                                  truckMakeYear
                                                      .text.isNotEmpty &&
                                                  vehicleID2!.isNotEmpty &&
                                                  seStatus1!.isNotEmpty) {
                                                print("********Success");
                                                postTrailerNameApi(data);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'fill all required fields')),
                                                );
                                              }
                                              print(data);
                                              setState(() {
                                                frontDeskDetail.clear();
                                                mainDeskDetail.clear();
                                                maxFreightWeight.clear();
                                                realDeskDetail.clear();
                                                trailerGPS.clear();
                                                trailerLastAnnualSafetyCheck
                                                    .clear();
                                                trailerLastPreventiveMaintenance
                                                    .clear();
                                                trailerNumber.clear();
                                                trailerMakeYear.clear();
                                                truckGPS.clear();
                                                truckLastAnnualSafetyCheck
                                                    .clear();
                                                truckNumber.clear();
                                                truckLastPreventiveMaintenance
                                                    .clear();
                                                truckMakeYear.clear();
                                                vehicleID2 = "";
                                                seStatus1 = "";
                                              });
                                            },
                                            child: Container(
                                              height: size.height,
                                              width: size.width,
                                              child: Center(
                                                  child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(-5, -5),
                                                      blurRadius: blur,
                                                      spreadRadius: 1),
                                                  BoxShadow(
                                                      color: Colors.white12,
                                                      offset: Offset(-5, -5),
                                                      blurRadius: 7,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 200,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: dialogTop,
                      duration: Duration(milliseconds: 1000),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 40),
                        child: Container(
                          width: 250,
                          height: 250,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Icon(
                                Icons.warning,
                                size: 50,
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Alert Message",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Are you sure to delete this detail?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, top: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          dialogTop = 1200;
                                        });
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )),
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 7,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.white12,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 7,
                                                  spreadRadius: 1),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        vDetailTop = 1200;
                                        deleteVehiclesApi(updateId);
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          "Delete",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        )),
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 7,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.white12,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 7,
                                                  spreadRadius: 1),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(-5, -5),
                                    blurRadius: 7,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white12,
                                    offset: Offset(-5, -5),
                                    blurRadius: 7,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postTrailerNameApi(Map<String, dynamic> data) async {
    var dataa = jsonEncode(data);
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/VehicleDetailAPI/?status=1"),
        body: dataa,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success...')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VehiclesPage()));
      setState(() {
        newAddFormTop = 1200;
      });
      trailerNameData = jsonDecode(res.body.toString());
      print("id:-${trailerNameData['result']['Result'][0]['id'].toString()}");
      return trailerNameData = jsonDecode(res.body.toString());
    } else {
      throw Exception("Something Wrong");
    }
  }

  Future<void> getTrailerNameApi() async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/AdminApp/TrailerAPI/?status=1"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      trailerNameData = jsonDecode(res.body.toString());
      print("id:-${trailerNameData['result']['Result'][0]['id'].toString()}");
      return trailerNameData = jsonDecode(res.body.toString());
    } else {
      throw Exception("Something Wrong");
    }
  }

  Future<void> upDateVehiclesApi(data) async {
    var data2 = jsonEncode(data);
    print(id);
    final res = await http
        .patch(Uri.parse("$baseUrl/VehicleDetailAPI/"), body: data2, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      setState(() {
        newAddFormTop = 1200;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green, content: Text('Success')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VehiclesPage()));
      return updatavehicles = jsonDecode(res.body.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Something Went Wrong')));
      throw Exception("Failed to load ApivehiclesDetails");
    }
  }

  Future<void> deleteVehiclesApi(updateId) async {
    final res = await http
        .delete(Uri.parse("$baseUrl/VehicleDetailAPI/?id=$updateId"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green, content: Text('Success')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VehiclesPage()));
      setState(() {
        dialogTop = 1200;
      });
      return updatavehicles = jsonDecode(res.body.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Something Went Wrong')));
      throw Exception("Failed to load ApivehiclesDetails");
    }
  }
}
