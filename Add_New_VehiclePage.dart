import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../VehiclesPage/VehiclesPage.dart';
import 'Add_New_VehiclePage.dart';

class AddNewVehiclesPage extends StatefulWidget {
  final String frontDesk;
  final String mainDeskDetail1;
  final String maxFreightWeight1;
  final String realDeskDetail1;
  final String trailerGPS1;
  final String trailerLastAnnualSafetyCheck1;
  final String trailerLastPreventiveMaintenance1;
  final String trailerNumber1;
  final String trailerMakeYear1;
  final String truckGPS1;
  final String truckLastAnnualSafetyCheck1;
  final String truckNumber1;
  final String truckLastPreventiveMaintenance1;
  final String truckMakeYear1;
  final String status2;
  final String trailerNumber2;
  final String id1;
  final String btn;
  AddNewVehiclesPage({
    Key? key,
    required this.frontDesk,
    required this.mainDeskDetail1,
    required this.maxFreightWeight1,
    required this.realDeskDetail1,
    required this.trailerGPS1,
    required this.trailerLastAnnualSafetyCheck1,
    required this.trailerLastPreventiveMaintenance1,
    required this.trailerNumber1,
    required this.trailerMakeYear1,
    required this.truckGPS1,
    required this.truckLastAnnualSafetyCheck1,
    required this.truckNumber1,
    required this.truckLastPreventiveMaintenance1,
    required this.truckMakeYear1,
    required this.status2,
    required this.trailerNumber2,
    required this.id1, required this.btn,
  }) : super(key: key);

  @override
  State<AddNewVehiclesPage> createState() => _AddNewVehiclesPageState();
}

class _AddNewVehiclesPageState extends State<AddNewVehiclesPage> {
  bool loader=false;
  bool loader1=false;
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
// final TextEditingController trailerName = TextEditingController();
  var status1;
  var trailerNumber1;

  var trailerName;
  var trailerId;
  var trailerNameData;
  var status2;
  var valueStatus1;
  var valueTN1;
  var valueStatus;
  var valueTN;
var id;
var btn1="Add New Vehicles";

bool seStatus=false;
  bool vehicleID1=false;
  var vehicleID2;
var seStatus1;
  _AddNewVehiclesPageState();

  @override
  initState() {
    frontDeskDetail.text = widget.frontDesk;
    mainDeskDetail.text = widget.mainDeskDetail1;
    maxFreightWeight.text = widget.maxFreightWeight1;
    realDeskDetail.text = widget.realDeskDetail1;
    trailerGPS.text = widget.trailerGPS1;
    trailerLastAnnualSafetyCheck.text = widget.trailerLastAnnualSafetyCheck1;
    trailerLastPreventiveMaintenance.text =
        widget.trailerLastPreventiveMaintenance1;
    trailerNumber.text = widget.trailerNumber1;
    trailerMakeYear.text = widget.trailerMakeYear1;
    truckGPS.text = widget.truckGPS1;
    truckLastAnnualSafetyCheck.text = widget.truckLastAnnualSafetyCheck1;
    truckNumber.text = widget.truckNumber1;
    truckLastPreventiveMaintenance.text =
        widget.truckLastPreventiveMaintenance1;
    truckMakeYear.text = widget.truckMakeYear1;
    status1 = widget.status2;
    trailerName = widget.trailerNumber2;
    id=widget.id1;
    btn1=widget.btn;
    getVihicleApi();
   // getTrailerNameApi();

    super.initState();
  }

