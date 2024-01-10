import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bridge_point_logistics/DrawerPage/DrawerPage.dart';
import 'package:bridge_point_logistics/ModelsPage/MaintenanceRecordeModels.dart';
import 'package:flutter/material.dart';

import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../DrawClip/DrawClip.dart';
import '../MaintananceDetailsPage/MaintananceDetailsPage.dart';
import '../Maintenance_Record_Form_Page/Maintenance_Record_Form_Page.dart';
import '../ModelsPage/MaintananceData.dart';
import '../ModelsPage/VehicleIDPAge.dart';
import '../Trip_Expenses_Add_Form_Page/Trip_Expenses_Add_Form_Page.dart';
import '../Trip_Expenses_Deatails_Page/Trip_Expenses_Details_Page.dart';
 String? vehicleText="";
class MaintenanceRecordPage extends StatefulWidget {
  const MaintenanceRecordPage({Key? key}) : super(key: key);

  @override
  State<MaintenanceRecordPage> createState() => _MaintenanceRecordPageState();
}

class _MaintenanceRecordPageState extends State<MaintenanceRecordPage> {
  final TextEditingController driverLicenseText = TextEditingController();
  final TextEditingController vehicleLicenseText = TextEditingController();
  final TextEditingController insuranceText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double maintenanceRecordDetailsPage = 1200;
  double newDataAndUpdateFormPage = 1200;
  double deleteDialogBoxPop = 1200;
  late String time1 = '';
  late String time2 = '';
  late String timer3 = '';
  DateTime _dateTime = DateTime.now();
  var driverLicense;
  String? driverMediclaim="";
  var insurance;
  var maintananceYear;
  var statusText;
  var vehicleLicense;
  var vehicleMantananceYear;
  String? status="";
  var dateTime;
  String? vehicleId="";
  String? id="";
  var driverMediclain;

