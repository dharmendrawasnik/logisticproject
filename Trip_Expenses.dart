import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bridge_point_logistics/DrawerPage/DrawerPage.dart';
import 'package:bridge_point_logistics/ModelsPage/TripExpansesModels.dart';
import 'package:bridge_point_logistics/Trips_Expenses_Details/Trips_Expenses_Details.dart';
import 'package:flutter/material.dart';

import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../DrawClip/DrawClip.dart';
import '../ModelsPage/TripExpansesModels1.dart';

class TripExpensesPage extends StatefulWidget {
  const TripExpensesPage({Key? key}) : super(key: key);

  @override
  State<TripExpensesPage> createState() => _TripExpensesPageState();
}

class _TripExpensesPageState extends State<TripExpensesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController driverCharge = TextEditingController();
  final TextEditingController foodCharge = TextEditingController();
  final TextEditingController fuelCharge = TextEditingController();
  final TextEditingController otherCharge = TextEditingController();
  var tripId;
  String? tripDetails = "";
  String? status = "";
  var status2;
  var statusText;
  var statusText2;
  var id12;
  var name1 = "Add New Trip Expenses";
  var seletct = "SelectTripId";

  bool saveUpdate = false;
  double deleteDialogBoxContainer = 1200;
  var fuelCharge1;
  var foodCharge1;
  var driverCharge1;
  var otherCharge1;
  var totalCount1;
  String? tripId1 = "";
  String? statusText1 = "";
  var dateTime1;
  String? id1 = "";
  double tripExpencesTopDialog = 1200;
  double tripExpencesTopForoDialog = 1200;
  @override
  void initState() {
    getTripExpansesApi();
    getTripExpansesApi1();
    getTripsIdApiFunction123();
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
                title: Text("Trip Expenses"),
                actions: [
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => UpdateTripExPenseFormPage(
                        //               driverCharges: '',
                        //               foodCharge: '',
                        //               fuelCharge: '',
                        //               otherCharge: '',
                        //               tripId: '',
                        //               status: '',
                        //               id: '',
                        //               name: '',
                        //             )));
                        setState(() {
                          saveUpdate = false;
                          tripExpencesTopDialog = 1200;
                          tripExpencesTopForoDialog = 0;
                          fuelCharge.clear();
                          foodCharge.clear();
                          driverCharge.clear();
                          otherCharge.clear();
                          tripDetails = "";
                        });
                      },
                      child: Text(
                        "Add New",
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
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(fontSize: 13),
                      tabs: [
                        Tab(
                          text: "ACTIVE",
                        ),
                        Tab(
                          text: "INACTIVE",
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: Stack(
                children: [
                  TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          edgeOffset: 20,
                          displacement: 20,
                          strokeWidth: 2,
                          color: Colors.blue,
                          backgroundColor: Colors.white,
                          onRefresh: _refresh,
                          child: FutureBuilder<TripExpansesModels>(
                            future: getTripExpansesApi(),
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
                                                shrinkWrap: true,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Container(
                                                      height: 150,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade500,
                                                                offset: Offset(
                                                                    5, 5),
                                                                blurRadius: 15,
                                                                spreadRadius:
                                                                    1),
                                                            BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -5, -5),
                                                                blurRadius: 15,
                                                                spreadRadius:
                                                                    1),
                                                          ]),
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width: 230,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .indigo,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            200))),
                                                          ),
                                                          Container(
                                                            width: 230,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .indigo,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            15),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            200))),
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 200,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      top: 8,
                                                                      bottom:
                                                                          8),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Food Charge",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                      Text(
                                                                        "${snapshot.data!.result!.result![index].foodCharges.toString()}",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                      Text(
                                                                        "Fuel Charge",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                      Text(
                                                                        "${snapshot.data!.result!.result![index].fuelCharges.toString()}",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 100,
                                                                  height: 35,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary:
                                                                            Colors
                                                                                .indigo,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(25))),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        tripExpencesTopDialog =
                                                                            0;
                                                                        tripExpencesTopDialog =
                                                                            0;
                                                                        print(snapshot
                                                                            .data!
                                                                            .result!
                                                                            .result![index]
                                                                            .otherCharges
                                                                            .toString());

                                                                        fuelCharge1 =
                                                                            '${snapshot.data!.result!.result![index].fuelCharges.toString()}';
                                                                        foodCharge1 =
                                                                            '${snapshot.data!.result!.result![index].foodCharges.toString()}';
                                                                        tripDetails =
                                                                            '${snapshot.data!.result!.result![index].tripDetails.toString()}';

                                                                        driverCharge1 =
                                                                            '${snapshot.data!.result!.result![index].driverCharges.toString()}';
                                                                        otherCharge1 =
                                                                            '${snapshot.data!.result!.result![index].otherCharges.toString()}';
                                                                        totalCount1 =
                                                                            '${snapshot.data!.result!.result![index].total.toString()}';
                                                                        tripId1 =
                                                                            '${snapshot.data!.result!.result![index].tripId.toString()}';
                                                                        tripDetails =
                                                                            '${snapshot.data!.result!.result![index].tripDetails.toString()}';

                                                                        statusText1 =
                                                                            '${snapshot.data!.result!.result![index].statusText.toString()}';
                                                                        dateTime1 =
                                                                            '${snapshot.data!.result!.result![index].createdOn.toString()}';
                                                                        id1 =
                                                                            '${snapshot.data!.result!.result![index].id.toString()}';
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                        "View"),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                      ),
                      RefreshIndicator(
                        triggerMode: RefreshIndicatorTriggerMode.anywhere,
                        edgeOffset: 20,
                        displacement: 20,
                        strokeWidth: 2,
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        onRefresh: _refresh,
                        child: FutureBuilder<TripExpansesModels1>(
                          future: getTripExpansesApi1(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return (snapshot.data!.result!.result!.length > 0)
                                  ? SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                              itemCount: snapshot
                                                  .data!.result!.result!.length,
                                              physics: ClampingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .shade500,
                                                              offset:
                                                                  Offset(5, 5),
                                                              blurRadius: 15,
                                                              spreadRadius: 1),
                                                          BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset: Offset(
                                                                  -5, -5),
                                                              blurRadius: 15,
                                                              spreadRadius: 1),
                                                        ]),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width: 230,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.indigo,
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          200))),
                                                        ),
                                                        Container(
                                                          width: 230,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.indigo,
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          200))),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 200,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10,
                                                                        top: 10,
                                                                        bottom:
                                                                            10),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Food Charge",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow:
                                                                              TextOverflow.ellipsis),
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .result!
                                                                          .result![
                                                                              index]
                                                                          .foodCharges
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow:
                                                                              TextOverflow.ellipsis),
                                                                    ),
                                                                    Text(
                                                                      "Fuel Charge",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow:
                                                                              TextOverflow.ellipsis),
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .result!
                                                                          .result![
                                                                              index]
                                                                          .fuelCharges
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow:
                                                                              TextOverflow.ellipsis),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                width: 100,
                                                                height: 35,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .indigo,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25))),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      tripExpencesTopDialog =
                                                                          0;
                                                                      print(snapshot
                                                                          .data!
                                                                          .result!
                                                                          .result![
                                                                              index]
                                                                          .otherCharges
                                                                          .toString());
                                                                      tripDetails =
                                                                          '${snapshot.data!.result!.result![index].tripDetails.toString()}';
                                                                      fuelCharge1 =
                                                                          '${snapshot.data!.result!.result![index].fuelCharges.toString()}';
                                                                      foodCharge1 =
                                                                          '${snapshot.data!.result!.result![index].foodCharges.toString()}';
                                                                      driverCharge1 =
                                                                          '${snapshot.data!.result!.result![index].driverCharges.toString()}';
                                                                      otherCharge1 =
                                                                          '${snapshot.data!.result!.result![index].otherCharges.toString()}';
                                                                      totalCount1 =
                                                                          '${snapshot.data!.result!.result![index].total.toString()}';
                                                                      tripId1 =
                                                                          '${snapshot.data!.result!.result![index].tripId.toString()}';
                                                                      statusText1 =
                                                                          '${snapshot.data!.result!.result![index].statusText.toString()}';
                                                                      dateTime1 =
                                                                          '${snapshot.data!.result!.result![index].createdOn.toString()}';
                                                                      id1 =
                                                                          '${snapshot.data!.result!.result![index].id.toString()}';
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                      "View"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 300),
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
                    top: tripExpencesTopDialog,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, -5),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          tripExpencesTopDialog = 1200;
                                        });
                                      },
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_outlined)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'TripExpenses Details',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Fuel Charges",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$fuelCharge1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Food Charges",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$foodCharge1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Driver Charges",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$driverCharge1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Other Charges",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$otherCharge1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Count",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$totalCount1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$statusText1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date & Time",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 150,
                                      child: Text(
                                        "$dateTime1",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          deleteDialogBoxContainer = 120;
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade500,
                                                  offset: Offset(5, 5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.white,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                            ]),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          saveUpdate = true;
                                          tripExpencesTopForoDialog = 0;

                                          fuelCharge.text = fuelCharge1;
                                          foodCharge.text = foodCharge1;
                                          driverCharge.text = driverCharge1;
                                          otherCharge.text = otherCharge1;
                                          // var totalCount1;
                                          tripId = tripId1;
                                          // var statusText1;
                                          // var dateTime1;
                                          // var id1;
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Update',
                                            style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade500,
                                                  offset: Offset(5, 5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.white,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
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
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 1000),
                    top: tripExpencesTopForoDialog,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, -5),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            tripExpencesTopForoDialog = 1200;
                                            fuelCharge.clear();
                                            foodCharge.clear();
                                            driverCharge.clear();
                                            otherCharge.clear();
                                            tripId1 = '';
                                            status = '';
                                            tripDetails = "";
                                            tripDetails = '';
                                            statusText1 = '';
                                            id1 = '';
                                          });
                                        },
                                        icon: Icon(
                                            Icons.arrow_back_ios_new_outlined)),
                                    Text(
                                      'TripExpences Form',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),

                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Driver Charges",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: driverCharge,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter driver charge';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "driver charge here",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Food Charges",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: foodCharge,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter food charge';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "food charge here",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fuel Charges",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: fuelCharge,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter fuel charge';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: " fuel charge here",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Other Charges",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: otherCharge,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter other charge';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: " other charge here",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                DropdownButtonFormField(
                                    hint: Text(statusText1 != null
                                        ? "$statusText1"
                                        : 'Select'),
                                    borderRadius: BorderRadius.circular(15),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Active'),
                                        value: '1',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Inactive'),
                                        value: '0',
                                      )
                                    ],
                                    onChanged: (value) {
                                      if (value.toString() == '1') {
                                        statusText1 = 'Active';
                                        status = '1';
                                      }
                                      if (value.toString() == '0') {
                                        statusText1 = 'Inactive';
                                        status = '0';
                                      }
                                    }),

                                SizedBox(
                                  height: 15,
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Trips",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                FutureBuilder(
                                  ////   future: getTripsIdApiFunction123(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return DropdownButtonFormField(
                                        borderRadius: BorderRadius.circular(15),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        hint: Text(tripDetails != null
                                            ? "$tripDetails"
                                            : 'Select'),
                                        items: [
                                          for (var i = 0;
                                              i < tripGetData['result'].length;
                                              i++)
                                            DropdownMenuItem(
                                              child: Text(
                                                  "${tripGetData['result'][i]['detail'].toString()}"),
                                              value:
                                                  "${tripGetData['result'][i]['id'].toString()}",
                                            )
                                        ],
                                        onChanged: (value) {
                                          tripId1 = value.toString();

                                          for (var i = 0;
                                              i < tripGetData['result'].length;
                                              i++) {
                                            if (tripGetData['result'][i]
                                                    ['id'] ==
                                                value) {
                                              tripDetails =
                                                  tripGetData['result'][i]
                                                          ['detail']
                                                      .toString();
                                            }
                                          }
                                          print(tripDetails);
                                        },
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                //  Text("Trips",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),SizedBox(height: 5,),
                                saveUpdate
                                    ? InkWell(
                                        onTap: () {
                                          var data = {
                                            "driverCharges":
                                                driverCharge.text.toString(),
                                            "foodCharges":
                                                foodCharge.text.toString(),
                                            "fuelCharges":
                                                fuelCharge.text.toString(),
                                            "otherCharges":
                                                otherCharge.text.toString(),
                                            "tripId": tripId1.toString(),
                                            "status": status.toString(),
                                            'tripDetails':
                                                tripDetails.toString(),
                                            "statusText":
                                                statusText1.toString(),
                                            "id": id1.toString(),
                                          };
                                          if (driverCharge.text.isNotEmpty &&
                                              fuelCharge.text.isNotEmpty &&
                                              otherCharge.text.isNotEmpty &&
                                              tripId1!.isNotEmpty &&
                                              status!.isNotEmpty &&
                                              tripDetails!.isNotEmpty &&
                                              statusText1!.isNotEmpty &&
                                              foodCharge.text.isNotEmpty) {
                                              upDateTripsExpensesApi(data);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content:
                                                      Text('Invalid Value')),
                                            );
                                          }
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          width: size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500,
                                                    offset: Offset(5, 5),
                                                    blurRadius: 15,
                                                    spreadRadius: 1),
                                                BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(-5, -5),
                                                    blurRadius: 15,
                                                    spreadRadius: 1),
                                              ]),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          var data = {
                                            "driverCharges":
                                                driverCharge.text.toString(),
                                            "foodCharges":
                                                foodCharge.text.toString(),
                                            "fuelCharges":
                                                fuelCharge.text.toString(),
                                            "otherCharges":
                                                otherCharge.text.toString(),
                                            "tripId": tripId1.toString(),
                                            "statusText": statusText.toString(),
                                            'tripDetails': seletct.toString(),
                                            "status": status.toString(),
                                            "id": '',
                                          };

                                          if (driverCharge.text.isNotEmpty &&
                                              fuelCharge.text.isNotEmpty &&
                                              otherCharge.text.isNotEmpty &&
                                              tripId1!.isNotEmpty &&
                                              status!.isNotEmpty &&
                                              tripDetails!.isNotEmpty &&
                                              statusText1!.isNotEmpty &&
                                              foodCharge.text.isNotEmpty) {
                                              postDateTripsExpensesApi1(data);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content:
                                                      Text('Invalid Value')),
                                            );
                                          }
                                        },
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                            'Submit',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          width: size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500,
                                                    offset: Offset(5, 5),
                                                    blurRadius: 15,
                                                    spreadRadius: 1),
                                                BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(-5, -5),
                                                    blurRadius: 15,
                                                    spreadRadius: 1),
                                              ]),
                                        ),
                                      ),

                                SizedBox(
                                  height: 250,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 1000),
                    top: deleteDialogBoxContainer,
                    left: 25,
                    right: 25,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, -5),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 48,
                            ),
                            Text(
                              'Alert Message',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              'Are you sure want to delete this record ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      deleteDialogBoxContainer = 1200;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlue),
                                    )),
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              offset: Offset(5, 5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-5, -5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                        ]),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {

                                      deleteTripsExpensesApi(id1);
                                      deleteDialogBoxContainer = 1200;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    )),
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              offset: Offset(5, 5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-5, -5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> deleteTripsExpensesApi(id1) async {

    final res = await http
        .delete(Uri.parse("$baseUrl/TripExpensesAPI/?id=$id1"),  headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('UpData Successfully')),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TripExpensesPage()));
      setState(() {
        tripExpencesTopDialog = 1200;
      });
    } else {
      throw Exception("Something Error");
    }
  }

  Future<void> upDateTripsExpensesApi(Map<String, String> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .patch(Uri.parse("$baseUrl/TripExpensesAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TripExpensesPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('UpData Successfully')),
      );
    } else {
      throw Exception("Something Error");
    }
  }

  Future<void> getTripsIdApiFunction123() async {
    final res = await http.get(Uri.parse("$baseUrl/TripListForReadnessAPI/"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token
        });
    if (res.statusCode == 200) {
      return tripGetData = jsonDecode(res.body.toString());
    } else {
      throw Exception("Failed to load tripGetData");
    }
  }

  //post api
  Future<void> postDateTripsExpensesApi1(Map<String, String> data) async {
    var data1 = jsonEncode(data);
    print(data1);

    final res = await http
        .post(Uri.parse("$baseUrl/TripExpensesAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TripExpensesPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('UpData Successfully')),
      );
    } else {
      throw Exception("Something Error");
    }
  }
}