  Future<void> getVihicleApi() async {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(

      appBar: AppBar(
        title: Text(btn1)
           ,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1700,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Front Desk Detail",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Main Desk Detail",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MaxFreight Weight",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Real Desk Detail",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer GPS",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer Last Annual Safety Check",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: trailerLastAnnualSafetyCheck,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Trailer Last Annual Safety Check';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Type her",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer Last Preventive Maintenance",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: trailerLastPreventiveMaintenance,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Trailer Last Preventive Maintenance';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Type her",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer Number",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer Make Year",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Truck GPS",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Truck Last Annual Safety Check",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Truck Number",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Truck Last Preventive Maintenance",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: truckLastPreventiveMaintenance,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Truck Last Preventive Maintenance';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Type her",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Truck Make Year",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
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
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trailer Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      FutureBuilder(
                      //    future: getTrailerNameApi(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Text("Loading..."),
                              );
                            } else {
                              return Container(
                                width: 330,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    DropdownButton<String>(
                                      hint: Text((vehicleID1==true)?vehicleID2:"Select Id"),
                                      underline: Row(),
                                      elevation: 0,
                                      items: [
                                        for (var i = 0;
                                            i <
                                                trailerNameData["result"]
                                                        ["Result"]
                                                    .length;
                                            i++)
                                          DropdownMenuItem<String>(
                                            value: trailerNameData["result"]["Result"][i]["id"]
                                                .toString(),
                                            child: Center(
                                              child: Text(
                                                  trailerNameData["result"]["Result"][i]["trailerName"].toString()),
                                            ),
                                          ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          vehicleID1=true;
                                          valueTN1 = value.toString();
                                          for (var i = 0; i < trailerNameData["result"]["Result"].length;i++){
                                            if(trailerNameData["result"]["Result"][i]["id"]==value){
                                              vehicleID2=trailerNameData["result"]["Result"][i]["trailerName"].toString();
                                            }
                                          }
                                        });

                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                            ),
                            DropdownButton<String>(
                              underline: Row(),
                              hint: Text((seStatus==true)?seStatus1:"Select")
                                  ,
                              elevation: 0,
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Center(
                                    child: Text("Active"),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "0",
                                  child: Center(
                                    child: Text("Inactive"),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                 // valueStatus = status1.toString();
                                 setState(() {
                                   if(value=="1"){
                                     seStatus1="Active";
                                   }if(value=="0"){
                                     seStatus1="Inactive";
                                   }
                                   seStatus=true;
                                 valueStatus1= value.toString();
                                 });
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 330,
                    height: 50,
                    child:(btn1=="Update")? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        var data = {
                          "frontDeskDetail":frontDeskDetail.text.toString(),
                          "mainDeskDetail":mainDeskDetail.text.toString(),
                          "maxFreightWeight": maxFreightWeight.text.toString(),
                          "rearDeskDetail":realDeskDetail.text.toString(),
                          "trailerGPS":trailerGPS.text.toString(),
                          "trailerLastAnnualSafetyCheck": trailerLastAnnualSafetyCheck.text.toString(),
                          "trailerLastPreventiveMaintenance": trailerLastPreventiveMaintenance.text.toString(),
                          "trailerNumber": trailerNumber.text.toString(),
                          "trailermakeYear":trailerMakeYear.text.toString(),
                          "truckGPS": truckGPS.text.toString(),
                          "truckLastAnnualSafetyCheck":truckLastAnnualSafetyCheck.text.toString(),
                          "truckNumber":truckNumber.text.toString(),
                          "trucklastPreventiveMaintenance":  truckLastPreventiveMaintenance.text.toString(),
                          "truckmakeYear": truckMakeYear.text.toString(),
                          "statusText":valueStatus1.toString(),
                          "trailerName":valueTN1.toString(),
                          "id":id
                        };

                       // upDateVehiclesApi(data,id);

                        if (_formKey.currentState!.validate()) {

                        } else {

                        }
                      },
                      child: Text("$btn1"
                        ,
                        style: TextStyle(fontSize: 18),
                      ),
                    ):
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        var data = {
                          "frontDeskDetail":frontDeskDetail.text.toString(),
                          "mainDeskDetail":mainDeskDetail.text.toString(),
                          "maxFreightWeight": maxFreightWeight.text.toString(),
                          "rearDeskDetail":realDeskDetail.text.toString(),
                          "trailerGPS":trailerGPS.text.toString(),
                          "trailerLastAnnualSafetyCheck": trailerLastAnnualSafetyCheck.text.toString(),
                          "trailerLastPreventiveMaintenance": trailerLastPreventiveMaintenance.text.toString(),
                          "trailerNumber": trailerNumber.text.toString(),
                          "trailermakeYear":trailerMakeYear.text.toString(),
                          "truckGPS": truckGPS.text.toString(),
                          "truckLastAnnualSafetyCheck":truckLastAnnualSafetyCheck.text.toString(),
                          "truckNumber":truckNumber.text.toString(),
                          "trucklastPreventiveMaintenance":  truckLastPreventiveMaintenance.text.toString(),
                          "truckmakeYear": truckMakeYear.text.toString(),
                          "statusText":valueStatus1.toString(),
                          "trailerName":valueTN1.toString(),
                          "id":id
                        };



                        if (_formKey.currentState!.validate()) {
                         // postTrailerNameApi(data);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(backgroundColor: Colors.green,
                                  content: Text('Invalid Value')));
                        }
                      },
                      child: Text("$btn1"
                        ,
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

}
