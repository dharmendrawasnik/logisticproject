import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../ModelsPage/ReadinessNewdataAddFormModels.dart';
import '../Readiness_Details_Page/Readiness_Details_Page.dart';
import '../Readiness_page/Readiness_page.dart';

class ReadinessFormNew2 extends StatefulWidget {
  late String truckMantananceDate;
  late String fitness;
  late String driver1Name;
  late String driver2Name;
  late String driver1PhoneNo;
  late String driver2PhoneNo;
  late String cityDriverName;
  late String truckNo;
  late String modelYear;
  late String truckFuel;
  late String cityTruck;
  late String id;
  late String tripId;

  ReadinessFormNew2(
      {Key? key,
      required this.cityTruck,
      required this.truckMantananceDate,
      required this.fitness,
      required this.driver1Name,
      required this.driver2Name,
      required this.driver1PhoneNo,
      required this.driver2PhoneNo,
      required this.cityDriverName,
      required this.truckNo,
      required this.modelYear,
      required this.truckFuel,
        required this.tripId,
      required this.id
      })
      : super(key: key);

  @override
  State<ReadinessFormNew2> createState() => _ReadinessForm2State();
}

class _ReadinessForm2State extends State<ReadinessFormNew2> {
  final _formKey = GlobalKey<FormState>();
  List listName = ["A", "B", "C", "D", "E"];
  TextEditingController truckNumber = TextEditingController();
  TextEditingController cityDriverName = TextEditingController();
  TextEditingController cityTruck = TextEditingController();
  DateTime _dateTime = DateTime.now();
  late String truckMacYear = '';
  late String truckMac2Year = '';
  late String fitUnfit = "";
  late String fitUnfit1 = "";
  late String driver1Name = "";
  late String tripId1;
  late String tripDetails = "";

  late String driver2Name = "";
  late String driver3Name = "";
  var idReadiness;
  var tripId123;
  var driverId123;
  var driverNumber;
  var driver1Id;
  var driver2Id;
  var driver3Id;
  var driverListData;
  var driver1PhoneNo;
  var driver2PhoneNo;
  late String padLock = "";
  bool login = false;

