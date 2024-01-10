import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../MaintananceDetailsPage/MaintananceDetailsPage.dart';
import '../Maintenance_Record_Page/Maintenance_Record_Page.dart';
import '../ModelsPage/VehicleIDPAge.dart';

class MaintenanceRecordFormPage extends StatefulWidget {
  final String driverLicense;
  final String vehiclesLicense;
  final String driverMediclaim;
  final String mantananceYear;
  final String insuranceYear;
  final String vehiclesMantananceYear;
  final String vehicleId;
  final String status;
  final String statusText;

  const MaintenanceRecordFormPage(
      {Key? key,
      required this.driverLicense,
      required this.vehiclesLicense,
      required this.driverMediclaim,
      required this.mantananceYear,
      required this.insuranceYear,
      required this.vehiclesMantananceYear,
      required this.vehicleId,
      required this.status,
      required this.statusText})
      : super(key: key);

  @override
  State<MaintenanceRecordFormPage> createState() =>
      _MaintenanceRecordFormPageState();
}

class _MaintenanceRecordFormPageState extends State<MaintenanceRecordFormPage> {
  final TextEditingController driverLicense = TextEditingController();
  final TextEditingController vehicleLicense = TextEditingController();
  final TextEditingController insurance = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String time1 = '';
  late String time2 = '';
  late String timer3 = '';
  DateTime _dateTime = DateTime.now();
  var yes = "Yes";
  var no = "No";
  var driverMediclain;
  var driverMediclain1;

  var vehicleMaitananceYear;
  var status;
  var statusText1;
  var vehicleId1;
  var vehicleText;
  bool vbtn = false;
  bool mClaim = false;
  bool status123 = false;
  @override
  void initState() {
    getVehicleIdApi();
    driverLicense.text = widget.driverLicense;
    vehicleLicense.text = widget.vehiclesLicense;
    insurance.text = widget.insuranceYear;
    driverMediclain = widget.driverMediclaim;
    vehicleId1 = widget.vehicleId;
    time1 = widget.mantananceYear;
    time2 = widget.vehiclesMantananceYear;
    status = widget.status;
    statusText1 = widget.statusText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text((maaitUbtn == true)
              ? " Maintenance Record Update "
              : "Add New Maintenance Record"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller: driverLicense,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter driver license';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "driver license here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller: vehicleLicense,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter vehicle license';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "vehicle license here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Driver Mediclaim",
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
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              DropdownButton(
                                underline: Row(),
                                borderRadius: BorderRadius.circular(10),
                                hint: Text((mClaim == true)
                                    ? driverMediclain
                                    : "Select"),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(no),
                                    value: "No",
                                  ),
                                  DropdownMenuItem(
                                    child: Text(yes),
                                    value: "Yes",
                                  )
                                ],
                                onChanged: (value) {
                                  print(value);

                                  setState(() {
                                    mClaim = true;
                                    driverMediclain = value.toString();
                                    if (value == "No") {
                                      driverMediclain = "No";
                                    }
                                    if (value == "Yes") {
                                      driverMediclain = "Yes";
                                    }
                                  });
                                },
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
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
                                        time1 = _dateTime.year.toString();

                                        print(time1.toString());
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
                                  Text(time1.toString()),
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
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          keyboardType: TextInputType.number,
                          controller: insurance,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter insurance';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: " Enter insurance ",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
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
                                        time2 = _dateTime.day.toString() +
                                            "/" +
                                            _dateTime.month.toString() +
                                            "/" +
                                            _dateTime.year.toString();
                                        print(time2.toString());
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
                                  Text(time2.toString()),
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
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              return ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        DropdownButton(
                                          underline: Row(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          hint: Text((vbtn == true)
                                              ? vehicleText
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
                                            setState(() {
                                              vbtn = true;
                                              for (var i = 0;
                                                  i <
                                                      snapshot.data!.result!
                                                          .result!.length;
                                                  i++) {
                                                if (snapshot.data!.result!
                                                        .result![i].id
                                                        .toString() ==
                                                    value) {
                                                  vehicleText = snapshot
                                                      .data!
                                                      .result!
                                                      .result![i]
                                                      .trailerName
                                                      .toString();
                                                }
                                              }
                                            });
                                            vehicleId1 = value;
                                            print(vehicleText);
                                          },
                                        ),
                                      ],
                                    ),
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
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                              ),
                              DropdownButton(
                                underline: Row(),
                                borderRadius: BorderRadius.circular(10),
                                hint: Text((status123 == true)
                                    ? statusText1
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
                                    status123 = true;
                                    if (value == "1") {
                                      statusText1 = "Active";
                                      status = value;
                                    }
                                    if (value == "0") {
                                      statusText1 = "Inactive";
                                      status = value;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 330,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.lightBlue,
                              Colors.white,
                              Colors.lightBlue
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: (maaitUbtn == true)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                var data = {
                                  "vehicleLicense":
                                      vehicleLicense.text.toString(),
                                  "driverLicense":
                                      driverLicense.text.toString(),
                                  "driverMediclaim": driverMediclain.toString(),
                                  "maintenanceYear": time1.toString(),
                                  "insurance": insurance.text.toString(),
                                  "vehicleMaintainance": time2.toString(),
                                  "statusText": statusText1.toString(),
                                  "status": status.toString(),
                                  "vehicleId": vehicleId1.toString(),
                                  "id": "",
                                };

                                if (_formKey.currentState!.validate()) {
                                  upDateMaitananceRecordApi(data);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text('Invalid value')),
                                  );
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                var data = {
                                  "vehicleLicense":
                                      vehicleLicense.text.toString(),
                                  "driverLicense":
                                      driverLicense.text.toString(),
                                  "driverMediclaim": driverMediclain.toString(),
                                  "maintenanceYear": time1.toString(),
                                  "insurance": insurance.text.toString(),
                                  "vehicleMaintainance": time2.toString(),
                                  "statusText": statusText1.toString(),
                                  "status": status.toString(),
                                  "vehicleId": vehicleId1.toString(),
                                  "id": "",
                                  "maintenanceDocument": "",
                                };

                                if (_formKey.currentState!.validate()) {
                                  postMaintananceRecordAip(data);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text('Invalid value')),
                                  );
                                }
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MaintenanceRecordPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success...')),
      );
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
