import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';
import '../ModelsPage/ReadinessDetailsModels.dart';
import '../ModelsPage/ReadinessNewdataAddFormModels.dart';

bool isLoading = false;
final ScrollController scrollController = ScrollController();

class ReadinessPage extends StatefulWidget {
  const ReadinessPage({Key? key}) : super(key: key);

  @override
  State<ReadinessPage> createState() => _ReadinessPageState();
}

class _ReadinessPageState extends State<ReadinessPage> {
  final _formKey = GlobalKey<FormState>();
  List listName = ["A", "B", "C", "D", "E"];
  TextEditingController truckNumber = TextEditingController();
  TextEditingController cityDriverName = TextEditingController();
  TextEditingController cityTruck = TextEditingController();
  TextEditingController driver1PhoneNo1 = TextEditingController();
  TextEditingController  driver2PhoneNo1 = TextEditingController();
  final TextEditingController tripId = TextEditingController();
  final TextEditingController driverId = TextEditingController();
  final TextEditingController statusText = TextEditingController();
   String? driver1PhoneNo="";
  String? driver2PhoneNo="";
  double _sliderValue=0;
  DateTime _dateTime = DateTime.now();
  late String truckMacYear = '';
  late String truckMac2Year = '';
  late String fitUnfit = "";
  late String fitUnfit1 = "";
  late String driver1Name = "";
  var  data1 ;
  late String tripId1=" ";
  late String tripDetails = "";
  late String tripDetails1 = "";
  double readinessFormTopPosition = 1200;
  double readinessDetailsPage = 1200;
  double readinessDetailsDeleteConfirmDialog = 1200;
  late String driver2Name = "";
  late String driver3Name = "";
  String? readinessDetailsId="";
  var driverFirstDriverName;
  var driverSecondDriverName;
  var driverFirstMobileNumber;
  var  driverSecondMobileNumber;
  var truckMaintenanceDate;
  var driverHealthMedical;
  var cityDriverNamewithOutText;
  var truckFulllNumber;
  var cityTruckFullName;
  var truckFuelDetails;
  var truckMakeYear;
  var cityTruckFullNumber;

  var idReadiness;
  var tripId123;
  var driverId123;
  var driverNumber;
  var driver1Id;
  var driver2Id;
  var driver3Id;
  var driverListData;

