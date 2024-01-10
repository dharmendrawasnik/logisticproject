import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../Assign Load  To Driver Details/Assign Load to Driver Details.dart';
import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';
import '../ModelsPage/AssionLoadModels.dart';
import '../ModelsPage/VehicleDetailsModels.dart';
import '../Vehicle Details/Vehicle Details.dart';

class AssignLoadToDriverPage extends StatefulWidget {
  const AssignLoadToDriverPage({Key? key}) : super(key: key);

  @override
  State<AssignLoadToDriverPage> createState() => _AssignLoadToDriverPageState();
}

class _AssignLoadToDriverPageState extends State<AssignLoadToDriverPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController driverFirstName = TextEditingController();
  final TextEditingController driverLastName = TextEditingController();
  final TextEditingController driverEmail = TextEditingController();
  final TextEditingController driverLicenseNo = TextEditingController();
  final TextEditingController driverMobileNo = TextEditingController();

  var id = 1;
  var id2 = 0;
  double loadDetail = 1200;
  double deleteDialog = 1200;
  double addEditDialog = 1200;

  var driverName1;
  var driverName2;
  var email;
  var licenseNo;
  var mobileNo;
  var destination;
  var origin;
  var length;
  var deadHead;
  var pickUpDateTime;
  var price;
  var size;
  var weight;
  var status;
  var statusText;
  String? id1="";
  var lastName;
  var tripId;
  var customerName;
  var driver1Id;
  var driver2Id;
  var data1;
  var driver1PhoneNo;
  var driver1Name;

  @override
  void initState() {
    getAssignLoadToDriverApi(id);
    getAssignLoadToDriverApi1(id2);
    getDriverListApiFunction();
    super.initState();
  }

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

  Future<void> _refresh() async {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                title: Text("Assign Load To Driver"),
                bottom: PreferredSize(
                  preferredSize: Size(300, 50),
                  child: ColoredBox(
                    color: Colors.indigo,
                    child: TabBar(
                      indicatorColor: Colors.red,
                      labelColor: Colors.red,
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.white,
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
                      RefreshIndicator(
                        triggerMode: RefreshIndicatorTriggerMode.anywhere,
                        edgeOffset: 20,
                        displacement: 20,
                        strokeWidth: 2,
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        onRefresh: _refresh,
                        child: FutureBuilder(
                         future: getAssignLoadToDriverApi(id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return (assignLoadData.length > 0)
                                  ? SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                            itemCount: assignLoadData.length,
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey.shade500,
                                                            offset:
                                                                Offset(5, 5),
                                                            blurRadius: 15,
                                                            spreadRadius: 1),
                                                        BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 15,
                                                            spreadRadius: 1),
                                                      ]),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 250,
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
                                                        width: 250,
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                width: 170,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${assignLoadData[index]['driver1']['firstName'].toString()}${' '}${assignLoadData[index]['driver1']['lastName'].toString()}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                    Text(
                                                                        "${assignLoadData[index]['driver1']['licenseNo'].toString()}${assignLoadData[index]['driver1']['mobileNo'].toString()}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            fontSize: 18)),
                                                                    Text(
                                                                        "${assignLoadData[index]['driver1']['email'].toString()}${assignLoadData[index]['driver1']['mobileNo'].toString()}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            fontSize: 18)),
                                                                    Text(
                                                                        "${assignLoadData[index]['driver1']['countryCode'].toString()}${assignLoadData[index]['driver1']['mobileNo'].toString()}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            fontSize: 18)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: SizedBox(
                                                                width: 85,
                                                                height: 35,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .indigo,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(25)),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      id = 1;
                                                                      loadDetail =
                                                                          0;

                                                                      driverName1 =
                                                                          '${assignLoadData[index]['driver1']['firstName'].toString()}${' '}${assignLoadData[index]['driver1']['lastName'].toString()}';
                                                                      email =
                                                                          '${assignLoadData[index]['driver1']['email'].toString()}';
                                                                      licenseNo =
                                                                          '${assignLoadData[index]['driver1']['licenseNo'].toString()}';
                                                                      mobileNo =
                                                                          '${assignLoadData[index]['driver1']['mobileNo'].toString()}';
                                                                      destination =
                                                                          '';
                                                                      origin =
                                                                          '';
                                                                      length =
                                                                          '';
                                                                      deadHead =
                                                                          '';
                                                                      pickUpDateTime =
                                                                          '';
                                                                      price =
                                                                          '';
                                                                      size;
                                                                      weight =
                                                                          '';
                                                                      status =
                                                                          '${assignLoadData[index]['status'].toString()}';


                                                                      statusText =
                                                                      '${assignLoadData[index]['statusText'].toString()}';


                                                                      id1 =
                                                                          '${assignLoadData[index]['id'].toString()}';
                                                                      lastName =
                                                                          '${assignLoadData[index]['driver1']['lastName'].toString()}';
                                                                      tripId =
                                                                          '${assignLoadData[index]['trip']['tripStatus'].toString()}';
                                                                      customerName =
                                                                          '${assignLoadData[index]['trip']['customerName'].toString()}';
                                                                      driver1Id =
                                                                          '${assignLoadData[index]['driver1Id'].toString()}';
                                                                      driver2Id =
                                                                          '${assignLoadData[index]['driver2Id'].toString()}';
                                                                      driverName2 =
                                                                          '${assignLoadData[index]['driver2']['firstName'].toString()}${' '}${assignLoadData[index]['driver2']['lastName'].toString()}';
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                      "View"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 300),
                                            child: Text(""),
                                          )
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
                        child: FutureBuilder(
                         // future: getAssignLoadToDriverApi1(id2),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return (assignLoadData1.length > 0)
                                  ? SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                            itemCount: assignLoadData1.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey.shade500,
                                                            offset:
                                                                Offset(5, 5),
                                                            blurRadius: 15,
                                                            spreadRadius: 1),
                                                        BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 15,
                                                            spreadRadius: 1),
                                                      ]
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 250,
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
                                                        width: 250,
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
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                width: 170,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      "${assignLoadData1[index]['driver1']['firstName'].toString()}${' '}${assignLoadData1[index]['driver1']['lastName'].toString()}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                    Text(
                                                                      "${assignLoadData1[index]['driver1']['licenseNo'].toString()}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                    Text(
                                                                      "${assignLoadData1[index]['driver1']['email'].toString()}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                    Text(
                                                                        "${assignLoadData1[index]['driver1']['countryCode'].toString()}${assignLoadData1[index]['driver1']['mobileNo'].toString()}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 18)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              child: SizedBox(
                                                                width: 85,
                                                                height: 35,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .indigo,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(25)),
                                                                  ),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              id = 1;
                                                                              loadDetail =
                                                                              0;

                                                                              driverName1 =
                                                                              '${assignLoadData1[index]['driver1']['firstName'].toString()}${' '}${assignLoadData1[index]['driver1']['lastName'].toString()}';
                                                                              email =
                                                                              '${assignLoadData1[index]['driver1']['email'].toString()}';
                                                                              licenseNo =
                                                                              '${assignLoadData1[index]['driver1']['licenseNo'].toString()}';
                                                                              mobileNo =
                                                                              '${assignLoadData1[index]['driver1']['mobileNo'].toString()}';
                                                                              destination =
                                                                              '';
                                                                              origin =
                                                                              '';
                                                                              length =
                                                                              '';
                                                                              deadHead =
                                                                              '';
                                                                              pickUpDateTime =
                                                                              '';
                                                                              price =
                                                                              '';
                                                                              size;
                                                                              weight =
                                                                              '';
                                                                              status =
                                                                              '${assignLoadData1[index]['status'].toString()}';


                                                                              statusText =
                                                                              '${assignLoadData1[index]['statusText'].toString()}';
                                                                              id1 =
                                                                              '${assignLoadData1[index]['id'].toString()}';
                                                                              lastName =
                                                                              '${assignLoadData1[index]['driver1']['lastName'].toString()}';
                                                                              tripId =
                                                                              '${assignLoadData1[index]['trip']['tripStatus'].toString()}';
                                                                              customerName =
                                                                              '${assignLoadData1[index]['trip']['customerName'].toString()}';
                                                                              driver1Id =
                                                                              '${assignLoadData1[index]['driver1Id'].toString()}';
                                                                              driver2Id =
                                                                              '${assignLoadData1[index]['driver2Id'].toString()}';
                                                                              driverName2 =
                                                                              '${assignLoadData1[index]['driver2']['firstName'].toString()}${' '}${assignLoadData1[index]['driver2']['lastName'].toString()}';
                                                                            });
                                                                      },
                                                                  child: Text(
                                                                      "View"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
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
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  AnimatedPositioned(
                    top: loadDetail,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            loadDetail = 1200;
                                          });
                                        },
                                        icon: Column(
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'Assign Load Details',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Driver Full Name",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Row(
                                      children: [
                                        Text('$driverName1',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                        // Text(lastName1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('$email',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("License Number",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("$licenseNo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mobile Number",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('$mobileNo',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Destination",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Origin",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Length",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Dead Head",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pickup Date Time",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Price",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Size",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Weight",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text("",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Status",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text('$statusText',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 55,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          deleteDialog = 120;

                                            loadDetail=1200;

                                        });
                                      },
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.delete_outline,
                                                color: Colors.red, size: 30),
                                            Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white10,
                                                  offset: Offset(5, 5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          addEditDialog = 0;
                                          loadDetail=1200;
                                        });
                                      },
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.edit_outlined,
                                                color: Colors.green, size: 30),
                                            Text(
                                              'Update',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white10,
                                                  offset: Offset(5, 5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(-5, -5),
                                                  blurRadius: 15,
                                                  spreadRadius: 1),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     SizedBox(
                                //       width: 15,
                                //     ),
                                //
                                //
                                //
                                //
                                //
                                //
                                //     SizedBox(
                                //       height: 40,
                                //       width: 130,
                                //       child: ElevatedButton(
                                //         style: ElevatedButton.styleFrom(
                                //             primary: Colors.red,
                                //             shape: RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10))),
                                //         onPressed: () {
                                //           /// _showMyDialog(id1);
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Icon(Icons.delete_outlined,
                                //                 color: Colors.white),
                                //             Text(
                                //               "DELETE",
                                //               style: TextStyle(
                                //                   color: Colors.white,
                                //                   fontSize: 18,
                                //                   fontWeight: FontWeight.bold),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       height: 40,
                                //       width: 130,
                                //       child: ElevatedButton(
                                //         style: ElevatedButton.styleFrom(
                                //             primary: Colors.black,
                                //             shape: RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10))),
                                //         onPressed: () {
                                //           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AssingDetailsUpdatePage(id: '$id1', tripId: '$tripId1', customerName: '${customerName1}', firstName: '$driverName1', lastName: '$lastName1', driverId: '$driverId1',)));
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Icon(Icons.edit_outlined,
                                //                 color: Colors.white),
                                //             Text(
                                //               "UPDATE",
                                //               style: TextStyle(
                                //                   color: Colors.white,
                                //                   fontSize: 18,
                                //                   fontWeight: FontWeight.bold),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 15,
                                //     ),
                                //   ],
                                // ),
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
                    top: addEditDialog,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white10,
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(-5, -5),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            addEditDialog = 1200;
                                             driver1Id='';
                                             driver2Id='';
                                             tripId='';
                                             status='';
                                             id1='';

                                          });
                                        },
                                        icon: Icon(
                                            Icons.arrow_back_ios_new_outlined)),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Text(
                                      'Edit Assign Details',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Driver1	",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),

                                    FutureBuilder(
                                      builder: (context, snapshot){
                                        if(snapshot.connectionState==ConnectionState.waiting){
                                          return Text('');
                                        }else{
                                          return  DropdownButtonFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15))),
                                            hint: Text(driverName1 != null
                                                ? '$driverName1'
                                                : 'Select'),
                                            borderRadius: BorderRadius.circular(15),
                                            items: [
                                              for (var i = 0;
                                              i < data1['result'].length;
                                              i++)
                                                DropdownMenuItem(
                                                  child: Text(
                                                      "${(data1['result'][i]['firstName'].toString()) ?? ""}${" "}${(data1['result'][i]['lastName'].toString()) ?? ""}"),
                                                  value:
                                                  "${(data1['result'][i]['id'].toString()) ?? ""}",
                                                ),
                                            ],
                                            onChanged: (String? value) {
                                              driver1Id = value.toString();

                                              //    getDriverListApiFunctionOneDriverDetails(driver1Id);
                                            },
                                          );
                                        }
                                      },

                                    ),
                                    //     }
                                    //   },
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Driver2	",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),

                                    FutureBuilder(
                                      builder: (context, snapshot){
                                        if(snapshot.connectionState==ConnectionState.waiting){
                                          return Text('');
                                        }else{
                                          return DropdownButtonFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15))),
                                            hint: Text(driverName2 != null
                                                ? '$driverName2'
                                                : 'Select'),
                                            borderRadius: BorderRadius.circular(15),
                                            items: [
                                              for (var i = 0;
                                              i < data1['result'].length;
                                              i++)
                                                DropdownMenuItem(
                                                  child: Text(
                                                      "${(data1['result'][i]['firstName'].toString()) ?? ""}${" "}${(data1['result'][i]['lastName'].toString()) ?? ""}"),
                                                  value:
                                                  "${(data1['result'][i]['id'].toString()) ?? ""}",
                                                ),
                                            ],
                                            onChanged: (String? value) {
                                              driver2Id = value.toString();

                                              //    getDriverListApiFunctionOneDriverDetails(driver1Id);
                                            },
                                          );
                                        }
                                      },

                                    ),
                                    //     }
                                    //   },
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TripId",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    // hint: Text(customerName!=null?'$customerName':'Select'),tripId
                                    Container(
                                      width: size.width,
                                      child: Center(
                                          child: Row(
                                        children: [
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(customerName != null
                                              ? '$customerName'
                                              : "TripId enter here"),
                                        ],
                                      )),
                                      height: 60,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    )
                                    //     }
                                    //   },
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    DropdownButtonFormField(
                                        hint: Text(statusText != null
                                            ? '$statusText'
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
                                          status = value.toString();

                                          if(value.toString()=='1'){
                                            status='1';
                                            statusText="Active";
                                          }

                                          if(value.toString()=='0'){
                                            status='0';
                                            statusText="Inactive";
                                          }

                                        })
                                  ],
                                ),
                                SizedBox(
                                  height: 65,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        loadDetail=1200;
                                      });
                                      var data = {
                                        "driver1Id": driver1Id.toString(),
                                        "driver2Id": driver2Id.toString(),
                                        'tripId': tripId.toString(),
                                        'status': status,
                                        'id':id1.toString()
                                      };

                                     // upDateAssignLoadApi(data);
                                      print('Assign $data');
                                    },
                                    child: Container(
                                      width: size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white10,
                                                offset: Offset(5, 5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-5, -5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Center(
                                          child: Text(
                                        'Update',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 225,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    left: 30,
                    right: 30,
                    top: deleteDialog,
                    duration: Duration(milliseconds: 1000),
                    child: Center(
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.warning,
                                color: Colors.red,
                                size: 50,
                              ),
                              Text(
                                "Alert Message",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                'are you sure want to delete this record ?',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        deleteDialog = 1200;
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        'Cancel',
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
                                                color: Colors.white10,
                                                offset: Offset(5, 5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-5, -5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        deleteAssignDetailsApiFunction(id1!);
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text('Delete',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                      ),
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white10,
                                                offset: Offset(5, 5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-5, -5),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white10,
                                  offset: Offset(5, 5),
                                  blurRadius: 15,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-5, -5),
                                  blurRadius: 15,
                                  spreadRadius: 1),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
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

  Future<void> upDateAssignLoadApi(Map<String, dynamic> data) async {

    var boddy = jsonEncode(data);
    final res = await http.patch(Uri.parse("$baseUrl/AssignLoadToDriverAPI/"),
        body: boddy,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      setState(() {
        addEditDialog=800;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('AssignLoad Details Update  Successfully!')),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AssignLoadToDriverPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Something error!')),
      );
    }
  }



  Future<void> deleteAssignDetailsApiFunction(id1) async {
    final res = await http.delete(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/?id=$id1"),

        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Assign Details Delete Successfully')),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AssignLoadToDriverPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Something Wrong')),
      );
    }
  }
}
