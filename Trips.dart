import 'dart:convert';
import 'dart:ui';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../ApiConttrollerPage/ApiControllerPage.dart';
import 'package:bridge_point_logistics/ModelsPage/TripListModels.dart';
import '../BottomBarPage/BottomBarPage.dart';
import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';
import 'package:number_paginator/number_paginator.dart';
import '../ModelsPage/ReadinessNewdataAddFormModels.dart';
import '../ModelsPage/readinessPage&Dispatcher.dart';

int page = 0;
int page1 = 0;
int page2 = 0;
int page3 = 0;
int page4 = 0;
List buttonTextName = ["View", "Fill Form"];
late TabController controller;

class TripsPage extends StatefulWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController truckNumber = TextEditingController();
  TextEditingController cityDriverName = TextEditingController();
  TextEditingController cityTruck = TextEditingController();
  DateTime _dateTime = DateTime.now();
  final TextEditingController tripId = TextEditingController();
  final TextEditingController driverId = TextEditingController();
  final TextEditingController statusText = TextEditingController();
  final TextEditingController id = TextEditingController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final scrollController = ScrollController();
  var rejectData;

  /// bool _customTileExpanded = false;
  double _sliderValue = 0;
  bool isLoadingMore = false;
  bool shouldPop = false;
  var data1;

  var iid;
  var rate = 0;
  var orderData;

  double readinessTop = 1200;
  bool readinessFormUpdate = false;

  String? truckMacYear = "";
  String? truckMac2Year = "";
  String? fitUnfit = "";
  String? fitUnfit1 = "";
  String? driver1Name = "";
  String? driver2Name = "";
  String? driver3Name = "";

  double driverDetailsTop = 1200;
  var driverName1;
  var mobileNo1;
  var saftyForm1;
  var driverName2;
  var mobileNo2;
  var saftyForm2;
  var saftyFormStatus;

  var id3;
  var id1;
  var tripId123;
  var driverId123;
  var driverNumber;
  var driver1Id;
  var driver2Id;
  var driver3Id;
  dynamic? driverListData;

  String? driver1PhoneNo = "";
  String? driver2PhoneNo = "";
  late String padLock = "";
  bool login = false;
  @override
  String? idTrips = "";

  Future<void> getAddressDataApi(page) async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/TripListAPI/?id=617fac7c611feecae48da6a8&page=$page"),
        headers: {"Authorization": token});
    if (res.statusCode == 200) {
      return orderData = (jsonDecode(res.body.toString())) ?? "";
    } else {
      return print("Something Error");
    }
  }

  var filterDriverData = "";

  Future<void> getDriverListApiFunction() async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/DriverList1API/"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });

    if (res.statusCode == 200) {
      setState(() {
        data1 = (jsonDecode(res.body.toString())) ?? '';
        print(data1);
      });
    } else {
      throw Exception("Something Error");
    }
  }

  // Future<void> getDriverListApiFunctionOneDriverDetails(driver1id) async {
  //   final res = await http.get(
  //       Uri.parse(
  //           "https://canadalogistic.metalsart.in/dispatcherApp/DriverList1API/?id=$driver1id"),
  //       headers: {
  //         "Content-type": "application/json;charset=UTF-8",
  //         "Authorization": token,
  //       });
  //
  //   if (res.statusCode == 200) {
  //     filterDriverData = jsonDecode(res.body.toString());
  //      setState(() {
  //       driver1PhoneNo=filterDriverData['result'][0]['mobileNo'].toString();
  //      });
  //     print(filterDriverData);
  //   } else {
  //     throw Exception("Something Error");
  //   }
  // }

  Future<void> _refresh() async {
    setState(() {});
  }

  late List<TripsListModels> list;

  @override
  void initState() {
    getDriverListApiFunction();
    getDriverListApiFunction2();
    getDriverListApiFunction();

    super.initState();

    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  Future<void> getRejectDataApi(page3) async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/TripListAPI/?id=617fac7c611feecae48da512&page=$page3"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      rejectData = (jsonDecode(res.body.toString())) ?? " ";
      setState(() {
        rate = (rejectData['result'].length) ?? " ";
      });
    } else {
      throw Exception("Failed to load DeleverdModels123");
    }
  }

  var tripIdReadinessId;

  void dispose() {
    // controller.dispose();
  }

  int count = 5;
  void backButtonController() {
    if (count >= 0) {
      count--;
    }

    print(count);
  }

  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    count = controller.index;
    print(controller.index);
    if (controller.index != 0) {
      shouldPop = false;
    }
    if (controller.index == 0) {
      shouldPop = true;
    }

    return WillPopScope(
        onWillPop: () async {
          backButtonController();
          print(count);
          if (count == 4) {
            controller.animateTo(4);
          }
          if (count == 3) {
            controller.animateTo(3);
          }
          if (count == 2) {
            controller.animateTo(2);
          }
          if (count == 1) {
            controller.animateTo(1);
          }
          if (count == 0) {
            controller.animateTo(0);
          }
          // controller.animateTo(0);
          return shouldPop;
        },
        child: SafeArea(
          child: DefaultTabController(
            length: 5,
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
                      centerTitle: true,
                      title: Text(
                        "Trips",
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: IconButton(
                              onPressed: () {
                                controller.animateTo(4);
                              },
                              icon: Stack(
                                children: [
                                  Icon(Icons.notifications, size: 40),
                                  Positioned(
                                      child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: (rate != 0)
                                            ? CircleAvatar(
                                                child: Text(
                                                  "$rate",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                backgroundColor: Colors.red,
                                              )
                                            : null,
                                      )
                                    ],
                                  ))
                                ],
                              )),
                        )
                      ],
                      bottom: PreferredSize(
                        preferredSize: Size(300, 50),
                        child: ColoredBox(
                          color: Colors.indigo,
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            isScrollable: true,
                            indicatorColor: Colors.red,
                            labelColor: Colors.red,
                            labelStyle: TextStyle(
                              fontSize: 15,
                            ),
                            controller: controller,
                            unselectedLabelStyle:
                                GoogleFonts.merriweather(fontSize: 10),
                            tabs: const [
                              Tab(
                                text: "NEW TENDERS",
                              ),
                              Tab(
                                text: "ACCEPTED TENDERS",
                              ),
                              Tab(
                                text: "DISPATCHED LOADS",
                              ),
                              Tab(
                                text: "DELIVERED",
                              ),
                              Tab(
                                text: "REJECTED",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    body: Stack(
                      children: [
                        TabBarView(
                          controller: controller,
                          children: [
                            RefreshIndicator(
                              triggerMode: RefreshIndicatorTriggerMode.anywhere,
                              edgeOffset: 20,
                              displacement: 20,
                              strokeWidth: 2,
                              color: Colors.blue,
                              backgroundColor: Colors.white,
                              onRefresh: _refresh,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: FutureBuilder(
                                    future: getAddressDataApi(page),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return (orderData['result'].length > 0)
                                            ? SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ListView.builder(
                                                      itemCount:
                                                          orderData['result']
                                                              .length,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index1) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        offset: Offset(
                                                                            5,
                                                                            5),
                                                                        blurRadius:
                                                                            3,
                                                                        spreadRadius:
                                                                            1),
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .white,
                                                                        offset: Offset(
                                                                            -5,
                                                                            -5),
                                                                        blurRadius:
                                                                            3,
                                                                        spreadRadius:
                                                                            1),
                                                                  ]),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 220,
                                                                    height: 70,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              size.width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.indigo,
                                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(200))),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              size.width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.indigo,
                                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), topRight: Radius.circular(200))),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  ExpansionTile(
                                                                    title: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              200,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              Text(
                                                                                'OrderId:-${orderData['result'][index1]['orderId'].toString()}',
                                                                                style: GoogleFonts.merriweather(color: Colors.white, fontSize: 15),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text('${orderData['result'][index1]['customerName'].toString()}', overflow: TextOverflow.ellipsis, style: GoogleFonts.merriweather(color: Colors.white, fontSize: 15)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 70,
                                                                              height: 25,
                                                                              child: ElevatedButton(
                                                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), primary: Colors.indigo.withOpacity(0.5)),
                                                                                child: Text(
                                                                                  "Accept",
                                                                                  style: GoogleFonts.merriweather(fontSize: 10, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                onPressed: () {
                                                                                  id123 = orderData['result'][index1]['tripId'].toString();
                                                                                  postNewTripData(id123);
                                                                                  print(tripId);
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    children: [
                                                                      ListView
                                                                          .builder(
                                                                        itemCount:
                                                                            orderData['result'][index1]['data'].length,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            ClampingScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              top: 5,
                                                                              bottom: 10,
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              decoration: BoxDecoration(color: Colors.cyan.shade50, borderRadius: BorderRadius.circular(10)),
                                                                              child: ExpansionTile(
                                                                                backgroundColor: Colors.cyan.shade100,
                                                                                title: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Stop No:-${orderData['result'][index1]['data'][index]['sequenceNum']}',
                                                                                      style: GoogleFonts.merriweather(),
                                                                                    ),
                                                                                    Text('${orderData['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}', style: GoogleFonts.merriweather()),
                                                                                  ],
                                                                                ),
                                                                                children: [
                                                                                  Container(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(bottom: 10),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          SizedBox(
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.only(top: 0.1, bottom: 0.1),
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  SizedBox(
                                                                                                    width: 5,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 100,
                                                                                                    child: Text("OrderId", style: GoogleFonts.merriweather()),
                                                                                                  ),
                                                                                                  SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['orderId']}', style: GoogleFonts.merriweather())),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("City", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['city']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("LocName", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['locName']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("Type", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['type']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("Pickup/Delivery #", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['pickupDeliveryId']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("PickupAppointmentDateAndTime", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("CustomerPo #", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['customerPo']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("Facility", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['facility']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          Divider(),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                width: 5,
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 100,
                                                                                                child: Text("Status", style: GoogleFonts.merriweather()),
                                                                                              ),
                                                                                              SizedBox(width: 200, child: Text('${orderData['result'][index1]['data'][index]['status']}', style: GoogleFonts.merriweather())),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 25,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 100),
                                                        child: Text(
                                                          "Data not available",
                                                          style: GoogleFonts
                                                              .merriweather(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                      }
                                    },
                                  ),
                                ),
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: FutureBuilder(
                                      future: getAcceptTripFunction(page1),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return (TripsAccepteModels1['result']
                                                      .length >
                                                  0)
                                              ? SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ListView.builder(
                                                        itemCount:
                                                            TripsAccepteModels1[
                                                                    'result']
                                                                .length,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index1) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade500,
                                                                          offset: Offset(
                                                                              5, 5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .white,
                                                                          offset: Offset(-5,
                                                                              -5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                    ]),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          220,
                                                                      height:
                                                                          70,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(200))),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), topRight: Radius.circular(200))),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ExpansionTile(
                                                                      title:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                Text(
                                                                                  'OrderId:-${TripsAccepteModels1['result'][index1]['orderId'].toString()}',
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Text('${TripsAccepteModels1['result'][index1]['customerName'].toString()}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 15)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 70,
                                                                                height: 25,
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), primary: Colors.indigo.withOpacity(0.5)),
                                                                                  child: Text(
                                                                                    "Fill Form",
                                                                                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    // update = false;

                                                                                    setState(() {
                                                                                      readinessTop = 0;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      children: [
                                                                        ListView
                                                                            .builder(
                                                                          itemCount:
                                                                              TripsAccepteModels1['result'][index1]['data'].length,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          shrinkWrap:
                                                                              true,
                                                                          physics:
                                                                              ClampingScrollPhysics(),
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                top: 5,
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                decoration: BoxDecoration(color: Colors.cyan.shade50, borderRadius: BorderRadius.circular(10)),
                                                                                child: ExpansionTile(
                                                                                  backgroundColor: Colors.cyan.shade100,
                                                                                  title: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text('StopNo:-${TripsAccepteModels1['result'][index1]['data'][index]['sequenceNum']}'),
                                                                                      Text('${TripsAccepteModels1['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}'),
                                                                                    ],
                                                                                  ),
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("OrderId"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['orderId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("City"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['city']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("LocName"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['locName']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Type"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['type']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Pickup/Delivery #"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['pickupDeliveryId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("PickupAppointmentDateAndTime"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("CustomerPo #"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['customerPo']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Facility"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['facility']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Status"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsAccepteModels1['result'][index1]['data'][index]['status']}')),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 25,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 100),
                                                          child: Text(
                                                            "Data not available",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                        }
                                      },
                                    ),
                                  ),
                                ),
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: FutureBuilder(
                                      future: getDispatchApi(page2),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return (TripsDispatchModels2['result']
                                                      .length >
                                                  0)
                                              ? SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ListView.builder(
                                                        itemCount:
                                                            TripsDispatchModels2[
                                                                    'result']
                                                                .length,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index1) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade500,
                                                                          offset: Offset(
                                                                              5, 5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .white,
                                                                          offset: Offset(-5,
                                                                              -5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                    ]),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          220,
                                                                      height:
                                                                          70,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(200))),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), topRight: Radius.circular(200))),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ExpansionTile(
                                                                      title:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                Text(
                                                                                  'OrderId:-${TripsDispatchModels2['result'][index1]['orderId'].toString()}',
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Text('${TripsDispatchModels2['result'][index1]['customerName'].toString()}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 15)),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 70,
                                                                                height: 25,
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), primary: Colors.indigo.withOpacity(0.5)),
                                                                                  child: Text(
                                                                                    "Driver",
                                                                                    style: TextStyle(fontSize: 10),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      driverDetailsTop = 0;
                                                                                      driverName1 = '${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['firstName'].toString()}${' '}${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['lastName'].toString()}';
                                                                                      mobileNo1 = '${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['mobileNo'].toString()}';
                                                                                      saftyForm1 = '${TripsDispatchModels2['result'][index1]['driver1SSform'].toString()}';
                                                                                      driverName2 = '${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['firstName'].toString()}${' '}${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['lastName'].toString()}';
                                                                                      mobileNo2 = "${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['mobileNo'].toString()}";
                                                                                      saftyForm2 = '${TripsDispatchModels2['result'][index1]['driver2SSform'].toString()}';
                                                                                      saftyFormStatus = '${TripsDispatchModels2['result'][index1]['saftysecurityform'].toString()}';
                                                                                      print('TripIdrhghfdhghfdgdg${TripsDispatchModels2['result'][index1]['tripId'].toString()}');
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              SizedBox(
                                                                                  width: 70,
                                                                                  height: 25,
                                                                                  child: ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                      primary: Colors.red.withOpacity(0.5),
                                                                                    ),
                                                                                    child: Text(
                                                                                      "Edit",
                                                                                      style: TextStyle(fontSize: 10),
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        print('TripIdrhghfdhghfdgdg${TripsDispatchModels2['result'][index1]['tripId'].toString()}');
                                                                                        tripId123 = TripsDispatchModels2['result'][index1]['tripId'].toString();
                                                                                        getReadinessData(tripId123);
                                                                                        readinessTop = 0;
                                                                                        readinessFormUpdate = true;
                                                                                        print(tripId123);
                                                                                      });

                                                                                      // update = true;
                                                                                      // Navigator.push(
                                                                                      //     context,
                                                                                      //     MaterialPageRoute(
                                                                                      //       builder: (context) => ReadinessForm2(
                                                                                      //         id: '${TripsDispatchModels2['result'][index1]['id'].toString()}',
                                                                                      //         tripId: '${TripsDispatchModels2['result'][index1]['tripId'].toString()}',
                                                                                      //         driverID: '',
                                                                                      //         truckMacYear: '',
                                                                                      //         fitUnfit: '',
                                                                                      //         driver1Id: '${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['driverId'].toString()}',
                                                                                      //         driver1PhoneNo: '${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['mobileNo'].toString()}',
                                                                                      //         driver2PhoneNo: '${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['mobileNo'].toString()}',
                                                                                      //         truckNumber: '${TripsDispatchModels2['result'][index1]['truckNumber'].toString()}',
                                                                                      //         cityDriverName: '',
                                                                                      //         cityTruck: '',
                                                                                      //         padLock: '',
                                                                                      //         truckMac2Year: '',
                                                                                      //         driver1Name: '${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['firstName'].toString()}${' '}${TripsDispatchModels2['result'][index1]['driver1Detail'][0]['lastName'].toString()}',
                                                                                      //         driver2Name: '${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['firstName'].toString()} ${' '}${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['lastName'].toString()} ',
                                                                                      //         driver2Id: '${TripsDispatchModels2['result'][index1]['driver2Detail'][0]['driverId'].toString()}',
                                                                                      //       ),
                                                                                      //     ));
                                                                                      // id123=TripsAccepteModels1['result'][index1]['tripId'].toString();
                                                                                      // postNewTripData(id123);
                                                                                      // print(tripId);
                                                                                    },
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      children: [
                                                                        ListView
                                                                            .builder(
                                                                          itemCount:
                                                                              TripsDispatchModels2['result'][index1]['data'].length,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          shrinkWrap:
                                                                              true,
                                                                          physics:
                                                                              ClampingScrollPhysics(),
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                top: 5,
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                decoration: BoxDecoration(color: Colors.cyan.shade50, borderRadius: BorderRadius.circular(10)),
                                                                                child: ExpansionTile(
                                                                                  backgroundColor: Colors.cyan.shade100,
                                                                                  title: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text('StopNo:-${TripsDispatchModels2['result'][index1]['data'][index]['sequenceNum']}'),
                                                                                      Text('${TripsDispatchModels2['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}'),
                                                                                    ],
                                                                                  ),
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("OrderId"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['orderId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("City"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['city']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("LocName"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['locName']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Type"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['type']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Pickup/Delivery #"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['pickupDeliveryId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("PickupAppointmentDateAndTime"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Id"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['id']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("CustomerPo #"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['customerPo']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Facility"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['facility']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Status"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${TripsDispatchModels2['result'][index1]['data'][index]['status']}')),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 25,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 100),
                                                          child: Text(
                                                            "Data not available",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                        }
                                      },
                                    ),
                                  ),
                                ),
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: FutureBuilder(
                                      future:
                                          getNewDeleverdDataFunctionApi(page4),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return (newDeleverdData['result']
                                                      .length >
                                                  0)
                                              ? Column(
                                                  children: [
                                                    ListView.builder(
                                                      itemCount:
                                                          newDeleverdData[
                                                                  'result']
                                                              .length,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index1) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        offset: Offset(
                                                                            5,
                                                                            5),
                                                                        blurRadius:
                                                                            3,
                                                                        spreadRadius:
                                                                            1),
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .white,
                                                                        offset: Offset(
                                                                            -5,
                                                                            -5),
                                                                        blurRadius:
                                                                            3,
                                                                        spreadRadius:
                                                                            1),
                                                                  ]),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 220,
                                                                    height: 70,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              size.width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.indigo,
                                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(200))),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              size.width,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.indigo,
                                                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), topRight: Radius.circular(200))),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  ExpansionTile(
                                                                    title: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              170,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              Text(
                                                                                'OrderId:-${newDeleverdData['result'][index1]['orderId'].toString()}',
                                                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Text('${newDeleverdData['result'][index1]['customerName'].toString()}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 15)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    children: [
                                                                      ListView
                                                                          .builder(
                                                                        itemCount:
                                                                            newDeleverdData['result'][index1]['data'].length,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            ClampingScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              top: 5,
                                                                              bottom: 10,
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              decoration: BoxDecoration(color: Colors.cyan.shade50, borderRadius: BorderRadius.circular(10)),
                                                                              child: ExpansionTile(
                                                                                backgroundColor: Colors.cyan.shade100,
                                                                                title: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text('StopNo:-${newDeleverdData['result'][index1]['data'][index]['sequenceNum']}'),
                                                                                    Text('${newDeleverdData['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}'),
                                                                                  ],
                                                                                ),
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(top: 0.1, bottom: 0.1),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("OrderId"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['orderId']}')),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("City"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['city']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("LocName"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['locName']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("Type"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['type']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("Pickup/Delivery #"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['pickupDeliveryId']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("PickupAppointmentDateAndTime"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("Id"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['id']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("CustomerPo #"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['customerPo']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("Facility"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['facility']}')),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 100,
                                                                                        child: Text("Status"),
                                                                                      ),
                                                                                      SizedBox(width: 200, child: Text('${newDeleverdData['result'][index1]['data'][index]['status']}')),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 25,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 100),
                                                          child: Text(
                                                            "Data not available",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                        }
                                      },
                                    ),
                                  ),
                                ),
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: FutureBuilder(
                                      future: getDeleverdDataFunctionApi(page3),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return (DeleverdModels123['result']
                                                      .length >
                                                  0)
                                              ? SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ListView.builder(
                                                        itemCount:
                                                            DeleverdModels123[
                                                                    'result']
                                                                .length,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index1) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade500,
                                                                          offset: Offset(
                                                                              5, 5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .white,
                                                                          offset: Offset(-5,
                                                                              -5),
                                                                          blurRadius:
                                                                              3,
                                                                          spreadRadius:
                                                                              1),
                                                                    ]),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          220,
                                                                      height:
                                                                          70,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), bottomRight: Radius.circular(200))),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                size.width,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topLeft: Radius.circular(25), topRight: Radius.circular(200))),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ExpansionTile(
                                                                      title:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                Text(
                                                                                  'OrderId:-${DeleverdModels123['result'][index1]['orderId'].toString()}',
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Text('${DeleverdModels123['result'][index1]['customerName'].toString()}', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 15)),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 70,
                                                                                height: 25,
                                                                                child: ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), primary: Colors.indigo.withOpacity(0.5)),
                                                                                  child: Text(
                                                                                    "Reassign",
                                                                                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    setState(() {
                                                                                      readinessTop = 0;
                                                                                      truckMacYear = " ";
                                                                                      truckMac2Year = " ";
                                                                                      fitUnfit = " ";
                                                                                      fitUnfit1 = " ";
                                                                                      driver1Name = " ";
                                                                                      driver2Name = " ";
                                                                                      driver3Name = " ";
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      children: [
                                                                        ListView
                                                                            .builder(
                                                                          itemCount:
                                                                              DeleverdModels123['result'][index1]['data'].length,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          shrinkWrap:
                                                                              true,
                                                                          physics:
                                                                              ClampingScrollPhysics(),
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                top: 5,
                                                                              ),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                decoration: BoxDecoration(color: Colors.cyan.shade50, borderRadius: BorderRadius.circular(10)),
                                                                                child: ExpansionTile(
                                                                                  backgroundColor: Colors.cyan.shade100,
                                                                                  title: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text('Stop No:-${DeleverdModels123['result'][index1]['data'][index]['sequenceNum']}'),
                                                                                      Text('${DeleverdModels123['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}'),
                                                                                    ],
                                                                                  ),
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("OrderId"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['orderId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("City"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['city']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("LocName"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['locName']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    SizedBox(
                                                                                      child: ('${DeleverdModels123['result'][index1]['data'][index]['type']}' == "Drop Empty")
                                                                                          ? null
                                                                                          : Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                SizedBox(
                                                                                                  width: 5,
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 100,
                                                                                                  child: Text("Type"),
                                                                                                ),
                                                                                                SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['type']}')),
                                                                                              ],
                                                                                            ),
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Pickup/Delivery #"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['pickupDeliveryId']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("PickupAppointmentDateAndTime"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("CustomerPo #ss"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['customerPo']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Facility"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['facility']}')),
                                                                                      ],
                                                                                    ),
                                                                                    Divider(),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 5,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 100,
                                                                                          child: Text("Status"),
                                                                                        ),
                                                                                        SizedBox(width: 200, child: Text('${DeleverdModels123['result'][index1]['data'][index]['status']}')),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 25,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
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
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 100),
                                                          child: Text(
                                                            "Data not available",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedPositioned(
                          top: readinessTop,
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RefreshIndicator(
                                triggerMode:
                                    RefreshIndicatorTriggerMode.anywhere,
                                edgeOffset: 20,
                                displacement: 20,
                                strokeWidth: 2,
                                color: Colors.blue,
                                backgroundColor: Colors.white,
                                onRefresh: _refresh,
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    readinessTop = 1200;
                                                    driver1Name = " ";
                                                    driver2Name = ' ';
                                                    truckMacYear = ' ';

                                                    fitUnfit = ' ';

                                                    fitUnfit1 = ' ';

                                                    driver1PhoneNo = ' ';

                                                    driver2PhoneNo = ' ';

                                                    driver1Id = ' ';

                                                    driver2Id = ' ';

                                                    id1 = '';

                                                    driver3Id = ' ';

                                                    driver3Name = ' ';

                                                    truckNumber.text = ' ';

                                                    cityTruck.text = ' ';

                                                    truckMac2Year = ' ';

                                                    padLock = ' ';
                                                  });
                                                },
                                                icon: Icon(Icons
                                                    .arrow_back_ios_new_outlined)),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text(
                                              readinessFormUpdate
                                                  ? 'Edit Readiness'
                                                  : 'Readiness Form',
                                              style: GoogleFonts.merriweather(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 35,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "LAST MAINTANANCE ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime(
                                                                        1990),
                                                                lastDate:
                                                                    DateTime(
                                                                        2050))
                                                            .then((value) {
                                                          setState(() {
                                                            _dateTime = value!;
                                                            truckMacYear = (_dateTime
                                                                        .day
                                                                        .toString() +
                                                                    "/" +
                                                                    _dateTime
                                                                        .month
                                                                        .toString() +
                                                                    "/" +
                                                                    _dateTime
                                                                        .year
                                                                        .toString()) ??
                                                                " ";
                                                            print(
                                                                'truckMakingYear:-${truckMacYear.toString()}');
                                                          });
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.calendar_today,
                                                        color: Colors.red,
                                                      )),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(truckMacYear
                                                          .toString()),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                              " EQUIPMENT ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              hint: Text((fitUnfit
                                                      .toString()
                                                      .isNotEmpty)
                                                  ? "$fitUnfit"
                                                  : "Select"),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("FIT"),
                                                  value: "fit",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("UNFIT"),
                                                  value: "unfit",
                                                ),
                                              ],
                                              onChanged: (String? value) {
                                                fitUnfit1 = value.toString();
                                                print(fitUnfit1);
                                              },
                                            ),
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
                                              "DRIVER1 NAME	",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            FutureBuilder(
                                              //  future:driverListData ,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                    child: Text(""),
                                                  );
                                                } else {
                                                  return DropdownButtonFormField(
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))),
                                                    hint: Text((driver1Name
                                                            .toString()
                                                            .isNotEmpty)
                                                        ? "$driver1Name"
                                                        : "Select"),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    items: [
                                                      for (var i = 0;
                                                          i <
                                                              driverListData[
                                                                      'result']
                                                                  .length;
                                                          i++)
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}"),
                                                          value:
                                                              "${(driverListData['result'][i]['id'].toString()) ?? ""}",
                                                        ),
                                                    ],
                                                    onChanged: (String? value) {
                                                      driver1Id =
                                                          value.toString();
                                                      setState(() {
                                                        for (var i = 0;
                                                            i <
                                                                driverListData[
                                                                        'result']
                                                                    .length;
                                                            i++) {
                                                          if (value ==
                                                              "${(driverListData['result'][i]['id'].toString()) ?? ""}") {
                                                            driver1Id = (driverListData[
                                                                            'result']
                                                                        [
                                                                        i]['id']
                                                                    .toString()) ??
                                                                "";
                                                            driver1Name =
                                                                "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}";

                                                            driver1PhoneNo =
                                                                (driverListData['result'][i]
                                                                            [
                                                                            'mobileNo']
                                                                        .toString()) ??
                                                                    "";

                                                            print(driver1Name);
                                                            print(
                                                                driver1PhoneNo);
                                                          }
                                                        }
                                                      });

                                                      //    getDriverListApiFunctionOneDriverDetails(driver1Id);
                                                    },
                                                  );
                                                }
                                              },
                                            ),
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
                                              "DRIVER2 NAME",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            FutureBuilder(
                                                // future:
                                                // driverListData,
                                                builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                  child: Text(""),
                                                );
                                              } else {
                                                return DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                  hint: Text((driver2Name
                                                          .toString()
                                                          .isNotEmpty)
                                                      ? '$driver2Name'
                                                      : 'Select'),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  items: [
                                                    for (var i = 0;
                                                        i <
                                                            driverListData[
                                                                    'result']
                                                                .length;
                                                        i++)
                                                      DropdownMenuItem(
                                                        child: Text(
                                                            "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}"),
                                                        value:
                                                            "${(driverListData['result'][i]['id'].toString()) ?? ""}",
                                                      ),
                                                  ],
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      for (var i = 0;
                                                          i <
                                                              driverListData[
                                                                      'result']
                                                                  .length;
                                                          i++) {
                                                        if (value ==
                                                            "${(driverListData['result'][i]['id'].toString()) ?? ""}") {
                                                          driver2Id = (driverListData[
                                                                          'result']
                                                                      [i]['id']
                                                                  .toString()) ??
                                                              "";
                                                          driver2Name =
                                                              "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}";

                                                          driver2PhoneNo =
                                                              (driverListData['result']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'mobileNo']
                                                                      .toString()) ??
                                                                  "";

                                                          print(driver2Name);
                                                          print(driver2PhoneNo);
                                                        }
                                                      }
                                                    });
                                                  },
                                                );
                                              }
                                            })
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
                                              "DRIVER1 MobileNo",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Container(
                                                height: 55,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        '$driver1PhoneNo',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ],
                                                )),
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
                                              "DRIVER2 MobileNo",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "$driver2PhoneNo"!,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ],
                                                )),
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
                                              "CITY DRIVER NAME(Optional)",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            FutureBuilder(
                                              // future:getDriverListApiFunction(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                    child: Text(''),
                                                  );
                                                } else {
                                                  return DropdownButtonFormField(
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))),
                                                    hint: Text((driver3Name
                                                            .toString()
                                                            .isNotEmpty)
                                                        ? "$driver3Name"
                                                        : "Select"),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    items: [
                                                      for (var i = 0;
                                                          i <
                                                              data1['result']
                                                                  .length;
                                                          i++)
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "${(data1['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}"),
                                                          value:
                                                              "${(data1['result'][i]['id'].toString()) ?? ""}",
                                                        ),
                                                    ],
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        for (var i = 0;
                                                            i <
                                                                data1['result']
                                                                    .length;
                                                            i++) {
                                                          if (value ==
                                                              "${(data1['result'][i]['id'].toString()) ?? ""}") {
                                                            driver3Id =
                                                                data1['result']
                                                                            [i]
                                                                        ['id']
                                                                    .toString();
                                                            driver3Name =
                                                                "${(data1['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}";

                                                            print(driver3Name);
                                                          }
                                                        }
                                                      });
                                                    },
                                                  );
                                                }
                                              },
                                            ),
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
                                              "Truck Number"!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter truckNumber text';
                                                }
                                                return null;
                                              },
                                              controller: truckNumber,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
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
                                              "CITY TRUCK",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter cityTruck text';
                                                }
                                                return null;
                                              },
                                              controller: cityTruck,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
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
                                              "MODEL YEAR",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            DropdownButtonFormField(
                                              hint: Text((truckMac2Year
                                                      .toString()
                                                      .isNotEmpty)
                                                  ? "$truckMac2Year"
                                                  : "Select"),
                                              borderRadius:
                                                  BorderRadius.circular(10),

                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              // icon: Icon(Icons.calendar_today,
                                              //     color: Colors.red),
                                              items: [
                                                for (int i = 0; i <= 50; i++)
                                                  DropdownMenuItem(
                                                    child: Text(
                                                      "${1998 + i}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    value: "${1998 + i}",
                                                  )
                                              ],
                                              onChanged: (value) {
                                                truckMac2Year =
                                                    value.toString();
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                "TRUCK FUEL",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Center(
                                              child: Text(
                                                "FUEL:- ${_sliderValue}%",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Slider(
                                                max: 100,
                                                min: 0,
                                                divisions: 4,
                                                inactiveColor: Colors.red,
                                                label: _sliderValue
                                                    .round()
                                                    .toString(),
                                                activeColor: Colors.indigo,
                                                value: _sliderValue,
                                                onChanged: ((newValue) {
                                                  setState(() {
                                                    _sliderValue = newValue;

                                                    print(_sliderValue);
                                                  });
                                                })),
                                            SizedBox(height: 25),
                                          ],
                                        ),
                                        readinessFormUpdate
                                            ? InkWell(
                                                onTap: () {
                                                  statusText.text = "Active";
                                                  var data = {
                                                    "truckMacYear":
                                                        truckMacYear.toString(),
                                                    "fitUnfit":
                                                        fitUnfit1.toString(),
                                                    "driver1Id":
                                                        driver1Id.toString(),
                                                    "driver2Id":
                                                        driver2Id.toString(),
                                                    "driver1PhoneNo":
                                                        driver1PhoneNo
                                                            .toString(),
                                                    "driver2PhoneNo":
                                                        driver2PhoneNo
                                                            .toString(),
                                                    "truckNumber": truckNumber
                                                        .text
                                                        .toString(),
                                                    "fuel": _sliderValue!
                                                        .toDouble(),
                                                    "cityDriverName":
                                                        driver3Id.toString(),
                                                    "cityTruck": cityTruck.text
                                                        .toString(),
                                                    "padLock":
                                                        padLock.toString(),
                                                    "truckMac2Year":
                                                        truckMac2Year
                                                            .toString(),
                                                    "truckMacYear":
                                                        truckMacYear.toString(),
                                                    "id": id1,
                                                    "status": 1,
                                                    "tripId":
                                                        tripId123.toString()
                                                  };

                                                  var data123 = {
                                                    "tripId":
                                                        tripId.text.toString(),
                                                    "driverId": driverId.text
                                                        .toString(),
                                                    "statusText": statusText
                                                        .text
                                                        .toString(),
                                                    "id": id1
                                                  };

                                                  print(data);
                                                  print(data123);

                                                  if (truckMacYear!
                                                              .isNotEmpty &&
                                                          truckMac2Year!
                                                              .isNotEmpty &&
                                                          fitUnfit1!
                                                              .isNotEmpty &&
                                                          driver1Name!
                                                              .isNotEmpty &&
                                                          driver2Name!
                                                              .isNotEmpty &&
                                                          _sliderValue
                                                              .toString()
                                                              .isNotEmpty
                                                      // driver2Name != "Select" &&
                                                      //  padLock.isNotEmpty
                                                      ) {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      postAssionApi(data123);
                                                      upDateReadinessApi(data);
                                                      setState(() {
                                                        login = true;
                                                      });
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              'Invalid value...')),
                                                    );
                                                  }

                                                  print(data);

                                                  setState(() {
                                                    Future.delayed(
                                                        Duration(seconds: 3),
                                                        () {
                                                      setState(() {
                                                        login = false;
                                                      });
                                                    });
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    height: 60,
                                                    width: size.width,
                                                    child: Center(
                                                        child: login
                                                            ? SizedBox(
                                                                width: 15,
                                                                height: 15,
                                                                child:
                                                                    CircularProgressIndicator())
                                                            : Text(
                                                                'Update',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 7,
                                                            spreadRadius: 1),
                                                        BoxShadow(
                                                            color:
                                                                Colors.white12,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 7,
                                                            spreadRadius: 1),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  var data = {
                                                    "truckMacYear":
                                                        truckMacYear.toString(),
                                                    "fitUnfit":
                                                        fitUnfit1.toString(),
                                                    "driver1Id":
                                                        driver1Id.toString(),
                                                    "driver2Id":
                                                        driver2Id.toString(),
                                                    "driver1PhoneNo":
                                                        driver1PhoneNo
                                                            .toString(),
                                                    "driver2PhoneNo":
                                                        driver2PhoneNo
                                                            .toString(),
                                                    "truckNumber": truckNumber
                                                        .text
                                                        .toString(),
                                                    "cityDriverName":
                                                        driver3Id.toString(),
                                                    "cityTruck": cityTruck.text
                                                        .toString(),
                                                    "padLock":
                                                        padLock.toString(),
                                                    "fuel": _sliderValue!
                                                        .toDouble(),
                                                    "truckMac2Year":
                                                        truckMac2Year
                                                            .toString(),
                                                    "truckMacYear":
                                                        truckMacYear.toString(),
                                                    "id": "",
                                                    "status": 1,
                                                    "tripId":
                                                        tripId123.toString()
                                                  };

                                                  print(data);

                                                  if (truckMacYear!
                                                              .isNotEmpty &&
                                                          truckMac2Year!
                                                              .isNotEmpty &&
                                                          fitUnfit1!
                                                              .isNotEmpty &&
                                                          driver1Name!
                                                              .isNotEmpty &&
                                                          driver2Name!
                                                              .isNotEmpty &&
                                                          _sliderValue
                                                              .toString()
                                                              .isNotEmpty
                                                      //  padLock.isNotEmpty
                                                      ) {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      var statusText = "Active";
                                                      postAssionApiPost(
                                                          tripId123,
                                                          driver1Id,
                                                          driver2Id,
                                                          statusText,
                                                          id1);
                                                      postReadinessFormApi(
                                                          data);
                                                      setState(() {
                                                        login = true;
                                                        driver1Name = " ";
                                                        driver2Name = ' ';
                                                        truckMacYear = ' ';

                                                        fitUnfit = ' ';

                                                        fitUnfit1 = ' ';

                                                        driver1PhoneNo = ' ';

                                                        driver2PhoneNo = ' ';

                                                        driver1Id = ' ';

                                                        driver2Id = ' ';

                                                        id1 = '';

                                                        driver3Id = ' ';

                                                        driver3Name = ' ';

                                                        truckNumber.text = ' ';

                                                        cityTruck.text = ' ';

                                                        truckMac2Year = ' ';

                                                        padLock = ' ';
                                                      });
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              'Invalid value...')),
                                                    );
                                                  }

                                                  print(data);

                                                  Future.delayed(
                                                      Duration(seconds: 3), () {
                                                    setState(() {
                                                      login = false;
                                                    });
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    height: 60,
                                                    width: size.width,
                                                    child: Center(
                                                        child: login
                                                            ? SizedBox(
                                                                width: 15,
                                                                height: 15,
                                                                child:
                                                                    CircularProgressIndicator())
                                                            : Text(
                                                                'Submit',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 7,
                                                            spreadRadius: 1),
                                                        BoxShadow(
                                                            color:
                                                                Colors.white12,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 7,
                                                            spreadRadius: 1),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        // Container(
                                        //   width: 330,
                                        //   height: 55,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.circular(10)),
                                        //   child:
                                        //        ElevatedButton(
                                        //     style: ElevatedButton.styleFrom(
                                        //         shape: RoundedRectangleBorder(
                                        //             borderRadius:
                                        //             BorderRadius.circular(10))),
                                        //     onPressed: () {
                                        //
                                        //       var data = {
                                        //         "truckMacYear": truckMacYear.toString(),
                                        //         "fitUnfit": fitUnfit1.toString(),
                                        //         "driver1Id": driver1Id.toString(),
                                        //         "driver2Id": driver2Id.toString(),
                                        //         "driver1PhoneNo": driver1PhoneNo.toString(),
                                        //         "driver2PhoneNo": driver2PhoneNo.toString(),
                                        //         "truckNumber": truckNumber.text.toString(),
                                        //         "cityDriverName": driver3Id.toString(),
                                        //         "cityTruck": cityTruck.text.toString(),
                                        //         "padLock": padLock.toString(),
                                        //         "truckMac2Year": truckMac2Year.toString(),
                                        //         "truckMacYear": truckMacYear.toString(),
                                        //         "id": "",
                                        //         "status": 1,
                                        //         "tripId": tripId123.toString()
                                        //       };
                                        //
                                        //       print(data);
                                        //
                                        //       if (truckMacYear.isNotEmpty &&
                                        //           truckMac2Year.isNotEmpty &&
                                        //           fitUnfit1 != "Select" &&
                                        //           driver1Name != "Select" &&
                                        //           driver2Name != "Select" &&
                                        //           // driver2Name != "Select" &&
                                        //           padLock.isNotEmpty) {
                                        //         if (_formKey.currentState!.validate()) {
                                        //           var statusText = "Active";
                                        //           postAssionApiPost(tripId123, driver1Id,
                                        //               driver2Id, statusText, id1);
                                        //           postReadinessFormApi(data);
                                        //           setState(() {
                                        //             login = true;
                                        //           });
                                        //         }
                                        //       } else {
                                        //         ScaffoldMessenger.of(context).showSnackBar(
                                        //           const SnackBar(
                                        //               backgroundColor: Colors.red,
                                        //               content: Text('Invalid value...')),
                                        //         );
                                        //       }
                                        //
                                        //       print(data);
                                        //
                                        //       setState(() {
                                        //         Future.delayed(Duration(seconds: 3), () {
                                        //           setState(() {
                                        //             login = false;
                                        //           });
                                        //         });
                                        //       });
                                        //     },
                                        //     child: (login == false)
                                        //         ? Text(
                                        //       "Submit",
                                        //       style: TextStyle(
                                        //           fontSize: 25,
                                        //           fontWeight: FontWeight.bold),
                                        //     )
                                        //         : SizedBox(
                                        //         height: 15,
                                        //         width: 15,
                                        //         child: CircularProgressIndicator(
                                        //           color: Colors.white,
                                        //           strokeWidth: 2,
                                        //         )),
                                        //   )
                                        //   //     : ElevatedButton(
                                        //   //   style: ElevatedButton.styleFrom(
                                        //   //       shape: RoundedRectangleBorder(
                                        //   //           borderRadius:
                                        //   //           BorderRadius.circular(10))),
                                        //   //   onPressed: () {
                                        //   //
                                        //   //     var data = {
                                        //   //       "truckMacYear": truckMacYear.toString(),
                                        //   //       "fitUnfit": fitUnfit1.toString(),
                                        //   //       "driver1Id": driver1Id.toString(),
                                        //   //       "driver2Id": driver2Id.toString(),
                                        //   //       "driver1PhoneNo": driver1PhoneNo.toString(),
                                        //   //       "driver2PhoneNo": driver2PhoneNo.toString(),
                                        //   //       "truckNumber": truckNumber.text.toString(),
                                        //   //       "cityDriverName": driver3Id.toString(),
                                        //   //       "cityTruck": cityTruck.text.toString(),
                                        //   //       "padLock": padLock.toString(),
                                        //   //       "truckMac2Year": truckMac2Year.toString(),
                                        //   //       "truckMacYear": truckMacYear.toString(),
                                        //   //       "id": id1,
                                        //   //       "status": 1,
                                        //   //       "tripId": tripId123.toString()
                                        //   //     };
                                        //   //
                                        //   //     print(data);
                                        //   //
                                        //   //     if (truckMacYear.isNotEmpty &&
                                        //   //         truckMac2Year.isNotEmpty &&
                                        //   //         fitUnfit1 != "Select" &&
                                        //   //         driver1Name != "Select" &&
                                        //   //         driver2Name != "Select" &&
                                        //   //         // driver2Name != "Select" &&
                                        //   //         padLock.isNotEmpty) {
                                        //   //       if (_formKey.currentState!.validate()) {
                                        //   //         var statusText = "Active";
                                        //   //         postAssionApi(tripId123, driver1Id,
                                        //   //             driver2Id, statusText as TextEditingController, id1);
                                        //   //         upDateReadinessApi(data);
                                        //   //         setState(() {
                                        //   //           login = true;
                                        //   //         });
                                        //   //       }
                                        //   //     } else {
                                        //   //       ScaffoldMessenger.of(context).showSnackBar(
                                        //   //         const SnackBar(
                                        //   //             backgroundColor: Colors.red,
                                        //   //             content: Text('Invalid value...')),
                                        //   //       );
                                        //   //     }
                                        //   //
                                        //   //     print(data);
                                        //   //
                                        //   //     setState(() {
                                        //   //       Future.delayed(Duration(seconds: 3), () {
                                        //   //         setState(() {
                                        //   //           login = false;
                                        //   //         });
                                        //   //       });
                                        //   //     });
                                        //   //   },
                                        //   //   child: (login == false)
                                        //   //       ? Text(
                                        //   //     "Update",
                                        //   //     style: TextStyle(
                                        //   //         fontSize: 25,
                                        //   //         fontWeight: FontWeight.bold),
                                        //   //   )
                                        //   //       : SizedBox(
                                        //   //       height: 15,
                                        //   //       width: 15,
                                        //   //       child: CircularProgressIndicator(
                                        //   //         color: Colors.white,
                                        //   //         strokeWidth: 2,
                                        //   //       )),
                                        //   // ),
                                        // ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        SizedBox(height: 200),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: driverDetailsTop,
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: Offset(5, 5),
                                    blurRadius: 3,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-5, -5),
                                    blurRadius: 3,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                      child: Text(
                                    " Driver Details",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Driver1 Name",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mobile No.",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "SaftyForm1",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Driver2 Name",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mobile NO.",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "SaftyForm2",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "SaftyFormStatus",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            ":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "$driverName1",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "$mobileNo1",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "$saftyForm1",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "$driverName2",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "$mobileNo2",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "$saftyForm2",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            (saftyFormStatus == '1')
                                                ? "No"
                                                : "Yes",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 200, top: 40),
                                    child: SizedBox(
                                        width: 100,
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                            onPressed: () {
                                              setState(() {
                                                driverDetailsTop = 800;
                                              });
                                            },
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ))),
                                  )
                                ],
                              ),
                            ),
                            width: size.width,
                            height: 450,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  var DataReadinessApi;

  Future<ReadinessAddValueModels> postReadinessFormApi(
      Map<String, Object> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .post(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //       backgroundColor: Colors.green, content: Text('Success...')),
      // );
      return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));
    } else {
      throw Exception("Failed to load ReadinessAddValueModels");
    }
  }

  Future<ReaninesssDispatcherPage> upDateReadinessApi123(String tripId) async {
    final res = await http
        .get(Uri.parse("$baseUrl/ReadinessFormAPI/?tripId=$tripId"), headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      return ReaninesssDispatcherPage.fromJson(jsonDecode(res.body.toString()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Error')),
      );
      throw Exception("Failed to load ReadinessAddValueModels");
    }
  }

  var AcceptedApi;

  Future<void> postNewTripData(id123) async {
    try {
      final res = await http.post(
          Uri.parse(
              "https://canadalogistic.metalsart.in/dispatcherApp/AcceptAPI/"),
          body: {
            "tripId": id123.toString()
          },
          headers: {
            "Authorization": token,
          });
      if (res.statusCode == 200) {
        controller.animateTo(1);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                ' Trip Accepted',
              )),
        );
        return AcceptedApi = (jsonDecode(res.body.toString())) ?? "";
      } else {
        throw Exception("Failed to load data123");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> postAssionApi(Map<String, dynamic> data123) async {
    var datab1 = jsonEncode(data123);
    print(datab1);
    var datab2 = jsonEncode(datab1);
    final res = await http.post(
      Uri.parse(
          "https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/"),
      body: datab2,
      headers: {
        "Content-type": "application/json;charset=UTF-8",
        "Authorization": token,
      },
    );
    if (res.statusCode == 200) {
      var iid1 = 0;
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ReadinessForm2(
      //               driver1Name: '',
      //               driver2Name: '',
      //               id: '',
      //               tripId: '',
      //               driverID: '',
      //               truckMacYear: '',
      //               fitUnfit: '',
      //               driver1Id: '',
      //               driver1PhoneNo: '',
      //               driver2PhoneNo: '',
      //               truckNumber: '',
      //               cityDriverName: '',
      //               cityTruck: '',
      //               padLock: '',
      //               truckMac2Year: '',
      //               driver2Id: '',
      //             )));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Trip Assign Successfully',
            )),
      );
      return data123 = jsonDecode(res.body.toString());
    } else {
      throw Exception("Failed to load data123");
    }
  }

  Future<void> _showMyDialog1(
      String name, String lastName, String mobileNo, String status) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            "Driver Detail",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
          content: Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Mob.NO",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          //       fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "SaftyForm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            //  fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 125,
                      child: Text(
                        "$name $lastName",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      "${mobileNo}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      (status == 1) ? "No" : "Yes",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                // SizedBox(width: 5,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog(String id) async {
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
                  "Do you really want  to reject this tender. ",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
                            rejectPostApi(id);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "REJECT NOW",
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

  var rejectResponse;

  Future<void> rejectPostApi(id) async {
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/rejectTenderAPI/"),
        body: {
          "tripId": id,
        },
        headers: {
          "Authorization": token
        });
    if (res.statusCode == 200) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Successfully Reject...')),
      );
      return rejectResponse = (jsonDecode(res.body.toString())) ?? " ";
    } else {
      throw Exception("Something Error");
    }
  }

  Future<void> postAssionApiPost(
      tripId1, String driver0id, String driver2, String statusText, id1) async {
    var data = {
      "tripId": tripId1.toString(),
      "driver1Id": driver0id.toString(),
      "driver2Id": driver2.toString(),
      "statusText": statusText.toString(),
      "id": '',
    };
    var data12 = jsonEncode(data);

    print(data12);
    final res = await http.post(
      Uri.parse(
          "https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/"),
      body: data12,
      headers: {
        "Content-type": "application/json;charset=UTF-8",
        "Authorization": token,
      },
    );
    if (res.statusCode == 200) {
      controller.animateTo(2);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Tender Assign Dispatched Successfully',
            )),
      );
      return data123 = jsonDecode(res.body.toString());
    } else {
      throw Exception("Failed to load data123");
    }
  }

  Future<ReadinessAddValueModels> upDateReadinessApi(
      Map<String, dynamic> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .patch(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomBarPage()));

      controller.animateTo(2);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Successfully Update...')),
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ReadinessPage()));
      return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Error')),
      );
      throw Exception("Failed to load ReadinessAddValueModels");
    }
  }

  var redinessData;

  Future<void> getReadinessData(tripId123) async {
    final res = await http.get(
        Uri.parse(
            'https://canadalogistic.metalsart.in/dispatcherApp/ReadinessFormAPI/?tripId=$tripId123'),
        headers: {
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      redinessData = jsonDecode(res.body.toString());
      setState(() {
        driver1Name =
            "${redinessData['result']['Result'][0]['driver1Name'].toString() ?? ""}";
        driver2Name =
            "${redinessData['result']['Result'][0]['driver2Name'].toString() ?? ""}";
        truckMacYear =
            "${redinessData['result']['Result'][0]['truckMacYear'].toString() ?? ""}";
        fitUnfit =
            "${redinessData['result']['Result'][0]['fitUnfit'].toString() ?? ""}";
        fitUnfit1 =
            "${redinessData['result']['Result'][0]['fitUnfit'].toString() ?? ""}";
        driver1PhoneNo =
            "${redinessData['result']['Result'][0]['driver1PhoneNo'].toString() ?? ""}";
        driver2PhoneNo =
            "${redinessData['result']['Result'][0]['driver2PhoneNo'].toString() ?? ""}";

        driver1Id =
            "${redinessData['result']['Result'][0]['driver1Id'].toString() ?? ""}";
        driver2Id =
            "${redinessData['result']['Result'][0]['driver2Id'].toString() ?? ""}";
        id1 = "${redinessData['result']['Result'][0]['id'].toString() ?? ""}";

        driver3Id =
            "${redinessData['result']['Result'][0]['cityDriverName'].toString() ?? ""}";

        driver3Name =
            "${redinessData['result']['Result'][0]['cityDrivername'].toString() ?? ""}";

        truckNumber.text =
            "${redinessData['result']['Result'][0]['truckNumber'].toString() ?? ""}";
        cityTruck.text =
            "${redinessData['result']['Result'][0]['cityTruck'].toString() ?? ""}";
        truckMac2Year =
            "${redinessData['result']['Result'][0]['truckMac2Year'].toString() ?? ""}";
        _sliderValue = double.parse(
            "${redinessData['result']['Result'][0]['fuel'].toString() ?? ""}");
      });
    } else {
      print("Something Error");
    }
  }

  Future<void> getDriverListApiFunction2() async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/DriverList1API/"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });

    if (res.statusCode == 200) {
      setState(() {
        driverListData = (jsonDecode(res.body.toString())) ?? "";
      });

      const SnackBar(
          backgroundColor: Colors.green, content: Text('Success...'));

      print(driverListData);
    } else {
      throw Exception("Something Error");
    }
  }
}

var iid;
var id123;