  late String padLock = "";
  bool login = false;
  bool rediness = false;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getDriverListApiFunction();
    getTripsIdApiFunction123();
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  Future<void> _scrollListener() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      await getReadinessDetailsApiFunction();
      await getReadinessDetailsApiFunction1();
      setState(() {
        isLoading = false;
      });
    } else {
      print("Don't Call");
    }
  }

  Future _refresh() async {
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
                title: Text("Readiness"),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          readinessFormTopPosition =0;
                           driver1Name="";
                          driver2Name="";
                          driver3Name="";
                          truckMacYear="";
                          tripDetails="";
                          tripDetails1="";
                          fitUnfit1="";
                          driver1Id="";
                          driver2Id="";
                          tripDetails ='';
                          tripId1='';
                          rediness=false;
                          driver1PhoneNo1.clear();

                          driver2PhoneNo1.clear();
                          truckNumber.clear();
                          driver3Id="";
                          cityTruck.clear();
                           padLock="";
                           tripId1="";
                          truckMac2Year="";
                          idReadiness="";
                          readinessDetailsPage=1200;
                        });
                      },
                      child: Text(
                        "Add New",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              body: Stack(
                children: [
                  TabBarView(
                    children: [
                      Container(
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
                          child: FutureBuilder<ReadinessDetailsModels>(
                            future: getReadinessDetailsApiFunction(),
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
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width: 225,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
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
                                                                          "${snapshot.data!.result!.result![index].driver1Name}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data!.result!.result![index].driver1PhoneNo.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data!.result!.result![index].driver2Name}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data!.result!.result![index].driver2PhoneNo.toString()}",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 18,
                                                                              overflow: TextOverflow.ellipsis),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
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
                                                                        readinessDetailsPage =
                                                                            0;
                                                                        driver1Name =
                                                                            "${snapshot.data!.result!.result![index].driver1Name.toString()}";
                                                                        driver1Id =
                                                                        "${snapshot.data!.result!.result![index].driver1Id.toString()}";
                                                                        driver2Name =
                                                                            "${snapshot.data!.result!.result![index].driver2Name.toString()}";
                                                                        driver2Id =
                                                                        "${snapshot.data!.result!.result![index].driver2Id.toString()}";
                                                                        driverFirstMobileNumber =
                                                                            "${snapshot.data!.result!.result![index].driver1PhoneNo.toString()}";
                                                                        driverSecondMobileNumber =
                                                                            "${snapshot.data!.result!.result![index].driver2PhoneNo.toString()}";
                                                                        truckMaintenanceDate =
                                                                            "${snapshot.data!.result!.result![index].truckMacYear.toString()}";
                                                                        driverHealthMedical =
                                                                            "${snapshot.data!.result!.result![index].fitUnfit.toString()}";
                                                                        driver3Name=
                                                                            "${snapshot.data!.result!.result![index].cityDrivername.toString()}";

                                                                        driver3Id =
                                                                        "${snapshot.data!.result!.result![index].cityDriverName.toString()}";



                                                                        truckFulllNumber =
                                                                            "${snapshot.data!.result!.result![index].truckNumber.toString()}";
                                                                        cityTruckFullName =
                                                                            "${snapshot.data!.result!.result![index].cityTruck.toString()}";
                                                                        truckFuelDetails =
                                                                            "${snapshot.data!.result!.result![index].padLock.toString()}";
                                                                        truckMakeYear =
                                                                            "${snapshot.data!.result!.result![index].padLock.toString()}";
                                                                        cityTruckFullNumber =
                                                                            "${snapshot.data!.result!.result![index].cityTruck.toString()}";

                                                                        readinessDetailsId =
                                                                            "${snapshot.data!.result!.result![index].id.toString()}";

                                                                        tripId1 =
                                                                            "${snapshot.data!.result!.result![index].tripId.toString()}";

                                                                        fitUnfit1 =
                                                                        "${snapshot.data!.result!.result![index].fitUnfit.toString()}";


                                                                        fitUnfit1 =
                                                                        "${snapshot.data!.result!.result![index].fitUnfit.toString()}";



                                                                        _sliderValue =
                                                                            double.parse("${snapshot.data!.result!.result![index].fuel.toString()}");


                                                                        tripIdGetApiinReadinessForFilter(tripId1);
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                        "View"),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 300),
                                              child: Text(''),
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

                      //           Container(
                      //             width: MediaQuery.of(context).size.width,
                      //             height: MediaQuery.of(context).size.height,
                      //             child: RefreshIndicator(
                      //               triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      //               edgeOffset: 20,
                      //               displacement: 20,
                      //               strokeWidth: 2,
                      //               color: Colors.blue,
                      //               backgroundColor: Colors.white,
                      //               onRefresh: _refresh,
                      //               child: FutureBuilder<ReadinessDetailsModels1>(
                      //                 future:getReadinessDetailsApiFunction1(),
                      //                 builder: (context,snapshot){
                      //                   if(snapshot.hasData){
                      //                     return ListView.builder(
                      //                         controller: scrollController,
                      //                         itemCount:isLoading? snapshot.data!.result!.result!.length+1:snapshot.data!.result!.result!.length,
                      //                         scrollDirection: Axis.vertical,
                      //                         physics: ClampingScrollPhysics(),
                      //                         shrinkWrap: true,
                      //                         itemBuilder: (context,index){
                      // if(index<snapshot.data!.result!.result!.length){
                      //   return Padding(
                      //     padding: const EdgeInsets.all(10),
                      //
                      //     child: Container(
                      //       height: 150,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           gradient: LinearGradient(
                      //               begin: Alignment.topRight,
                      //               end: Alignment.bottomLeft,
                      //               colors: [
                      //                 //  Colors.lightBlue,
                      //                 Colors.white,
                      //                 Colors.lightBlue,
                      //                 // Colors.cyanAccent
                      //               ]),
                      //
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color:Colors.grey.shade500,
                      //                 offset: Offset(5,5),
                      //                 blurRadius: 15,
                      //                 spreadRadius: 1
                      //             ),
                      //             BoxShadow(
                      //                 color:Colors.white,
                      //                 offset: Offset(-5,-5),
                      //                 blurRadius: 15,
                      //                 spreadRadius: 1
                      //             ),
                      //           ]
                      //       ),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //
                      //
                      //           SizedBox(width:220,
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(left: 10),
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                 children: [
                      //                   Text("Carrier",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                      //                   Text("${snapshot.data!.result!.result![index].carrierName.toString()}",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                      //
                      //                   Text("Driver",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                      //
                      //                   Text("${snapshot.data!.result!.result![index].driver1Name.toString()}",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                      //
                      //                 ],
                      //
                      //               ),
                      //             ),
                      //           ),
                      //
                      //
                      //
                      //
                      //
                      //
                      //           SizedBox(
                      //
                      //             width: 100,
                      //             height:35 ,
                      //             child: ElevatedButton(
                      //               style: ElevatedButton.styleFrom(
                      //                   primary: Colors.black87,
                      //                   shape: RoundedRectangleBorder(
                      //                       borderRadius: BorderRadius.circular(25)
                      //                   )
                      //               ),
                      //               onPressed: (){
                      //                 var indexid=index;
                      //                 //   getReadinessAllDetailsApi(snapshot.data!.result!.result![index].id.toString());
                      //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadinessDetailsPage(indexid: indexid,)));
                      //               },child: Text("View"),
                      //             ),
                      //
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //
                      //   );
                      // }else{
                      //   return Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }
                      //
                      //                         });
                      //                   }else{
                      //                     return Center(
                      //                       child: CircularProgressIndicator(),
                      //                     );
                      //                   }
                      //                 },
                      //
                      //               ),
                      //             ),
                      //           ),
                    ],
                  ),
                  AnimatedPositioned(
                    top: readinessDetailsPage,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
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
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      readinessDetailsPage =
                                                          1200;
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .arrow_back_ios_new_outlined)),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Text(
                                                'Readness Details',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
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
                                                "Driver1Name",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driver1Name",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "MobileNo",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driverFirstMobileNumber",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Driver2Name",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driver2Name",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "MobileNo",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driverSecondMobileNumber",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "TruckMaintenanceDate",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: 15,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$truckMaintenanceDate",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "DriverMedical",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driverHealthMedical",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "CityDriverName",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$driver3Name",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "TruckNumber",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$truckFulllNumber",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "CityTruck",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$cityTruckFullName",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  "TruckFuel",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    "$truckFuelDetails",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "TruckMacYear",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$truckMakeYear",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "CityTruckNo.",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    "$cityTruckFullNumber.",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 15),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 25,
                                          ),


                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      readinessDetailsDeleteConfirmDialog =
                                                          130;
                                                      readinessDetailsPage=1200;
                                                    });
                                                  },
                                                  child: Container(
                                                    child: Center(
                                                        child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.red),
                                                    )),
                                                    height: 50,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
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
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      rediness=true;
                                                      readinessFormTopPosition =
                                                          0;
                                                      readinessDetailsPage =
                                                          1200;

                                                      truckNumber.text =
                                                          "${snapshot.data!.result!.result![index].truckNumber.toString()}";
                                                      truckMacYear =
                                                          "${snapshot.data!.result!.result![index].truckMacYear.toString()}";

                                                      fitUnfit1 =
                                                          "${snapshot.data!.result!.result![index].fitUnfit.toString()}";

                                                      driver1Id =
                                                          "${snapshot.data!.result!.result![index].driver1Id.toString()}";

                                                      driver2Id =
                                                          "${snapshot.data!.result!.result![index].driver2Id.toString()}";

                                                      driver1PhoneNo1.text=
                                                         "${snapshot.data!.result!.result![index].driver1PhoneNo.toString()}";

                                                      driver2PhoneNo1.text=
                                                         "${snapshot.data!.result!.result![index].driver2PhoneNo.toString()}";

                                                      driver3Id =
                                                          "${snapshot.data!.result!.result![index].cityDriverName.toString()}";

                                                      cityTruck.text =
                                                          "${snapshot.data!.result!.result![index].cityTruck.toString()}";
                                                      padLock =
                                                          "${snapshot.data!.result!.result![index].padLock.toString()}";
                                                      tripId1 =
                                                          "${snapshot.data!.result!.result![index].tripId.toString()}";

                                                      truckMac2Year =
                                                          "${snapshot.data!.result!.result![index].truckMac2Year.toString()}";
                                                      idReadiness =
                                                          "${snapshot.data!.result!.result![index].id.toString()}";
                                                      // "status": 1
                                                    });
                                                  },
                                                  child: Container(
                                                    child: Center(
                                                        child: Text(
                                                      'Update',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.green),
                                                    )),
                                                    height: 50,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 100,
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
                  AnimatedPositioned(
                    top:  readinessFormTopPosition,
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
                                              readinessFormTopPosition = 1200;
                                              driver1Name = " ";
                                              driver2Name = ' ';
                                              truckMacYear = ' ';

                                              fitUnfit = ' ';

                                              fitUnfit1 = ' ';

                                              driver1PhoneNo = ' ';

                                              driver2PhoneNo = ' ';

                                              driver1Id = ' ';
                                              tripDetails ='';
                                              tripId1='';
                                              driver2Id = ' ';

                                              readinessDetailsId = '';

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
                                        rediness
                                            ? 'Edit Readiness'
                                            : 'Readiness Form',
                                        style: TextStyle(
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
                                        hint: Text((fitUnfit1
                                            .toString()
                                            .isNotEmpty)
                                            ? "$fitUnfit1"
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
                                        // future:driverListData ,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child: Text(""),
                                            );
                                          } else {
                                            return
                                              DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                                hint: Text((driver1Name
                                                    .toString()
                                                    .isNotEmpty)
                                                    ? "$driver1Name"
                                                    : "Select"),
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                items: [
                                                  for (var i = 0;
                                                  i <
                                                      driverListData['result']
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
                                                  driver1Id = value.toString();
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
                                                        [i]['id']
                                                            .toString()) ??
                                                            "";
                                                        driver1Name =
                                                        "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}";

                                                        driver1PhoneNo1.text=
                                                            (driverListData['result']
                                                            [i][
                                                            'mobileNo']
                                                                .toString()) ??
                                                                "";

                                                        print(driver1Name);
                                                        print(driver1PhoneNo1);
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

                                        // driverListData,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                child: Text(""),
                                              );
                                            } else {
                                              return
                                                DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
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
                                                        driverListData['result']
                                                            .length;
                                                    i++)
                                                      DropdownMenuItem(
                                                        child: Text(
                                                            "${(driverListData['result'][i]['firstName']
                                                                .toString()) ??
                                                                ""}${" "}${(driverListData['result'][i]['lastName']
                                                                .toString()) ??
                                                                ""}"),
                                                        value:
                                                        "${(driverListData['result'][i]['id']
                                                            .toString()) ??
                                                            ""}",
                                                      ),
                                                  ],
                                                  onChanged: (
                                                      String? value) {
                                                    setState(() {
                                                      for (var i = 0;
                                                      i <
                                                          driverListData[
                                                          'result']
                                                              .length;
                                                      i++) {
                                                        if (value ==
                                                            "${(driverListData['result'][i]['id']
                                                                .toString()) ??
                                                                ""}") {
                                                          driver2Id =
                                                              (driverListData[
                                                              'result']
                                                              [i]['id']
                                                                  .toString()) ??
                                                                  "";
                                                          driver2Name =
                                                          "${(driverListData['result'][i]['firstName']
                                                              .toString()) ??
                                                              ""}${" "}${(driverListData['result'][i]['lastName']
                                                              .toString()) ??
                                                              ""}";

                                                          driver2PhoneNo1.text =
                                                              (driverListData['result']
                                                              [i][
                                                              'mobileNo']
                                                                  .toString()) ??
                                                                  "";

                                                          print(
                                                              driver2Name);
                                                          print(
                                                              driver2PhoneNo);
                                                        }
                                                      }
                                                    });
                                                  },
                                                );
                                            }  })

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
                                      TextFormField(
                                        controller: driver1PhoneNo1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15)
                                          )
                                        ),
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
                                        "DRIVER2 MobileNo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      TextFormField(
                                        controller: driver2PhoneNo1,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15)
                                            )
                                        ),
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
                                        "CITY DRIVER NAME(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      FutureBuilder(
                                        // future:
                                        //     getDriverListApiFunction(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child: Text(''),
                                            );
                                          } else {
                                            return
                                              DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                                hint: Text((driver3Name
                                                    .toString()
                                                    .isNotEmpty)
                                                    ? "$driver3Name"
                                                    : "Select"),
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                items: [
                                                  for (var i = 0;
                                                  i < driverListData['result'].length;
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
                                                        driverListData['result']
                                                            .length;
                                                    i++) {
                                                      if (value ==
                                                          "${(driverListData['result'][i]['id'].toString()) ?? ""}") {
                                                        driver3Id =
                                                            driverListData['result'][i]
                                                            ['id']
                                                                .toString();
                                                        driver3Name =
                                                        "${(driverListData['result'][i]['firstName'].toString()) ?? ""}${" "}${(driverListData['result'][i]['lastName'].toString()) ?? ""}";

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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Trips",
                                        style: TextStyle(
                                            color: Colors.black,
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






                                      SizedBox(height:15),
                                      Center(
                                        child: Text(
                                          "FUEL:- ${_sliderValue}%",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(height:10),
                                      Slider(

                                          max: 100,
                                          min: 0,
                                          divisions: 4,
                                          inactiveColor: Colors.grey,
                                          label: _sliderValue.round().toString(),
                                          activeColor:(_sliderValue<=25.0)? Colors.red: Colors.green,
                                          value:_sliderValue,
                                          onChanged: ((newValue){
                                            setState(() {
                                              _sliderValue=newValue;


                                              print(_sliderValue);
                                            });
                                          })
                                      ),
                                      SizedBox(height:25),

                                    ],
                                  ),
                                  rediness
                                      ? InkWell(
                                    onTap: () {
                                      statusText.text="Active";
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
                                        driver1PhoneNo1.text
                                            .toString(),
                                        "driver2PhoneNo":
                                        driver2PhoneNo1.text
                                            .toString(),
                                        "truckNumber": truckNumber
                                            .text
                                            .toString(),
                                        "fuel":_sliderValue!.toDouble(),
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
                                        "id": readinessDetailsId,
                                        "status": 1,
                                        "tripDetails":tripDetails.toString(),
                                        "cityDriverId":driver3Name.toString(),
                                        "tripId":tripId1.toString(),
                                      };

                                      var data123={
                                        "tripId": tripId.text.toString(),
                                        "driverId": driverId.text.toString(),
                                        "statusText": statusText.text.toString(),
                                        "id": readinessDetailsId
                                      };

                                      print(data);
                                      print(data123);

                                      if (truckMacYear!
                                          .isNotEmpty &&
                                          driver1PhoneNo1.text.isNotEmpty &&
                                          driver2PhoneNo1.text.isNotEmpty &&
                                          truckMac2Year!
                                              .isNotEmpty &&
                                          fitUnfit1!.isNotEmpty &&
                                          driver1Name!.isNotEmpty &&
                                          driver2Name!.isNotEmpty &&
                                          tripId1!.isNotEmpty &&
                                          _sliderValue>0

                                      ) {


                                        upDateReadinessApi(data);
                                          setState(() {
                                            login = true;
                                          });

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
                                        driver1PhoneNo1.text
                                            .toString(),
                                        "driver2PhoneNo":
                                        driver2PhoneNo1.text
                                            .toString(),
                                        "truckNumber": truckNumber
                                            .text
                                            .toString(),
                                        "cityDriverName":
                                        driver3Id.toString(),
                                        "cityDriverId":driver3Name.toString(),
                                        "cityTruck": cityTruck.text
                                            .toString(),
                                        "padLock":
                                        padLock.toString(),
                                        "fuel":_sliderValue!.toDouble(),
                                        "truckMac2Year":
                                        truckMac2Year
                                            .toString(),
                                        "tripDetails":tripDetails.toString(),
                                        "tripId":tripId1.toString(),
                                        "truckMacYear":
                                        truckMacYear.toString(),
                                        "id": "",
                                        "status": 1,

                                      };

                                      print(data);

                                      if (truckMacYear!
                                          .isNotEmpty &&
                                          driver1PhoneNo1.text.isNotEmpty &&
                                          driver2PhoneNo1.text.isNotEmpty &&
                                          truckMac2Year!
                                              .isNotEmpty &&
                                          fitUnfit1!.isNotEmpty &&
                                          driver1Name!.isNotEmpty &&
                                          driver2Name!.isNotEmpty &&
                                          tripId1!.isNotEmpty &&

                                          _sliderValue>0
                                      //  padLock.isNotEmpty
                                      ) {


                                      postReadinessFormNewApi(data);
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

                                            readinessDetailsId = '';

                                            driver3Id = ' ';

                                            driver3Name = ' ';

                                            truckNumber.text = ' ';

                                            cityTruck.text = ' ';

                                            truckMac2Year = ' ';

                                            padLock = ' ';
                                          });

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
                  // AnimatedPositioned(
                  //   top: readinessFormTopPosition,
                  //   duration: Duration(milliseconds: 1000),
                  //   child: Container(
                  //     child: Form(
                  //       key: _formKey,
                  //       child: SingleChildScrollView(
                  //         child: Column(
                  //           children: [
                  //             SizedBox(
                  //               height: 25,
                  //             ),
                  //             Row(
                  //               children: [
                  //                 IconButton(
                  //                     onPressed: () {
                  //                       setState(() {
                  //                         readinessFormTopPosition = 1200;
                  //                       });
                  //                     },
                  //                     icon: Icon(
                  //                         Icons.arrow_back_ios_new_outlined)),
                  //                 SizedBox(
                  //                   width: 55,
                  //                 ),
                  //                 Text(rediness? 'Edit Form':
                  //                   'Readiness Form',
                  //                   style: TextStyle(
                  //                       fontSize: 25,
                  //                       fontWeight: FontWeight.bold,
                  //                       decoration: TextDecoration.underline),
                  //                 )
                  //               ],
                  //             ),
                  //             SizedBox(
                  //               height: 50,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(5.0),
                  //               child: Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "LAST MAINTANANCE ",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                         height: 60,
                  //                         width: size.width,
                  //                         decoration: BoxDecoration(
                  //                           border:
                  //                               Border.all(color: Colors.grey),
                  //                           borderRadius:
                  //                               BorderRadius.circular(10),
                  //                         ),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.spaceBetween,
                  //                           children: [
                  //                             IconButton(
                  //                                 onPressed: () {
                  //                                   showDatePicker(
                  //                                           context: context,
                  //                                           initialDate:
                  //                                               DateTime.now(),
                  //                                           firstDate:
                  //                                               DateTime(2000),
                  //                                           lastDate:
                  //                                               DateTime(2030))
                  //                                       .then((value) {
                  //                                     setState(() {
                  //                                       _dateTime = value!;
                  //                                       truckMacYear = _dateTime
                  //                                               .day
                  //                                               .toString() +
                  //                                           "/" +
                  //                                           _dateTime.month
                  //                                               .toString() +
                  //                                           "/" +
                  //                                           _dateTime.year
                  //                                               .toString();
                  //                                       print(
                  //                                           'truckMakingYear:-${truckMacYear.toString()}');
                  //                                     });
                  //                                   });
                  //                                 },
                  //                                 icon: Icon(
                  //                                   Icons.calendar_today,
                  //                                   color: Colors.red,
                  //                                 )),
                  //                             Column(
                  //                               children: [
                  //                                 SizedBox(
                  //                                   height: 15,
                  //                                 ),
                  //                                 Text(truckMacYear.toString()),
                  //                               ],
                  //                             ),
                  //                             SizedBox(
                  //                               width: 10,
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "TripID	",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       FutureBuilder(
                  //                           future: tripIdGetApiinReadinessFor(),
                  //                           builder: (context, snapshot) {
                  //                             if (snapshot.connectionState ==
                  //                                 ConnectionState.waiting) {
                  //                               return Center(
                  //                                 child: Text(""),
                  //                               );
                  //                             } else {
                  //                               return Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.all(8.0),
                  //                                 child:
                  //                                     DropdownButtonFormField(
                  //
                  //                                   decoration: InputDecoration(
                  //                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                  //                                   ),
                  //
                  //                                   hint:Text((tripDetails!=null)?'$tripDetails1':'Select'),
                  //
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           15),
                  //
                  //                                   items: [
                  //                                     for (var i = 0;
                  //                                         i <
                  //                                             dataTripId[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++)
                  //                                       DropdownMenuItem(
                  //                                         child: SizedBox(
                  //                                           width: 200,
                  //                                           child: Text(
                  //                                             "${dataTripId['result'][i]['detail'].toString()}",
                  //                                             overflow:
                  //                                                 TextOverflow
                  //                                                     .ellipsis,
                  //                                           ),
                  //                                         ),
                  //                                         value:
                  //                                             "${dataTripId['result'][i]['id'].toString()}",
                  //                                       ),
                  //                                   ],
                  //                                   onChanged: (String? value) {
                  //                                     // setState(() {
                  //                                     tripId1 =
                  //                                         value.toString();
                  //                                     for (var i = 0;
                  //                                         i <
                  //                                             dataTripId[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++) {
                  //                                       if (value ==
                  //                                           "${dataTripId['result'][i]['id'].toString()}") {
                  //                                         // tripId = value.toString();
                  //                                         tripDetails =
                  //                                             "${dataTripId['result'][i]['detail'].toString()}" ??
                  //                                                 "";
                  //
                  //                                         print(
                  //                                             "tripsId:-$tripId1");
                  //                                       }
                  //                                     }
                  //                                     // }
                  //                                     //  );
                  //                                   },
                  //                                 ),
                  //                               );
                  //                             }
                  //                           },
                  //                         ),
                  //
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "Fit/Unfit",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                         height: 60,
                  //                         width:
                  //                             MediaQuery.of(context).size.width,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                             border: Border.all(
                  //                                 color: Colors.grey)),
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(8.0),
                  //                           child: DropdownButtonFormField(
                  //                             decoration: InputDecoration(
                  //                                 enabledBorder:
                  //                                     InputBorder.none),
                  //                             autofocus: false,
                  //                             hint: Text((fitUnfit1.length > 0)
                  //                                 ? fitUnfit1
                  //                                 : "Select"),
                  //                             // dropdownColor: Colors.pink.withOpacity(0.2),
                  //                             borderRadius:
                  //                                 BorderRadius.circular(15),
                  //
                  //                             //  underline: Row(),
                  //
                  //                             items: [
                  //                               DropdownMenuItem(
                  //                                 child: Text("FIT"),
                  //                                 value: "fit",
                  //                               ),
                  //                               DropdownMenuItem(
                  //                                 child: Text("UNFIT"),
                  //                                 value: "unfit",
                  //                               ),
                  //                             ],
                  //                             onChanged: (String? value) {
                  //                               // setState(() {
                  //                               if (value == "fit") {
                  //                                 fitUnfit1 = "FIT";
                  //                               }
                  //                               if (value == "unfit") {
                  //                                 fitUnfit1 = "UNFIT";
                  //                               }
                  //                               //   });
                  //                               print(fitUnfit);
                  //                             },
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "DRIVER1 NAME	",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                         height: 60,
                  //                         width:
                  //                             MediaQuery.of(context).size.width,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                             border: Border.all(
                  //                                 color: Colors.grey)),
                  //                         child: FutureBuilder(
                  //                           future: getDriverListApiFunction(),
                  //                           builder: (context, snapshot) {
                  //                             if (snapshot.connectionState ==
                  //                                 ConnectionState.waiting) {
                  //                               return Center(
                  //                                 child: Text(""),
                  //                               );
                  //                             } else {
                  //                               return Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.all(8.0),
                  //                                 child:
                  //                                     DropdownButtonFormField(
                  //                                   decoration: InputDecoration(
                  //                                       enabledBorder:
                  //                                           InputBorder.none),
                  //                                   autofocus: false,
                  //                                   hint: Text(
                  //                                       (driver1Name.length > 0)
                  //                                           ? "$driver1Name"
                  //                                           : "Select"),
                  //                                   // dropdownColor: Colors.pink.withOpacity(0.2),
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           15),
                  //
                  //                                   //   underline: Row(),
                  //
                  //                                   items: [
                  //                                     for (var i = 0;
                  //                                         i <
                  //                                             driverListData[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++)
                  //                                       DropdownMenuItem(
                  //                                         child: Text(
                  //                                             "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                  //                                         value:
                  //                                             "${driverListData['result'][i]['id'].toString()}",
                  //                                       ),
                  //                                   ],
                  //                                   onChanged: (String? value) {
                  //                                     setState(() {
                  //                                       for (var i = 0;
                  //                                           i <
                  //                                               driverListData[
                  //                                                       'result']
                  //                                                   .length;
                  //                                           i++) {
                  //                                         if (value ==
                  //                                             "${driverListData['result'][i]['id'].toString()}") {
                  //                                           driver1Id =
                  //                                               driverListData[
                  //                                                           'result']
                  //                                                       [
                  //                                                       i]['id']
                  //                                                   .toString();
                  //                                           driver1Name =
                  //                                               "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}" ??
                  //                                                   "";
                  //
                  //                                           driver1PhoneNo1.text=
                  //                                               driverListData['result']
                  //                                                           [i][
                  //                                                       'mobileNo']
                  //                                                   .toString();
                  //                                           print(driver1Name);
                  //                                           print(
                  //                                               driver1PhoneNo);
                  //                                         }
                  //                                       }
                  //                                     });
                  //                                   },
                  //                                 ),
                  //                               );
                  //                             }
                  //                           },
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "DRIVER2 NAME",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                         height: 60,
                  //                         width:
                  //                             MediaQuery.of(context).size.width,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                             border: Border.all(
                  //                                 color: Colors.grey)),
                  //                         child: FutureBuilder(
                  //                           future: getDriverListApiFunction(),
                  //                           builder: (context, snapshot) {
                  //                             if (snapshot.connectionState ==
                  //                                 ConnectionState.waiting) {
                  //                               return Center(
                  //                                 child: Text(""),
                  //                               );
                  //                             } else {
                  //                               return Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.all(8.0),
                  //                                 child:
                  //                                     DropdownButtonFormField(
                  //                                   decoration: InputDecoration(
                  //                                       enabledBorder:
                  //                                           InputBorder.none),
                  //                                   autofocus: false,
                  //                                   hint: Text(
                  //                                       (driver2Name.length > 0)
                  //                                           ? driver2Name
                  //                                           : "Select"),
                  //                                   // dropdownColor: Colors.pink.withOpacity(0.2),
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           15),
                  //
                  //                                   //  underline: Row(),
                  //
                  //                                   items: [
                  //                                     for (var i = 0;
                  //                                         i <
                  //                                             driverListData[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++)
                  //                                       DropdownMenuItem(
                  //                                         child: Text(
                  //                                             "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                  //                                         value:
                  //                                             "${driverListData['result'][i]['id'].toString()}",
                  //                                       ),
                  //                                   ],
                  //                                   onChanged: (String? value) {
                  //                                     setState(() {
                  //                                       for (var i = 0;
                  //                                           i <
                  //                                               driverListData[
                  //                                                       'result']
                  //                                                   .length;
                  //                                           i++) {
                  //                                         if (value ==
                  //                                             "${driverListData['result'][i]['id'].toString()}") {
                  //                                           driver2Id =
                  //                                               driverListData[
                  //                                                           'result']
                  //                                                       [
                  //                                                       i]['id']
                  //                                                   .toString();
                  //                                           driver2Name =
                  //                                               "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";
                  //
                  //                                           driver2PhoneNo1.text=
                  //                                               driverListData['result']
                  //                                                           [i][
                  //                                                       'mobileNo']
                  //                                                   .toString();
                  //                                           print(driver2Name);
                  //                                           print(
                  //                                               driver2PhoneNo);
                  //                                         }
                  //                                       }
                  //                                     });
                  //                                   },
                  //                                 ),
                  //                               );
                  //                             }
                  //                           },
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "DRIVER1 MobileNo",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       TextFormField(
                  //                         controller:driver1PhoneNo1 ,
                  //                         decoration: InputDecoration(
                  //                             labelText: "Phone no.",
                  //                             hintText: "enter driver1 phone no.",
                  //                             border: OutlineInputBorder(
                  //                                 borderRadius: BorderRadius.circular(15)
                  //                             )
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "DRIVER2 MobileNo",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       TextFormField(
                  //                         controller:driver2PhoneNo1 ,
                  //                         decoration: InputDecoration(
                  //                             labelText: "Phone no.",
                  //                             hintText: "enter driver1 phone no.",
                  //                             border: OutlineInputBorder(
                  //                                 borderRadius: BorderRadius.circular(15)
                  //                             )
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "CITY DRIVER NAME(Optional)",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                         height: 60,
                  //                         width:
                  //                             MediaQuery.of(context).size.width,
                  //                         decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                             border: Border.all(
                  //                                 color: Colors.grey)),
                  //                         child: FutureBuilder(
                  //                           future: getDriverListApiFunction(),
                  //                           builder: (context, snapshot) {
                  //                             if (snapshot.connectionState ==
                  //                                 ConnectionState.waiting) {
                  //                               return Center(
                  //                                 child: Text(''),
                  //                               );
                  //                             } else {
                  //                               return Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.only(
                  //                                         left: 8, right: 8),
                  //                                 child:
                  //                                     DropdownButtonFormField(
                  //                                   decoration: InputDecoration(
                  //                                       enabledBorder:
                  //                                           InputBorder.none),
                  //
                  //                                   hint: Text(
                  //                                       (driver3Name.length > 0)
                  //                                           ? driver3Name
                  //                                           : "Select"),
                  //                                   // dropdownColor: Colors.pink.withOpacity(0.2),
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           15),
                  //
                  //                                   items: [
                  //                                     for (var i = 0;
                  //                                         i <
                  //                                             driverListData[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++)
                  //                                       DropdownMenuItem(
                  //                                         child: Text(
                  //                                             "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                  //                                         value:
                  //                                             "${driverListData['result'][i]['id'].toString()}",
                  //                                       ),
                  //                                   ],
                  //                                   onChanged: (String? value) {
                  //                                     // setState(() {
                  //                                     for (var i = 0;i <
                  //                                             driverListData[
                  //                                                     'result']
                  //                                                 .length;
                  //                                         i++) {
                  //                                       if (value ==
                  //                                           "${driverListData['result'][i]['id'].toString()}") {
                  //                                         driver3Id =
                  //                                             driverListData[
                  //                                                         'result']
                  //                                                     [i]['id']
                  //                                                 .toString();
                  //                                         driver3Name =
                  //                                             "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";
                  //
                  //                                         print(driver3Name);
                  //                                       }
                  //                                     }
                  //                                     //});
                  //                                   },
                  //                                 ),
                  //                               );
                  //                             }
                  //                           },
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "Truck Number"!,
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       TextFormField(
                  //                         validator: (value) {
                  //                           if (value == null ||
                  //                               value.isEmpty) {
                  //                             return 'Please enter truckNumber text';
                  //                           }
                  //                           return null;
                  //                         },
                  //                         controller: truckNumber,
                  //                         decoration: InputDecoration(
                  //                             border: OutlineInputBorder(
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         10))),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "CITY TRUCK",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       TextFormField(
                  //                         validator: (value) {
                  //                           if (value == null ||
                  //                               value.isEmpty) {
                  //                             return 'Please enter cityTruck text';
                  //                           }
                  //                           return null;
                  //                         },
                  //                         controller: cityTruck,
                  //                         decoration: InputDecoration(
                  //                             border: OutlineInputBorder(
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         10))),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         "MODEL YEAR",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 18),
                  //                       ),
                  //                       Container(
                  //                           height: 60,
                  //                           decoration: BoxDecoration(
                  //                             border: Border.all(
                  //                                 color: Colors.grey),
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10),
                  //                           ),
                  //                           child: Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 left: 8, right: 8),
                  //                             child: DropdownButtonFormField(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               menuMaxHeight: 500,
                  //                               decoration: InputDecoration(
                  //                                   enabledBorder:
                  //                                       InputBorder.none),
                  //                               hint: Text(
                  //                                   (truckMac2Year.isNotEmpty)
                  //                                       ? truckMac2Year
                  //                                       : "Select"),
                  //                               items: [
                  //                                 for (var i = 0; i <= 50; i++)
                  //                                   DropdownMenuItem(
                  //                                     child:
                  //                                         Text("${1990 + i}"),
                  //                                     value: "${1990 + i}",
                  //                                   )
                  //                               ],
                  //                               onChanged: (Object? value) {
                  //                                 setState(() {
                  //                                   truckMac2Year =
                  //                                       value.toString();
                  //                                 });
                  //                               },
                  //                             ),
                  //                           )),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.all(3.0),
                  //                         child: Text(
                  //                           "TRUCK FUEL",
                  //                           style: TextStyle(
                  //                               color: Colors.black,
                  //                               fontWeight: FontWeight.bold,
                  //                               fontSize: 15),
                  //                         ),
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Container(
                  //                             width: 150,
                  //                             height: 170,
                  //                             child: Column(
                  //                               children: [
                  //                                 RadioListTile(
                  //                                   title: Text("Yes"),
                  //                                   value: "yes",
                  //                                   groupValue: padLock,
                  //                                   onChanged: (value) {
                  //                                     setState(() {
                  //                                       padLock =
                  //                                           value.toString();
                  //
                  //                                       print(padLock);
                  //                                     });
                  //                                   },
                  //                                 ),
                  //                                 RadioListTile(
                  //                                   title: Text("No"),
                  //                                   value: "no",
                  //                                   groupValue: padLock,
                  //                                   onChanged: (value) {
                  //                                     setState(() {
                  //                                       padLock =
                  //                                           value.toString();
                  //
                  //                                       print(padLock);
                  //                                     });
                  //                                   },
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   rediness
                  //                       ? InkWell(
                  //                           onTap: () {
                  //                             var data = {
                  //                               "truckMacYear":
                  //                                   truckMacYear.toString(),
                  //                               "fitUnfit":
                  //                                   fitUnfit1.toString(),
                  //                               "driver1Id":
                  //                                   driver1Id.toString(),
                  //                               "driver2Id":
                  //                                   driver2Id.toString(),
                  //                               "driver1PhoneNo":
                  //                                   driver1PhoneNo.toString(),
                  //                               "driver2PhoneNo":
                  //                                   driver2PhoneNo.toString(),
                  //                               "truckNumber":
                  //                                   truckNumber.text.toString(),
                  //
                  //                               "cityDriverName":
                  //                                   driver3Id.toString(),
                  //                               "cityTruck":
                  //                                   cityTruck.text.toString(),
                  //                               "padLock": padLock.toString(),
                  //                               "tripId": tripId1.toString(),
                  //                               "truckMac2Year":
                  //                                   truckMac2Year.toString(),
                  //                               "id": idReadiness.toString(),
                  //                               "status": 1
                  //                             };
                  //
                  //                             print(data);
                  //
                  //                             if (truckMacYear.isNotEmpty &&
                  //                                 truckMac2Year.isNotEmpty &&
                  //                                 fitUnfit1.length > 0 &&
                  //                                 tripId1.length > 0 &&
                  //                                 driver1Name.length > 0 &&
                  //                                 driver2Name.length > 0 &&
                  //                                 driver2Name.length > 0 &&
                  //                                 padLock.isNotEmpty) {
                  //                               if (_formKey.currentState!
                  //                                   .validate()) {
                  //                                 upDateReadinessApi(data);
                  //                                 setState(() {
                  //                                   login = true;
                  //                                 });
                  //                               }
                  //                             } else {
                  //                               ScaffoldMessenger.of(context)
                  //                                   .showSnackBar(
                  //                                 const SnackBar(
                  //                                     backgroundColor:
                  //                                         Colors.red,
                  //                                     content: Text(
                  //                                         'Invalid value...')),
                  //                               );
                  //                             }
                  //
                  //                             print(data);
                  //
                  //                             setState(() {
                  //                               Future.delayed(
                  //                                   Duration(seconds: 3), () {
                  //                                 setState(() {
                  //                                   login = false;
                  //                                 });
                  //                               });
                  //                             });
                  //                           },
                  //                           child: Padding(
                  //                             padding:
                  //                                 const EdgeInsets.all(5.0),
                  //                             child: Container(
                  //                               height: 60,
                  //                               width: size.width,
                  //                               child: Center(
                  //                                   child: login
                  //                                       ? SizedBox(
                  //                                           width: 20,
                  //                                           height: 20,
                  //                                           child:
                  //                                               CircularProgressIndicator(
                  //                                             color:
                  //                                                 Colors.blue,
                  //                                           ),
                  //                                         )
                  //                                       : Text(
                  //                                           "Update",
                  //                                           style: TextStyle(
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .bold,
                  //                                               fontSize: 25),
                  //                                         )),
                  //                               decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           10),
                  //                                   color: Colors.white,
                  //                                   boxShadow: [
                  //                                     BoxShadow(
                  //                                         color: Colors
                  //                                             .grey.shade500,
                  //                                         offset: Offset(5, 5),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                     BoxShadow(
                  //                                         color: Colors.white,
                  //                                         offset:
                  //                                             Offset(-5, -5),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                   ]),
                  //                             ),
                  //                           ),
                  //                         )
                  //                       : InkWell(
                  //                           onTap: () {
                  //                             var data = {
                  //                               "truckMacYear":
                  //                                   truckMacYear.toString(),
                  //                               "fitUnfit":
                  //                                   fitUnfit1.toString(),
                  //                               "driver1Id":
                  //                                   driver1Id.toString(),
                  //                               "driver2Id":
                  //                                   driver2Id.toString(),
                  //                               "driver1PhoneNo":
                  //                                   driver1PhoneNo.toString(),
                  //                               "driver2PhoneNo":
                  //                                   driver2PhoneNo.toString(),
                  //                               "truckNumber":
                  //                                   truckNumber.text.toString(),
                  //                               "cityDriverName":
                  //                                   driver3Id.toString(),
                  //
                  //                               "cityTruck":
                  //                                   cityTruck.text.toString(),
                  //                               "padLock": padLock.toString(),
                  //                               "truckMac2Year":
                  //                                   truckMac2Year.toString(),
                  //                               "tripId": tripId1.toString(),
                  //                               "status": 1,
                  //                               "id": "",
                  //                             };
                  //
                  //                             print(data);
                  //
                  //                             if (truckMacYear.isNotEmpty &&
                  //                                 truckMac2Year.isNotEmpty &&
                  //                                 fitUnfit1.length > 0 &&
                  //                                 driver1Name.length > 0 &&
                  //                                 tripId1.length > 0 &&
                  //                                 driver2Name.length > 0 &&
                  //                                 driver2Name.length > 0 &&
                  //                                 padLock.isNotEmpty) {
                  //                               if (_formKey.currentState!
                  //                                   .validate()) {
                  //                                postReadinessFormNewApi(data);
                  //                                 setState(() {
                  //                                   login = true;
                  //                                 });
                  //                               }
                  //                             } else {
                  //                               ScaffoldMessenger.of(context)
                  //                                   .showSnackBar(
                  //                                 const SnackBar(
                  //                                     backgroundColor:
                  //                                         Colors.red,
                  //                                     content: Text(
                  //                                         'Invalid value...')),
                  //                               );
                  //                             }
                  //
                  //                             print(data);
                  //
                  //                             setState(() {
                  //                               Future.delayed(
                  //                                   Duration(seconds: 3), () {
                  //                                 setState(() {
                  //                                   login = false;
                  //                                 });
                  //                               });
                  //                             });
                  //                           },
                  //                           child: Padding(
                  //                             padding:
                  //                                 const EdgeInsets.all(5.0),
                  //                             child: Container(
                  //                               height: 60,
                  //                               width: size.width,
                  //                               decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.circular(
                  //                                           10),
                  //                                   color: Colors.white,
                  //                                   boxShadow: [
                  //                                     BoxShadow(
                  //                                         color: Colors
                  //                                             .grey.shade500,
                  //                                         offset: Offset(5, 5),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                     BoxShadow(
                  //                                         color: Colors.white,
                  //                                         offset:
                  //                                             Offset(-5, -5),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                   ]),
                  //                               child: Center(
                  //                                   child: login
                  //                                       ? SizedBox(
                  //                                           height: 20,
                  //                                           width: 20,
                  //                                           child:
                  //                                               CircularProgressIndicator(
                  //                                             color:
                  //                                                 Colors.blue,
                  //                                             strokeWidth: 2,
                  //                                           ))
                  //                                       : Text(
                  //                                           "Submit",
                  //                                           style: TextStyle(
                  //                                               fontSize: 25,
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .bold),
                  //                                         )),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                   SizedBox(
                  //                     height: 50,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 100,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     width: size.width,
                  //     height: size.height,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(15),
                  //             topRight: Radius.circular(15))),
                  //   ),
                  // ),
                  AnimatedPositioned(
                    top: readinessDetailsDeleteConfirmDialog,
                    left: 35,
                    right: 35,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 58,
                              color: Colors.red,
                            ),
                            Text(
                              'Alert Message',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              'are you sure want to delete this record?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      print(readinessDetailsId);
                                      readinessDetailsDeleteConfirmDialog = 1200;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
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
                                      print(readinessDetailsId);
                                      deleteReadinessRecord(readinessDetailsId);
                                      readinessDetailsDeleteConfirmDialog=1200;

                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future deleteReadinessRecord(readinessDetailsId) async {
    final response = await http.delete(
        Uri.parse(
            'https://canadalogistic.metalsart.in/dispatcherApp/ReadinessFormAPI/?id=$readinessDetailsId'),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Delete readiness record successfully...')));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReadinessPage()));
      return data;
    } else {
      throw Exception('Something error in delete readiness record API');
    }
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
      driverListData = jsonDecode(res.body.toString());

      const SnackBar(
          backgroundColor: Colors.green, content: Text('Success...'));

      print(driverListData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Error')),
      );
      throw Exception("Something Error");
    }
  }