  @override
  void initState() {
    tripDetails=widget.tripId.toString();
    truckMacYear = widget.truckMantananceDate.toString();
    truckMac2Year = widget.modelYear.toString();
    fitUnfit1 = widget.fitness.toString();
    driver1PhoneNo = widget.driver1PhoneNo;
    driver2PhoneNo = widget.driver2PhoneNo;
    driver1Name = widget.driver1Name.toString();
    tripId123=widget.tripId.toString();

    driver2Name = widget.driver2Name;
    driver3Name = widget.cityDriverName;
    truckNumber.text = widget.truckNo.toString();
    cityDriverName.text = widget.cityDriverName.toString();
    cityTruck.text = widget.cityTruck.toString();
    padLock = widget.truckFuel.toString();
    idReadiness = widget.id;

    driver1Id = widget.driver1Name.toString();
    driver2Id = widget.driver2Name.toString();
    driver3Id = widget.cityDriverName.toString();
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        // backgroundColor: Colors.w.withOpacity(0.2),
        title:
            Text((rediness == false) ? "ReadinessForm" : "EditReadinessForm"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                edgeOffset: 20,
                displacement: 20,
                strokeWidth: 2,
                color: Colors.blue,
                backgroundColor: Colors.white,
                onRefresh: _refresh,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(

                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2030))
                                          .then((value) {
                                        setState(() {
                                          _dateTime = value!;
                                          truckMacYear =
                                              _dateTime.day.toString() +
                                                  "/" +
                                                  _dateTime.month.toString() +
                                                  "/" +
                                                  _dateTime.year.toString();
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
                                    Text(truckMacYear.toString()),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TripID	",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: FutureBuilder(
                              future: tripIdGetApiinReadinessFor(tripId123),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Text(""),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none),
                                      autofocus: false,
                                      hint: SizedBox(
                                          width: 200,
                                          child: Text(
                                            (tripDetails.length > 0
                                                ? tripDetails
                                                : "Select"),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      // dropdownColor: Colors.pink.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),

                                      items: [
                                        for (var i = 0;
                                            i < dataTripId['result'].length;
                                            i++)
                                          DropdownMenuItem(
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                "${dataTripId['result'][i]['detail'].toString()}",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            value:
                                                "${dataTripId['result'][i]['id'].toString()}",
                                          ),
                                      ],
                                      onChanged: (String? value) {
                                        // setState(() {
                                        tripId1 = value.toString();
                                        for (var i = 0;
                                            i < dataTripId['result'].length;
                                            i++) {
                                          if (value ==
                                              "${dataTripId['result'][i]['id'].toString()}") {
                                            // tripId = value.toString();
                                            tripDetails =
                                                "${dataTripId['result'][i]['detail'].toString()}" ??
                                                    "";

                                            print("tripsId:-$tripId1");
                                          }
                                        }
                                        // }
                                        //  );
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " EQUIPMENT ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none
                                ),
                                autofocus: false,
                                hint: Text((fitUnfit1.length > 0)
                                    ? fitUnfit1
                                    : "Select"),
                                // dropdownColor: Colors.pink.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),

                                //  underline: Row(),

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
                                  // setState(() {
                                  if (value == "fit") {
                                    fitUnfit1 = "FIT";
                                  }
                                  if (value == "unfit") {
                                    fitUnfit1 = "UNFIT";
                                  }
                                  //   });
                                  print(fitUnfit);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DRIVER1 NAME	",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: FutureBuilder(
                              future: getDriverListApiFunction(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child:Text(""),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none
                                      ),
                                      autofocus: false,
                                      hint: Text((driver1Name.length > 0)
                                          ? "$driver1Name"
                                          : "Select"),
                                      // dropdownColor: Colors.pink.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),

                                      //   underline: Row(),

                                      items: [
                                        for (var i = 0;
                                            i < driverListData['result'].length;
                                            i++)
                                          DropdownMenuItem(
                                            child: Text(
                                                "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                                            value:
                                                "${driverListData['result'][i]['id'].toString()}",
                                          ),
                                      ],
                                      onChanged: (String? value) {
                                      setState(() {

                                        for (var i = 0;
                                            i < driverListData['result'].length;
                                            i++) {
                                          if (value ==
                                              "${driverListData['result'][i]['id'].toString()}") {
                                            driver1Id = driverListData['result']
                                                    [i]['id']
                                                .toString();
                                            driver1Name =
                                                "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}" ??
                                                    "";

                                            driver1PhoneNo =
                                                driverListData['result'][i]
                                                        ['mobileNo']
                                                    .toString();
                                            print(driver1Name);
                                            print(driver1PhoneNo);
                                          }
                                        }
                                        });
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DRIVER2 NAME",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: FutureBuilder(
                              future: getDriverListApiFunction(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Text(""),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none
                                      ),
                                      autofocus: false,
                                      hint: Text((driver2Name.length > 0)
                                          ? driver2Name
                                          : "Select"),
                                      // dropdownColor: Colors.pink.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),

                                      //  underline: Row(),

                                      items: [
                                        for (var i = 0;
                                            i < driverListData['result'].length;
                                            i++)
                                          DropdownMenuItem(
                                            child: Text(
                                                "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                                            value:
                                                "${driverListData['result'][i]['id'].toString()}",
                                          ),
                                      ],
                                      onChanged: (String? value) {
                                        setState(() {

                                        for (var i = 0;
                                            i < driverListData['result'].length;
                                            i++) {
                                          if (value ==
                                              "${driverListData['result'][i]['id'].toString()}") {
                                            driver2Id = driverListData['result']
                                                    [i]['id']
                                                .toString();
                                            driver2Name =
                                                "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";

                                            driver2PhoneNo =
                                                driverListData['result'][i]
                                                        ['mobileNo']
                                                    .toString();
                                            print(driver2Name);
                                            print(driver2PhoneNo);
                                          }
                                        }
                                          });
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                         Text(
                                            "$driver1PhoneNo",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DRIVER2 MobileNo",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                            "$driver2PhoneNo",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CITY DRIVER NAME(Optional)",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: FutureBuilder(
                              future: getDriverListApiFunction(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Text(''),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8),
                                    child: DropdownButtonFormField(

                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none
                                      ),
                                      autofocus: false,
                                      hint: Text((driver3Name.length > 0)
                                          ? driver3Name
                                          : "Select"),
                                      // dropdownColor: Colors.pink.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),

                                      items: [
                                        for (var i = 0;
                                            i < driverListData['result'].length;
                                            i++)
                                          DropdownMenuItem(
                                            child: Text(
                                                "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
                                            value:
                                                "${driverListData['result'][i]['id'].toString()}",
                                          ),
                                      ],
                                      onChanged: (String? value) {
                                       // setState(() {
                                          for (var i = 0;
                                              i <
                                                  driverListData['result']
                                                      .length;
                                              i++) {
                                            if (value ==
                                                "${driverListData['result'][i]['id'].toString()}") {
                                              driver3Id =
                                                  driverListData['result'][i]
                                                          ['id']
                                                      .toString();
                                              driver3Name =
                                                  "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";

                                              print(driver3Name);
                                            }
                                          }
                                        //});
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              if (value == null || value.isEmpty) {
                                return 'Please enter truckNumber text';
                              }
                              return null;
                            },
                            controller: truckNumber,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              if (value == null || value.isEmpty) {
                                return 'Please enter cityTruck text';
                              }
                              return null;
                            },
                            controller: cityTruck,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MODEL YEAR",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: DropdownButtonFormField(
                                borderRadius: BorderRadius.circular(10),
                                menuMaxHeight: 500,
                                decoration: InputDecoration(

                                  enabledBorder: InputBorder.none
                                ),
                                hint: Text((truckMac2Year.isNotEmpty)?truckMac2Year:"Select"),
                                items: [

                                  for(var i=0;i<=50;i++)
                                  DropdownMenuItem(

                                    child:Text("${1990+i}") ,
                                    value: "${1990+i}",

                                  )
                                ], onChanged: (Object? value) {
                                  setState(() {
                                    truckMac2Year=value.toString();
                                  });

                              },
                              ),
                            )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "TRUCK FUEL",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                height: 170,
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: Text("Yes"),
                                      value: "yes",
                                      groupValue: padLock,
                                      onChanged: (value) {
                                        setState(() {
                                          padLock = value.toString();

                                          print(padLock);
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: Text("No"),
                                      value: "no",
                                      groupValue: padLock,
                                      onChanged: (value) {
                                        setState(() {
                                          padLock = value.toString();

                                          print(padLock);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 330,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: (rediness == false)
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  // var driver0Id = driver1Id.toString();
                                  // var driver2 = driver2Id.toString();
                                  var data = {
                                    "truckMacYear": truckMacYear.toString(),
                                    "fitUnfit": fitUnfit1.toString(),
                                    "driver1Id": driver1Id.toString(),
                                    "driver2Id": driver2Id.toString(),
                                    "driver1PhoneNo": driver1PhoneNo.toString(),
                                    "driver2PhoneNo": driver2PhoneNo.toString(),
                                    "truckNumber": truckNumber.text.toString(),
                                    "cityDriverName": driver3Id.toString(),
                                    "cityTruck": cityTruck.text.toString(),
                                    "padLock": padLock.toString(),
                                    "truckMac2Year": truckMac2Year.toString(),
                                    "tripId": tripId1.toString(),
                                    "status": 1,
                                    "id": "",
                                  };

                                  print(data);

                                  if (truckMacYear.isNotEmpty &&
                                      truckMac2Year.isNotEmpty &&
                                      fitUnfit1.length > 0 &&
                                      driver1Name.length > 0 &&
                                      tripId1.length > 0 &&
                                      driver2Name.length > 0 &&
                                      driver2Name.length > 0 &&
                                      padLock.isNotEmpty) {
                                    if (_formKey.currentState!.validate()) {
                                      postReadinessFormNewApi(data);
                                      setState(() {
                                        login = true;
                                      });
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Invalid value...')),
                                    );
                                  }

                                  print(data);

                                  setState(() {
                                    Future.delayed(Duration(seconds: 3), () {
                                      setState(() {
                                        login = false;
                                      });
                                    });
                                  });
                                },
                                child: (login == false)
                                    ? Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  var data = {
                                    "truckMacYear": truckMacYear.toString(),
                                    "fitUnfit": fitUnfit1.toString(),
                                    "driver1Id": driver1Id.toString(),
                                    "driver2Id": driver2Id.toString(),
                                    "driver1PhoneNo": driver1PhoneNo.toString(),
                                    "driver2PhoneNo": driver2PhoneNo.toString(),
                                    "truckNumber": truckNumber.text.toString(),
                                    "cityDriverName": driver3Id.toString(),
                                    "cityTruck": cityTruck.text.toString(),
                                    "padLock": padLock.toString(),
                                    "tripId": tripId1.toString(),
                                    "truckMac2Year": truckMac2Year.toString(),
                                    "id": idReadiness.toString(),

                                    "status":1
                                  };

                                  print(data);

                                  if (truckMacYear.isNotEmpty &&
                                      truckMac2Year.isNotEmpty &&
                                      fitUnfit1.length > 0 &&
                                      tripId1.length > 0 &&
                                      driver1Name.length > 0 &&
                                      driver2Name.length > 0 &&
                                      driver2Name.length > 0 &&
                                      padLock.isNotEmpty) {
                                    if (_formKey.currentState!.validate()) {
                                      upDateReadinessApi(data);
                                      setState(() {
                                        login = true;
                                      });
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Invalid value...')),
                                    );
                                  }

                                  print(data);

                                  setState(() {
                                    Future.delayed(Duration(seconds: 3), () {
                                      setState(() {
                                        login = false;
                                      });
                                    });
                                  });
                                },
                                child: (login == false)
                                    ? Text(
                                        "Update",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )),
                              ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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

  Future<ReadinessAddValueModels> postReadinessFormNewApi(
      Map<String, Object> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .post(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
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

  Future<ReadinessAddValueModels> upDateReadinessApi(
      Map<String, Object> data) async {
    var data1 = jsonEncode(data);
    final res = await http
        .patch(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": token,
    });
    if (res.statusCode == 200) {
      Navigator.of(context).pop();
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

  var dataTripId;
  Future<void> tripIdGetApiinReadinessFor(tripId1) async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/TripListForReadnessAPI/?id=$tripId1"),
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





}