  bool maaitUbtn = false;
  bool submit =false;
  String? statusText1=" ";
  @override
  void initState() {
    getMaintenanceRecordeApi();
    getMaintenanceRecordeApi1();
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
                title: Text("Maintenance Record"),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          maintenanceRecordDetailsPage = 1200;
                          newDataAndUpdateFormPage = 0;

                          vehicleLicenseText.clear();
                          submit=false;
                          driverLicenseText.clear();

                          driverMediclaim = '';
                          time1 = '';
                          maaitUbtn = false;
                          insuranceText.clear();
                          time2 = '';
                          statusText1 = '';
                          vehicleText = '';
                          status = '';
                          vehicleId = '';
                          vehicleText = '';
                        });

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MaintenanceRecordFormPage(driverLicense: '', vehiclesLicense: '', driverMediclaim: '', mantananceYear: '', insuranceYear: '', vehiclesMantananceYear: '', vehicleId: '', status: '', statusText: '',)));
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
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: RefreshIndicator(
                            triggerMode: RefreshIndicatorTriggerMode.anywhere,
                            edgeOffset: 20,
                            displacement: 20,
                            strokeWidth: 2,
                            color: Colors.blue,
                            backgroundColor: Colors.white,
                            onRefresh: _refresh,
                            child: FutureBuilder<MaintenanceRecordeModels>(
                              future: getMaintenanceRecordeApi(),
                              builder: (context, snapshort) {
                                if (snapshort.hasData) {
                                  return (snapshort
                                              .data!.result!.result!.length >
                                          0)
                                      ? SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  itemCount: snapshort.data!
                                                      .result!.result!.length,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Container(
                                                        height: 150,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                  offset:
                                                                      Offset(
                                                                          5, 5),
                                                                  blurRadius:
                                                                      15,
                                                                  spreadRadius:
                                                                      1),
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(-5,
                                                                          -5),
                                                                  blurRadius:
                                                                      15,
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
                                                                      topRight:
                                                                          Radius.circular(
                                                                              200))),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 210,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Text(
                                                                          "Insurance",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "${snapshort.data!.result!.result![index].insurance.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "Vihicle licence",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "${snapshort.data!.result!.result![index].vehicleLicense.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 100,
                                                                    height: 35,
                                                                    child:
                                                                        ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          primary: Colors
                                                                              .indigo,
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                              submit=false;
                                                                          maaitUbtn =
                                                                              true;
                                                                          maintenanceRecordDetailsPage =
                                                                              0;
                                                                          vehicleText =
                                                                              '${snapshort.data!.result!.result![index].vehicleText.toString()}';
                                                                          driverLicense =
                                                                              '${snapshort.data!.result!.result![index].driverLicense.toString()}';
                                                                          driverMediclaim =
                                                                              '${snapshort.data!.result!.result![index].driverMediclaim.toString()}';
                                                                          insurance =
                                                                              '${snapshort.data!.result!.result![index].insurance.toString()}';
                                                                          maintananceYear =
                                                                              '${snapshort.data!.result!.result![index].maintenanceYear.toString()}';
                                                                          vehicleLicense =
                                                                              '${snapshort.data!.result!.result![index].vehicleLicense.toString()}';
                                                                          status =
                                                                              '${snapshort.data!.result!.result![index].status.toString()}';
                                                                          dateTime =
                                                                              '${snapshort.data!.result!.result![index].createdOn.toString()}';
                                                                          id =
                                                                              '${snapshort.data!.result!.result![index].id.toString()}';
                                                                          vehicleMantananceYear =
                                                                              '${snapshort.data!.result!.result![index].vehicleMaintainance.toString()}';
                                                                          vehicleId =
                                                                              '${snapshort.data!.result!.result![index].vehicleId.toString()}';

                                                                              getVehicleIdApiFilter(vehicleId);


                                                                          statusText1 =
                                                                              '${snapshort.data!.result!.result![index].statusText.toString()}';
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                          "View"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                                  padding:
                                                      const EdgeInsets.only(
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
                      ),
                      SingleChildScrollView(
                        child: RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          edgeOffset: 20,
                          displacement: 20,
                          strokeWidth: 2,
                          color: Colors.blue,
                          backgroundColor: Colors.white,
                          onRefresh: _refresh,
                          child: FutureBuilder<MaintananceData>(
                            future: getMaintenanceRecordeApi1(),
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
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: SizedBox(
                                                                  width: 200,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Insurance",
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
                                                                        "${snapshot.data!.result!.result![index].insurance.toString()}",
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
                                                                        "Vihicle licence",
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
                                                                        "${snapshot.data!.result!.result![index].vehicleLicense.toString()}",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            overflow: TextOverflow.ellipsis),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: SizedBox(
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
                                                                            submit=false;
                                                                        maaitUbtn =
                                                                            true;
                                                                        maintenanceRecordDetailsPage =
                                                                            0;
                                                                        driverLicense =
                                                                            '${snapshot.data!.result!.result![index].driverLicense.toString()}';
                                                                        driverMediclaim =
                                                                            '${snapshot.data!.result!.result![index].driverMediclaim.toString()}';
                                                                        insurance =
                                                                            '${snapshot.data!.result!.result![index].insurance.toString()}';
                                                                        maintananceYear =
                                                                            '${snapshot.data!.result!.result![index].maintenanceYear.toString()}';
                                                                        vehicleLicense =
                                                                            '${snapshot.data!.result!.result![index].vehicleLicense.toString()}';
                                                                        status =
                                                                            '${snapshot.data!.result!.result![index].statusText.toString()}';
                                                                        dateTime =
                                                                            '${snapshot.data!.result!.result![index].createdOn.toString()}';
                                                                        id =
                                                                            '${snapshot.data!.result!.result![index].id.toString()}';
                                                                        vehicleMantananceYear =
                                                                            '${snapshot.data!.result!.result![index].vehicleMaintainance.toString()}';
                                                                        vehicleId =
                                                                            '${snapshot.data!.result!.result![index].vehicleId.toString()}';


                                                                            

                                                                            getVehicleIdApiFilter(vehicleId);




                                                                        statusText1 =
                                                                            '${snapshot.data!.result!.result![index].statusText.toString()}';
                                                                        vehicleText =
                                                                            '${snapshot.data!.result!.result![index].vehicleText.toString()}';

                                                                        print('vehicleText$vehicleText');


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
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedPositioned(
                    top: maintenanceRecordDetailsPage,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          maintenanceRecordDetailsPage = 1200;
                                        });
                                      },
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_outlined)),
                                  Text(
                                    'Maintenance Record',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
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
                                  Text(
                                    "VehicleLicense",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$driverLicense",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                    "Driver Mediclaim",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$driverMediclaim",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                    "Insurance",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$insurance",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Maintanance Year",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$maintananceYear",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Driver License",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$driverLicense",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      "Vehilce Maintanance ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$vehicleMantananceYear",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$status",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      width: 120,
                                      child: Text(
                                        "$dateTime",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              SizedBox(
                                height: 40,
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
                                          deleteDialogBoxPop = 130;
                                          maintenanceRecordDetailsPage = 1200;
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
                                        setState(() {});
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            newDataAndUpdateFormPage = 0;
                                            driverLicenseText.text =
                                                driverLicense.toString();
                                            vehicleLicenseText.text =
                                                vehicleLicense.toString();
                                            insuranceText.text =
                                                insurance.toString();
                                            time1 = maintananceYear;
                                            time2 = vehicleMantananceYear
                                                .toString();


                                          });
                                          Future.delayed(Duration(seconds: 3),(){
                                            submit=false;
                                          });

                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          child: Center(
                                            child:submit?SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator()
                                              ,
                                            ): Text(
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
                    top: newDataAndUpdateFormPage,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
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
                                            newDataAndUpdateFormPage = 1200;

                                            vehicleLicenseText.clear();
                                            statusText1 = '';
                                            vehicleText = '';
                                            driverLicenseText.clear();
                                            driverMediclaim = '';
                                            submit=false;
                                            time1 = '';

                                            insuranceText.clear();
                                            time2 = '';

                                            status = '';
                                            vehicleId = '';
                                            vehicleText = '';
                                          });
                                        },
                                        icon: Icon(
                                            Icons.arrow_back_ios_new_outlined)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(maaitUbtn?'Edit Form':
                                      'Maintenance Form',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          decoration: TextDecoration.underline),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Driver License",
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
                                      controller: driverLicenseText,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter driver license';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "driver license here",
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
                                          "Vehicle License",
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
                                      controller: vehicleLicenseText,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter vehicle license';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "vehicle license here",
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
                                          "Driver Medical",
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
                                    DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select driver medical';
                                        }
                                        return null;
                                      },
                                      borderRadius: BorderRadius.circular(15),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      hint: Text(driverMediclaim != null
                                          ? '$driverMediclaim'
                                          : "Select"),
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Yes"),
                                          value: "yes",
                                        ),
                                        DropdownMenuItem(
                                          child: Text('No'),
                                          value: "no",
                                        )
                                      ],
                                      onChanged: (value) {
                                        print(value);

                                        setState(() {
                                          driverMediclaim = value.toString();
                                        });
                                      },
                                    ),
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
                                          "Maintenace Year ",
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
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2030))
                                                    .then((value) {
                                                  setState(() {
                                                    _dateTime = value!;
                                                    time1 = _dateTime.year
                                                        .toString();

                                                    print(time1.toString());
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.calendar_today,
                                                color: Colors.red,
                                              )),
                                          Center(child: Text(time1.toString())),
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
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Insurance Year",
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
                                      controller: insuranceText,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter insurance';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: " Enter insurance ",
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
                                          "Vehicle Maintenance",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2030))
                                                    .then((value) {
                                                  setState(() {
                                                    _dateTime = value!;
                                                    time2 = _dateTime.day
                                                            .toString() +
                                                        "/" +
                                                        _dateTime.month
                                                            .toString() +
                                                        "/" +
                                                        _dateTime.year
                                                            .toString();
                                                    print(time2.toString());
                                                  });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.calendar_today,
                                                color: Colors.red,
                                              )),
                                          Center(child: Text(time2.toString())),
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
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vehicle ID",
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
                                    FutureBuilder<VehicleDataId>(
                                      future: getVehicleIdApi(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return  DropdownButtonFormField(

                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                hint: Text(vehicleText!=null
                                                    ? '$vehicleText'
                                                    : "Vehicle ID"),
                                                items: [
                                                  for (var i = 0;
                                                      i <
                                                          snapshot.data!.result!
                                                              .result!.length;
                                                      i++)
                                                    DropdownMenuItem(
                                                      child: Text(
                                                          "${snapshot.data!.result!.result![i].trailerName.toString()}"),
                                                      value:
                                                          "${snapshot.data!.result!.result![i].id.toString()}",
                                                    ),
                                                ],
                                                onChanged: (value) {
                                                  print(value);
                                                  vehicleId = value.toString();

                                                  for (var i = 0;
                                                      i <
                                                          snapshot.data!.result!
                                                              .result!.length;
                                                      i++) {
                                                    if (vehicleId ==
                                                        snapshot.data!.result!
                                                            .result![i].id
                                                            .toString()) {
                                                      vehicleText = snapshot
                                                          .data!
                                                          .result!
                                                          .result![i]
                                                          .trailerName
                                                          .toString();
                                                    }
                                                  }

                                                  print(vehicleText);
                                                },
                                              );

                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(),
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
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Status",
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
                                    DropdownButtonFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Select status';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      borderRadius: BorderRadius.circular(15),
                                      hint: Text(statusText1 != null
                                          ? '$statusText1'
                                          : "Select"),
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Active"),
                                          value: "1",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Inactive"),
                                          value: "0",
                                        ),
                                      ],
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          if (value == "1") {
                                            statusText1 = "Active";
                                            status = value.toString();
                                          }
                                          if (value == "0") {
                                            statusText1 = "Inactive";
                                            status = value.toString();
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                 (maaitUbtn == true)
                                      ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              var data = {
                                                "vehicleLicense":
                                                    vehicleLicenseText.text
                                                        .toString(),
                                                "driverLicense": driverLicenseText
                                                    .text
                                                    .toString(),
                                                "driverMediclaim":
                                                    driverMediclaim.toString(),
                                                "maintenanceYear":
                                                    time1.toString(),
                                                "insurance":
                                                    insuranceText.text.toString(),
                                                "vehicleMaintainance":
                                                    time2.toString(),
                                                "statusText":
                                                    statusText1.toString(),
                                                "status": status.toString(),
                                                "maintenanceDocument": "",
                                                "vehicleId": vehicleId.toString(),
                                                "vehicleText":
                                                    vehicleText.toString(),
                                                "id": id.toString()
                                              };

                                              if (vehicleLicenseText.text.isNotEmpty &&
                                                  driverLicenseText.text.isNotEmpty &&
                                                  driverMediclaim!.isNotEmpty &&
                                                  time1!.isNotEmpty &&
                                                  insuranceText.text.isNotEmpty &&
                                                  time2!.isNotEmpty &&
                                                  status!.isNotEmpty &&
                                                  vehicleId!.isNotEmpty &&
                                                  vehicleText!.isNotEmpty &&
                                                  statusText1!.isNotEmpty) {
                                                upDateMaitananceRecordApi(data);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content:
                                                          Text('Invalid value')),
                                                );
                                              };
                                               setState(() {
                                                 submit=true;
                                               });
                                               Future.delayed(Duration(seconds: 3),(){
                                                 setState(() {
                                                   submit=false;
                                                 });
                                               });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Colors.grey.shade500,
                                                        offset: Offset(5, 5),
                                                        blurRadius: 15,
                                                        spreadRadius: 1),
                                                    BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset(-5, -5),
                                                        blurRadius: 15,
                                                        spreadRadius: 1),
                                                  ]),
                                              child:Center(child:submit?SizedBox(width: 20,height: 20,
                                              child: CircularProgressIndicator(),
                                              ): Text('Update',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                                              // ElevatedButton(
                                              //   style: ElevatedButton.styleFrom(
                                              //       primary: Colors.transparent,
                                              //       shape: RoundedRectangleBorder(
                                              //           borderRadius:
                                              //               BorderRadius.circular(
                                              //                   10))),
                                              //   onPressed: () {
                                              //     var data = {
                                              //       "vehicleLicense":
                                              //           vehicleLicenseText.text
                                              //               .toString(),
                                              //       "driverLicense":
                                              //           driverLicenseText.text
                                              //               .toString(),
                                              //       "driverMediclaim":
                                              //           driverMediclaim
                                              //               .toString(),
                                              //       "maintenanceYear":
                                              //           time1.toString(),
                                              //       "insurance": insuranceText
                                              //           .text
                                              //           .toString(),
                                              //       "vehicleMaintainance":
                                              //           time2.toString(),
                                              //       "statusText":
                                              //           statusText1.toString(),
                                              //       "status": status.toString(),
                                              //       "maintenanceDocument": "",
                                              //       "vehicleId":
                                              //           vehicleId.toString(),
                                              //       "vehicleText":
                                              //           vehicleText.toString(),
                                              //       "id": id.toString()
                                              //     };
                                              //
                                              //     if (_formKey.currentState!
                                              //         .validate()) {
                                              //       upDateMaitananceRecordApi(
                                              //           data);
                                              //     } else {
                                              //       ScaffoldMessenger.of(context)
                                              //           .showSnackBar(
                                              //         const SnackBar(
                                              //             backgroundColor:
                                              //                 Colors.green,
                                              //             content: Text(
                                              //                 'Invalid value')),
                                              //       );
                                              //     }
                                              //   },
                                              //   child: Text(
                                              //     "Update",
                                              //     style: TextStyle(
                                              //         color: Colors.black87,
                                              //         fontSize: 18,
                                              //         fontWeight:
                                              //             FontWeight.bold),
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                      )
                                      : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              var data = {
                                                "vehicleLicense":
                                                    vehicleLicenseText.text
                                                        .toString(),
                                                "driverLicense": driverLicenseText
                                                    .text
                                                    .toString(),
                                                "driverMediclaim":
                                                    driverMediclaim.toString(),
                                                "maintenanceYear":
                                                    time1.toString(),
                                                "insurance":
                                                    insuranceText.text.toString(),
                                                "vehicleMaintainance":
                                                    time2.toString(),
                                                "statusText":
                                                    statusText1.toString(),
                                                "status": status.toString(),
                                                "maintenanceDocument": "",
                                                "vehicleId": vehicleId.toString(),
                                                "vehicleText":
                                                    vehicleText.toString(),
                                                "id": "",
                                              };

                                              print('data=====$data');

                                              if (  vehicleLicenseText.text.isNotEmpty &&
                                                  driverLicenseText.text.isNotEmpty &&
                                                  driverMediclaim!.isNotEmpty &&
                                                  time1!.isNotEmpty &&
                                                  insuranceText.text.isNotEmpty &&
                                                  time2!.isNotEmpty &&
                                                  status!.isNotEmpty &&
                                                  vehicleId!.isNotEmpty &&
                                                  vehicleText!.isNotEmpty &&
                                                  statusText1!.isNotEmpty


                                              ) {
                                                postMaintananceRecordAip(data);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content:
                                                          Text('Invalid value')),
                                                );
                                              }

                                              setState(() {
                                                vehicleLicenseText.clear();

                                                driverLicenseText.clear();

                                                driverMediclaim = '';
                                                time1 = '';

                                                insuranceText.clear();
                                                time2 = '';
                                                statusText1 = '';
                                                vehicleText = '';
                                                status = '';
                                                vehicleId = '';
                                                vehicleText = '';
                                              });
                                              setState(() {
                                                submit=true;
                                              });
                                              Future.delayed(Duration(seconds: 3),(){
                                                setState(() {
                                                  submit=false;
                                                });
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Colors.grey.shade500,
                                                        offset: Offset(5, 5),
                                                        blurRadius: 15,
                                                        spreadRadius: 1),
                                                    BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset(-5, -5),
                                                        blurRadius: 15,
                                                        spreadRadius: 1),
                                                  ]),
                                              child: Center(

                                                  child:submit?SizedBox(
                                                    height: 20,
                                                    width:20,
                                                    child: CircularProgressIndicator(),
                                                  ): Text('Submit',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                                              // ElevatedButton(
                                              //   style: ElevatedButton.styleFrom(
                                              //       primary: Colors.transparent,
                                              //       shape: RoundedRectangleBorder(
                                              //           borderRadius:
                                              //               BorderRadius.circular(
                                              //                   10))),
                                              //   onPressed: () {
                                              //     var data = {
                                              //       "vehicleLicense":
                                              //           vehicleLicenseText.text
                                              //               .toString(),
                                              //       "driverLicense":
                                              //           driverLicenseText.text
                                              //               .toString(),
                                              //       "driverMediclaim":
                                              //           driverMediclaim
                                              //               .toString(),
                                              //       "maintenanceYear":
                                              //           time1.toString(),
                                              //       "insurance": insuranceText
                                              //           .text
                                              //           .toString(),
                                              //       "vehicleMaintainance":
                                              //           time2.toString(),
                                              //       "statusText":
                                              //           statusText1.toString(),
                                              //       "status": status.toString(),
                                              //       "maintenanceDocument": "",
                                              //       "vehicleId":
                                              //           vehicleId.toString(),
                                              //       "vehicleText":
                                              //           vehicleText.toString(),
                                              //       "id": "",
                                              //     };
                                              //     print('data=====$data');
                                              //
                                              //     if (_formKey.currentState!
                                              //         .validate()) {
                                              //       postMaintananceRecordAip(
                                              //           data);
                                              //     } else {
                                              //       ScaffoldMessenger.of(context)
                                              //           .showSnackBar(
                                              //         const SnackBar(
                                              //             backgroundColor:
                                              //                 Colors.green,
                                              //             content: Text(
                                              //                 'Invalid value')),
                                              //       );
                                              //     }
                                              //     ;
                                              //     setState(() {
                                              //       vehicleLicenseText.clear();
                                              //
                                              //       driverLicenseText.clear();
                                              //
                                              //       driverMediclaim = '';
                                              //       time1 = '';
                                              //
                                              //       insuranceText.clear();
                                              //       time2 = '';
                                              //       statusText1 = '';
                                              //       vehicleText = '';
                                              //       status = '';
                                              //       vehicleId = '';
                                              //       vehicleText = '';
                                              //     });
                                              //   },
                                              //   child: Text(
                                              //     "Add",
                                              //     style: TextStyle(
                                              //         color: Colors.black87,
                                              //         fontSize: 18,
                                              //         fontWeight:
                                              //             FontWeight.bold),
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                      ),

                                SizedBox(
                                  height: 170,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: deleteDialogBoxPop,
                    duration: Duration(milliseconds: 1000),
                    left: 35,
                    right: 35,
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
                        padding: const EdgeInsets.only(top: 25, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 58,
                              color: Colors.red,
                            ),
                            Text(
                              "Alert Message",
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        deleteDialogBoxPop = 1200;
                                      });
                                    },
                                    child: Container(
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
                                      width: 120,
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {

                                        deleteMaitananceRecordApi(id!);
                                        deleteDialogBoxPop = 1200;
                                        //id
                                      });
                                    },
                                    child: Container(
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
                                      width: 120,
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
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

  Future<void> deleteMaitananceRecordApi(id) async {

    final res = await http.delete(Uri.parse("$baseUrl/VehicleMaintenanceAPI/?id=$id"),

        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MaintenanceRecordPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success...')),
      );
    } else {
      throw Exception("Somrthing Error");
    }
  }

  Future<void> postMaintananceRecordAip(Map<String, String> data) async {
    var datac = jsonEncode(data);
    final res = await http.post(Uri.parse("$baseUrl/VehicleMaintenanceAPI/"),
        body: datac,
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
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MaintenanceRecordPage()));
      setState(() {
        newDataAndUpdateFormPage=1200;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Invalid Value..')),
      );
    }
  }

  Future<void> upDateMaitananceRecordApi(Map<String, String> data) async {
    var data2 = jsonEncode(data);
    final res = await http.patch(Uri.parse("$baseUrl/VehicleMaintenanceAPI/"),
        body: data2,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MaintenanceRecordPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success...')),
      );
    } else {
      throw Exception("Somrthing Error");
    }
  }
}
