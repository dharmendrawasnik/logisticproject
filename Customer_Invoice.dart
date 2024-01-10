import 'package:flutter/material.dart';

import '../Add_New_Customer_Invoice_Page/Add_New_Customer_Invoice_Page.dart';
import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';
import '../Invoice_Details_page/Invoice_Details_Page.dart';

class CustomerInvoicePage extends StatefulWidget {
  const CustomerInvoicePage({Key? key}) : super(key: key);

  @override
  State<CustomerInvoicePage> createState() => _CustomerInvoicePageState();
}

class _CustomerInvoicePageState extends State<CustomerInvoicePage> {
  final _formKey = GlobalKey<FormState>();
  String? driverMediclaim = "";
  final TextEditingController vehicleLicence = TextEditingController();
  final TextEditingController vehicleLicLicence = TextEditingController();
  final TextEditingController insurance = TextEditingController();
  final TextEditingController maintenance = TextEditingController();
  double constomeInvoiceAddForm = 1200;
  double customerInvoiceDetails = 1200;
  bool customerInvoiceCircleIndicator = false;

  String? status = "";
  String? statusText = '';

  Future<void> _refresh() async {
    setState(() {});
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
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
              title: Text("Customer Invoice"),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        constomeInvoiceAddForm = 0;
                        customerInvoiceDetails = 1200;
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
                SingleChildScrollView(
                  child: RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    edgeOffset: 20,
                    displacement: 20,
                    strokeWidth: 2,
                    color: Colors.blue,
                    backgroundColor: Colors.white,
                    onRefresh: _refresh,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
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
                                height: 150,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              bottomRight:
                                                  Radius.circular(200))),
                                    ),
                                    Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(200))),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 170,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Date",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "09-11-2021",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Text(
                                                  "Price",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "14,000",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 85,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.indigo,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25))),
                                            onPressed: () {
                                              // NotificationService().showNotification(
                                              //     title:"Simple Information" ,body:"Please fill this form 12 hours ago"
                                              // );

                                              setState(() {
                                                customerInvoiceDetails = 0;
                                                constomeInvoiceAddForm = 1200;
                                              });
                                            },
                                            child: Text("View"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                AnimatedPositioned(
                  top: constomeInvoiceAddForm,
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 25),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                constomeInvoiceAddForm = 1200;

                                                vehicleLicence.clear();

                                                vehicleLicLicence.clear();
                                                insurance.clear();

                                                driverMediclaim = '';
                                                maintenance.clear();
                                                status = "";
                                                statusText = '';
                                              });
                                            },
                                            icon: Icon(Icons
                                                .arrow_back_ios_new_outlined)),
                                        Text(
                                          'Customer Invoice Form',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 45,
                                    ),
                                    Text(
                                      "Vehicle License",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      controller: vehicleLicence,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Vehicle License ';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Vehicle License Here",
                                          labelText: "Vehicle License",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "VehicleLic License ",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      controller: vehicleLicLicence,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter VehicleLic License ';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "VehicleLic License Here ",
                                          labelText: "VehicleLic License ",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Insurance",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      controller: insurance,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Insurance';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Insurance",
                                          labelText: "Insurance Here",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "DriverMedical",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    DropdownButtonFormField(
                                      borderRadius: BorderRadius.circular(15),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      hint: Text('Select Driver Medical'),
                                      items: [
                                        DropdownMenuItem(
                                          value: "yes",
                                          child: Text("Yes"),
                                        ),
                                        DropdownMenuItem(
                                          value: "no",
                                          child: Text("No"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          if (value == "yes") {
                                            driverMediclaim = "Yes";
                                          } else {
                                            driverMediclaim = "No";
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Maintenance Year",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      controller: maintenance,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Maintenance Year';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Maintenance Year Here",
                                          labelText: "Maintenance Year",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    DropdownButtonFormField(
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      hint: Text("Status"),
                                      items: [
                                        DropdownMenuItem(
                                          value: "active",
                                          child: Text("Active"),
                                        ),
                                        DropdownMenuItem(
                                          value: "inactive",
                                          child: Text("Inactive"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        print(value);
                                        if (value.toString() == '1') {
                                          status = '1';
                                          statusText = 'Active';
                                        }
                                        if (value.toString() == '0') {
                                          status = '0';
                                          statusText = 'Inactive';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      customerInvoiceCircleIndicator = true;
                                    });

                                    Future.delayed(Duration(seconds: 3), () {
                                      setState(() {
                                        customerInvoiceCircleIndicator = false;
                                      });
                                    });
                                    var data = {
                                      'vihecleLicense':
                                          vehicleLicence.text.toString(),
                                      'vihecleLicLicense':
                                          vehicleLicLicence.text.toString(),
                                      'insurance': insurance.text.toString(),
                                      'driverMedical':
                                          driverMediclaim.toString(),
                                      'maintananceYear':
                                          maintenance.text.toString(),
                                      'status': status.toString(),
                                      'driverMediclaim':
                                          driverMediclaim.toString(),
                                      'statusText': statusText.toString()
                                    };

                                    print(data);
                                    if (vehicleLicence.text.isNotEmpty &&
                                        vehicleLicLicence.text.isNotEmpty &&
                                        insurance.text.isNotEmpty &&
                                        driverMediclaim!.isNotEmpty &&
                                        maintenance.text.isNotEmpty &&
                                        status!.isNotEmpty &&
                                        driverMediclaim!.isNotEmpty &&
                                        statusText!.isNotEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                'there are api not available')),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                'fill all required fields')),
                                      );
                                    }
                                  },
                                  child: Container(
                                    child: Center(
                                        child: customerInvoiceCircleIndicator
                                            ? SizedBox(
                                                height: 25,
                                                width: 25,
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : Text(
                                                'Submit',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
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
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 150,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: customerInvoiceDetails,
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 50,),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        customerInvoiceDetails = 1200;
                                      });
                                    },
                                    icon: Icon(
                                        Icons.arrow_back_ios_new_outlined)),
                                Text(
                                  'Customer Invoice Details',
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice#",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "PNY46545645Nb",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "09-11-2023",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice To",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "CYTS009776LKA",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Address ",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "ganesh Nagar,Gujrat",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Deliery",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Indore-Bhopal",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "14,000",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
                                    )),
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Drivers Charges",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "2,000",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "4,000",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                      "20,000",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 60,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //       customerInvoiceCircleIndicator = true;
                            //     });
                            //
                            //     Future.delayed(Duration(seconds: 3), () {
                            //       setState(() {
                            //         customerInvoiceCircleIndicator = false;
                            //       });
                            //     });
                            //     var data = {
                            //       'vihecleLicense':
                            //           vehicleLicence.text.toString(),
                            //       'vihecleLicLicense':
                            //           vehicleLicLicence.text.toString(),
                            //       'insurance': insurance.text.toString(),
                            //       'driverMedical': driverMediclaim.toString(),
                            //       'maintananceYear':
                            //           maintenance.text.toString(),
                            //       'status': status.toString(),
                            //       'driverMediclaim': driverMediclaim.toString(),
                            //       'statusText': statusText.toString()
                            //     };
                            //     print(data);
                            //   },
                            //   child: Container(
                            //     child: Center(
                            //         child: customerInvoiceCircleIndicator
                            //             ? SizedBox(
                            //                 height: 25,
                            //                 width: 25,
                            //                 child: CircularProgressIndicator(),
                            //               )
                            //             : Text(
                            //                 'Submit',
                            //                 style: TextStyle(
                            //                     fontSize: 25,
                            //                     fontWeight: FontWeight.bold),
                            //               )),
                            //     width: size.width,
                            //     height: 60,
                            //     decoration: BoxDecoration(
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: Colors.white10,
                            //               offset: Offset(5, 5),
                            //               blurRadius: 15,
                            //               spreadRadius: 1),
                            //           BoxShadow(
                            //               color: Colors.grey,
                            //               offset: Offset(-5, -5),
                            //               blurRadius: 15,
                            //               spreadRadius: 1),
                            //         ],
                            //         borderRadius: BorderRadius.circular(15),
                            //         color: Colors.white),
                            //   ),
                            // ),
                            SizedBox(
                              height: 150,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

// class NotificationService{
//   final FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
//
//
//
//   Future<void> initNotification()async{
//     AndroidInitializationSettings initializationSettingsAndroid=const AndroidInitializationSettings("image");
//
//
//     var initializationSettingsIOS=DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id,String? title, String? body,String? payload)async{});
//
//     var initialazationSettings=InitializationSettings(
//         android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initialazationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse)async{});
//   }
//   notificationDetails(){
//     return const NotificationDetails(
//         android:  AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }
//
//
//   Future showNotification({int id=0,String? title,String? body,String? payLoad})async{
//     return notificationsPlugin.show(id, title, body, await notificationDetails());
//   }
// }