var reponseData;
  Future<ReadinessAddValueModels> postReadinessFormNewApi(Map<String, Object> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .post(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      reponseData=jsonDecode(res.body.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text("${reponseData['result']['message'].toString()}")),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReadinessPage()));
      return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Error')),
      );
      throw Exception("Failed to load ReadinessAddValueModels");
    }
  }

  Future<ReadinessAddValueModels> upDateReadinessApi(Map<String, Object?> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .patch(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Successfully Update...')),
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReadinessPage()));
      return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Error')),
      );
      throw Exception("Failed to load ReadinessAddValueModels");
    }
  }

  var dataTripId;
  Future<void> tripIdGetApiinReadinessFor() async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/TripListForReadnessAPI/"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      dataTripId = jsonDecode(res.body.toString());
      print(dataTripId);
    } else {
      print("Something Error in TripId");
    }
  }
  Future<void> tripIdGetApiinReadinessForFilter(String tripId1) async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/TripListForReadnessAPI/?id=$tripId1"),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      dataTripId = jsonDecode(res.body.toString());
      setState(() {
        tripId1=dataTripId['result'][0]['tripId'].toString();
        tripDetails=dataTripId['result'][0]['detail'].toString();

      });

      print('dataTripId$tripDetails$dataTripId hgghgjgjgjgjgj');
    } else {
      print("Something Error in TripId");
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

}
