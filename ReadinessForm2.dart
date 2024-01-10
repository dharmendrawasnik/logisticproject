// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../ApiConttrollerPage/ApiControllerPage.dart';
// import '../BottomBarPage/BottomBarPage.dart';
// import '../ModelsPage/ReadinessNewdataAddFormModels.dart';
// import '../Trips/Trips.dart';
//
// //bool update = false;
//
// class ReadinessForm2 extends StatefulWidget {
//   final String truckMacYear;
//   final String fitUnfit;
//   final String driver1Id;
//   final String driver2Id;
//
//   final String driver1PhoneNo;
//   final String driver2PhoneNo;
//   final String truckNumber;
//   final String cityDriverName;
//   final String driver1Name;
//   final String driver2Name;
//
//   final String cityTruck;
//   final String padLock;
//   final String truckMac2Year;
//
//   final String id;
//   final String tripId;
//   final String driverID;
//   const ReadinessForm2({
//     super.key,
//     required this.id,
//     required this.tripId,
//     required this.driverID,
//     required this.truckMacYear,
//     required this.fitUnfit,
//     required this.driver1Id,
//     required this.driver1PhoneNo,
//     required this.driver2PhoneNo,
//     required this.truckNumber,
//     required this.cityDriverName,
//     required this.cityTruck,
//     required this.padLock,
//     required this.truckMac2Year,
//     required this.driver1Name,
//     required this.driver2Name,
//     required this.driver2Id,
//   });
//
//   @override
//   State<ReadinessForm2> createState() => _ReadinessForm2State();
// }
//
// class _ReadinessForm2State extends State<ReadinessForm2> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController truckNumber = TextEditingController();
//   TextEditingController cityDriverName = TextEditingController();
//   TextEditingController cityTruck = TextEditingController();
//   DateTime _dateTime = DateTime.now();
//   late String truckMacYear = '';
//   late String truckMac2Year = '';
//   late String fitUnfit = "Select";
//   late String fitUnfit1 = "Select";
//   late String driver1Name = "Select";
//   late String driver2Name = "Select";
//   late String driver3Name = "Select";
//   var id3;
//   var id1;
//   var tripId123;
//   var driverId123;
//   var driverNumber;
//   var driver1Id;
//   var driver2Id;
//   var driver3Id;
//   var driverListData;
//   String driver1PhoneNo = "";
//   String driver2PhoneNo = "";
//   late String padLock = "";
//   bool login = false;
//   @override
//   String idTrips = "";
//   void initState() {
//     id3 = widget.id.toString();
//     // driver1Id=widget.driver1Id.toString();
//     // driver2Id=widget.driver2Id.toString();
//     //
//     // driver1PhoneNo=widget.driver1PhoneNo.toString();
//     // driver2PhoneNo=widget.driver2PhoneNo.toString();
//     // driver1Name=widget.driver1Name.toString();
//     // driver2Name=widget.driver2Name.toString();
//     // truckNumber.text=widget.truckNumber.toString();
//     // id1 = widget.id.toString();
//     tripId123 = widget.tripId.toString();
//     // driverId123 = widget.driverID.toString();
//     super.initState();
//     getReadinessData(tripId123);
//   }
//
//   Future<void> _refresh() async {
//     setState(() {});
//   }
//
//   var redinessData;
//   Future<void> getReadinessData(tripId123) async {
//     final res = await http.get(
//         Uri.parse(
//             'https://canadalogistic.metalsart.in/dispatcherApp/ReadinessFormAPI/?tripId=$tripId123'),
//         headers: {
//           "Authorization": token,
//         });
//     if (res.statusCode == 200) {
//       redinessData = jsonDecode(res.body.toString());
//       setState(() {
//         driver1Name =
//             "${redinessData['result']['Result'][0]['driver1Name'].toString()}";
//         driver2Name =
//             "${redinessData['result']['Result'][0]['driver2Name'].toString()}";
//         truckMacYear =
//             "${redinessData['result']['Result'][0]['truckMacYear'].toString()}";
//         fitUnfit =
//             "${redinessData['result']['Result'][0]['fitUnfit'].toString()}";
//         fitUnfit1 =
//             "${redinessData['result']['Result'][0]['fitUnfit'].toString()}";
//         driver1PhoneNo =
//             "${redinessData['result']['Result'][0]['driver1PhoneNo'].toString()}";
//         driver2PhoneNo =
//             "${redinessData['result']['Result'][0]['driver2PhoneNo'].toString()}";
//
//         driver1Id =
//             "${redinessData['result']['Result'][0]['driver1Id'].toString()}";
//         driver2Id =
//             "${redinessData['result']['Result'][0]['driver2Id'].toString()}";
//         id1 = "${redinessData['result']['Result'][0]['id'].toString()}";
//
//         driver3Id =
//             "${redinessData['result']['Result'][0]['cityDriverName'].toString()}";
//
//         driver3Name =
//             "${redinessData['result']['Result'][0]['cityDrivername'].toString()}";
//
//         truckNumber.text =
//             "${redinessData['result']['Result'][0]['truckNumber'].toString()}";
//         cityTruck.text =
//             "${redinessData['result']['Result'][0]['cityTruck'].toString()}";
//         truckMac2Year =
//             "${redinessData['result']['Result'][0]['truckMac2Year'].toString()}";
//         padLock =
//             "${redinessData['result']['Result'][0]['padLock'].toString()}";
//       });
//     } else {
//       print("Something Error");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         // backgroundColor: Colors.w.withOpacity(0.2),
//         title: Text("ReadinessForm"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//         child: SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.8),
//                 borderRadius: BorderRadius.circular(15)),
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: RefreshIndicator(
//                 triggerMode: RefreshIndicatorTriggerMode.anywhere,
//                 edgeOffset: 20,
//                 displacement: 20,
//                 strokeWidth: 2,
//                 color: Colors.blue,
//                 backgroundColor: Colors.white,
//                 onRefresh: _refresh,
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "LAST MAINTANANCE ",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                             height: 55,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       showDatePicker(
//                                               context: context,
//                                               initialDate: DateTime.now(),
//                                               firstDate: DateTime(1990),
//                                               lastDate: DateTime(2050))
//                                           .then((value) {
//                                         setState(() {
//                                           _dateTime = value!;
//                                           truckMacYear =
//                                               _dateTime.day.toString() +
//                                                   "/" +
//                                                   _dateTime.month.toString() +
//                                                   "/" +
//                                                   _dateTime.year.toString();
//                                           print(
//                                               'truckMakingYear:-${truckMacYear.toString()}');
//                                         });
//                                       });
//                                     },
//                                     icon: Icon(
//                                       Icons.calendar_today,
//                                       color: Colors.red,
//                                     )),
//                                 Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Text(truckMacYear.toString()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             " EQUIPMENT ",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.grey)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                     enabledBorder: InputBorder.none),
//                                 autofocus: false,
//                                 hint: Text((fitUnfit1 != null)
//                                     ? "$fitUnfit1"
//                                     : "Select"),
//                                 // dropdownColor: Colors.pink.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(15),
//
//                                 items: [
//                                   DropdownMenuItem(
//                                     child: Text("FIT"),
//                                     value: "fit",
//                                   ),
//                                   DropdownMenuItem(
//                                     child: Text("UNFIT"),
//                                     value: "unfit",
//                                   ),
//                                 ],
//                                 onChanged: (String? value) {
//                                   fitUnfit1 = value.toString();
//                                   print(fitUnfit);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "DRIVER1 NAME	",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.grey)),
//                             child: FutureBuilder(
//                               future: getDriverListApiFunction(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                     child: Text(""),
//                                   );
//                                 } else {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: DropdownButtonFormField(
//                                       decoration: InputDecoration(
//                                           enabledBorder: InputBorder.none),
//                                       autofocus: false,
//                                       hint: Text((driver1Name.length > 0)
//                                           ? driver1Name
//                                           : "Select"),
//                                       // dropdownColor: Colors.pink.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(15),
//
//                                       items: [
//                                         for (var i = 0;
//                                             i < driverListData['result'].length;
//                                             i++)
//                                           DropdownMenuItem(
//                                             child: Text(
//                                                 "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
//                                             value:
//                                                 "${driverListData['result'][i]['id'].toString()}",
//                                           ),
//                                       ],
//                                       onChanged: (String? value) {
//                                         setState(() {});
//                                         setState(() {
//                                           for (var i = 0;
//                                               i <
//                                                   driverListData['result']
//                                                       .length;
//                                               i++) {
//                                             if (value ==
//                                                 "${driverListData['result'][i]['id'].toString()}") {
//                                               driver1Id =
//                                                   driverListData['result'][i]
//                                                           ['id']
//                                                       .toString();
//                                               driver1Name =
//                                                   "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}" ??
//                                                       "";
//
//                                               driver1PhoneNo =
//                                                   driverListData['result'][i]
//                                                           ['mobileNo']
//                                                       .toString();
//
//                                               print(driver1Name);
//                                               print(driver1PhoneNo);
//                                             }
//                                           }
//                                         });
//                                       },
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "DRIVER2 NAME",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.grey)),
//                             child: FutureBuilder(
//                               future: getDriverListApiFunction(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                     child: Text(""),
//                                   );
//                                 } else {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: DropdownButtonFormField(
//                                       decoration: InputDecoration(
//                                           enabledBorder: InputBorder.none),
//                                       autofocus: false,
//                                       hint: Text((driver2Name != "null")
//                                           ? driver2Name
//                                           : "Select"),
//                                       // dropdownColor: Colors.pink.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(15),
//
//                                       items: [
//                                         for (var i = 0;
//                                             i < driverListData['result'].length;
//                                             i++)
//                                           DropdownMenuItem(
//                                             child: Text(
//                                                 "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
//                                             value:
//                                                 "${driverListData['result'][i]['id'].toString()}",
//                                           ),
//                                       ],
//                                       onChanged: (String? value) {
//                                         setState(() {
//                                           for (var i = 0;
//                                               i <
//                                                   driverListData['result']
//                                                       .length;
//                                               i++) {
//                                             if (value ==
//                                                 "${driverListData['result'][i]['id'].toString()}") {
//                                               driver2Id =
//                                                   driverListData['result'][i]
//                                                           ['id']
//                                                       .toString();
//                                               driver2Name =
//                                                   "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";
//
//                                               driver2PhoneNo =
//                                                   driverListData['result'][i]
//                                                           ['mobileNo']
//                                                       .toString();
//
//                                               print(driver2Name);
//                                               print(driver2PhoneNo);
//                                             }
//                                           }
//                                         });
//                                       },
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "DRIVER1 MobileNo",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                               height: 55,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.grey)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       '$driver1PhoneNo',
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "DRIVER2 MobileNo",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                               height: 60,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.grey)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "$driver2PhoneNo"!,
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "CITY DRIVER NAME(Optional)",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                             height: 60,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.grey)),
//                             child: FutureBuilder(
//                               future: getDriverListApiFunction(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                     child: Text(''),
//                                   );
//                                 } else {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: DropdownButtonFormField(
//                                       menuMaxHeight: 500,
//                                       decoration: InputDecoration(
//                                           enabledBorder: InputBorder.none),
//                                       autofocus: false,
//                                       hint: Text((driver3Name != null)
//                                           ? driver3Name
//                                           : "Select"),
//                                       // dropdownColor: Colors.pink.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(15),
//
//                                       items: [
//                                         for (var i = 0;
//                                             i < driverListData['result'].length;
//                                             i++)
//                                           DropdownMenuItem(
//                                             child: Text(
//                                                 "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}"),
//                                             value:
//                                                 "${driverListData['result'][i]['id'].toString()}",
//                                           ),
//                                       ],
//                                       onChanged: (String? value) {
//                                         setState(() {
//                                           for (var i = 0;
//                                               i <
//                                                   driverListData['result']
//                                                       .length;
//                                               i++) {
//                                             if (value ==
//                                                 "${driverListData['result'][i]['id'].toString()}") {
//                                               driver3Id =
//                                                   driverListData['result'][i]
//                                                           ['id']
//                                                       .toString();
//                                               driver3Name =
//                                                   "${driverListData['result'][i]['firstName'].toString()}${" "}${driverListData['result'][i]['lastName'].toString()}";
//
//                                               print(driver3Name);
//                                             }
//                                           }
//                                         });
//                                       },
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Truck Number"!,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           TextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter truckNumber text';
//                               }
//                               return null;
//                             },
//                             controller: truckNumber,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "CITY TRUCK",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           TextFormField(
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter cityTruck text';
//                               }
//                               return null;
//                             },
//                             controller: cityTruck,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "MODEL YEAR",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Container(
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 8, right: 8),
//                                 child: DropdownButtonFormField(
//                                   menuMaxHeight: 500,
//                                   borderRadius: BorderRadius.circular(10),
//                                   dropdownColor: Colors.blue[50],
//
//                                   decoration: InputDecoration(
//                                       enabledBorder: InputBorder.none),
//                                   hint: Text((truckMac2Year != null)
//                                       ? "$truckMac2Year"
//                                       : "Select"),
//                                   // icon: Icon(Icons.calendar_today,
//                                   //     color: Colors.red),
//                                   items: [
//                                     for (int i = 0; i <= 50; i++)
//                                       DropdownMenuItem(
//                                         child: Text(
//                                           "${1998 + i}",
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                         value: "${1998 + i}",
//                                       )
//                                   ],
//                                   onChanged: (value) {
//                                     truckMac2Year = value.toString();
//                                   },
//                                 ),
//                               )
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               //   children: [
//                               //     IconButton(
//                               //         onPressed: () {
//                               //           showDatePicker(
//                               //                   context: context,
//                               //                   initialDate: DateTime.now(),
//                               //                   firstDate: DateTime(2000),
//                               //                   lastDate: DateTime(2030))
//                               //               .then((value) {
//                               //             setState(() {
//                               //               _dateTime = value!;
//                               //               truckMac2Year =
//                               //                   _dateTime.year.toString();
//                               //               print(
//                               //                   'truckMakingYear:-${truckMac2Year.toString()}');
//                               //             });
//                               //           });
//                               //         },
//                               //         icon: Icon(
//                               //           Icons.calendar_today,
//                               //           color: Colors.red,
//                               //         )),
//                               //     Column(
//                               //       children: [
//                               //         SizedBox(
//                               //           height: 15,
//                               //         ),
//                               //         Text(truckMac2Year.toString()),
//                               //       ],
//                               //     ),
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //   ],
//                               // ),
//                               ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(3.0),
//                             child: Text(
//                               "TRUCK FUEL",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 150,
//                                 height: 170,
//                                 child: Column(
//                                   children: [
//                                     RadioListTile(
//                                       title: Text("Yes"),
//                                       value: "yes",
//                                       groupValue: padLock,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           padLock = value.toString();
//
//                                           print(padLock);
//                                         });
//                                       },
//                                     ),
//                                     RadioListTile(
//                                       title: Text("No"),
//                                       value: "no",
//                                       groupValue: padLock,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           padLock = value.toString();
//
//                                           print(padLock);
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Container(
//                         width: 330,
//                         height: 55,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: (update == false)
//                             ? ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10))),
//                                 onPressed: () {
//                                   // var driver0Id = driver1Id.toString();
//                                   // var driver2 = driver2Id.toString();
//                                   var data = {
//                                     "truckMacYear": truckMacYear.toString(),
//                                     "fitUnfit": fitUnfit1.toString(),
//                                     "driver1Id": driver1Id.toString(),
//                                     "driver2Id": driver2Id.toString(),
//                                     "driver1PhoneNo": driver1PhoneNo.toString(),
//                                     "driver2PhoneNo": driver2PhoneNo.toString(),
//                                     "truckNumber": truckNumber.text.toString(),
//                                     "cityDriverName": driver3Id.toString(),
//                                     "cityTruck": cityTruck.text.toString(),
//                                     "padLock": padLock.toString(),
//                                     "truckMac2Year": truckMac2Year.toString(),
//                                     "truckMacYear": truckMacYear.toString(),
//                                     "id": "",
//                                     "status": 1,
//                                     "tripId": tripId123.toString()
//                                   };
//
//                                   print(data);
//
//                                   if (truckMacYear.isNotEmpty &&
//                                       truckMac2Year.isNotEmpty &&
//                                       fitUnfit1 != "Select" &&
//                                       driver1Name != "Select" &&
//                                       driver2Name != "Select" &&
//                                       // driver2Name != "Select" &&
//                                       padLock.isNotEmpty) {
//                                     if (_formKey.currentState!.validate()) {
//                                       var statusText = "Active";
//                                       postAssionApiPost(tripId123, driver1Id,
//                                           driver2Id, statusText, id1);
//                                       postReadinessFormApi(data);
//                                       setState(() {
//                                         login = true;
//                                       });
//                                     }
//                                   } else {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           backgroundColor: Colors.red,
//                                           content: Text('Invalid value...')),
//                                     );
//                                   }
//
//                                   print(data);
//
//                                   setState(() {
//                                     Future.delayed(Duration(seconds: 3), () {
//                                       setState(() {
//                                         login = false;
//                                       });
//                                     });
//                                   });
//                                 },
//                                 child: (login == false)
//                                     ? Text(
//                                         "Submit",
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     : SizedBox(
//                                         height: 15,
//                                         width: 15,
//                                         child: CircularProgressIndicator(
//                                           color: Colors.white,
//                                           strokeWidth: 2,
//                                         )),
//                               )
//                             : ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10))),
//                                 onPressed: () {
//                                   // var driver0Id = driver1Id.toString();
//                                   // var driver2 = driver2Id.toString();
//                                   var data = {
//                                     "truckMacYear": truckMacYear.toString(),
//                                     "fitUnfit": fitUnfit1.toString(),
//                                     "driver1Id": driver1Id.toString(),
//                                     "driver2Id": driver2Id.toString(),
//                                     "driver1PhoneNo": driver1PhoneNo.toString(),
//                                     "driver2PhoneNo": driver2PhoneNo.toString(),
//                                     "truckNumber": truckNumber.text.toString(),
//                                     "cityDriverName": driver3Id.toString(),
//                                     "cityTruck": cityTruck.text.toString(),
//                                     "padLock": padLock.toString(),
//                                     "truckMac2Year": truckMac2Year.toString(),
//                                     "truckMacYear": truckMacYear.toString(),
//                                     "id": id1,
//                                     "status": 1,
//                                     "tripId": tripId123.toString()
//                                   };
//
//                                   print(data);
//
//                                   if (truckMacYear.isNotEmpty &&
//                                       truckMac2Year.isNotEmpty &&
//                                       fitUnfit1 != "Select" &&
//                                       driver1Name != "Select" &&
//                                       driver2Name != "Select" &&
//                                       // driver2Name != "Select" &&
//                                       padLock.isNotEmpty) {
//                                     if (_formKey.currentState!.validate()) {
//                                       var statusText = "Active";
//                                       postAssionApi(tripId123, driver1Id,
//                                           driver2Id, statusText, id1);
//                                       upDateReadinessApi(data);
//                                       setState(() {
//                                         login = true;
//                                       });
//                                     }
//                                   } else {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           backgroundColor: Colors.red,
//                                           content: Text('Invalid value...')),
//                                     );
//                                   }
//
//                                   print(data);
//
//                                   setState(() {
//                                     Future.delayed(Duration(seconds: 3), () {
//                                       setState(() {
//                                         login = false;
//                                       });
//                                     });
//                                   });
//                                 },
//                                 child: (login == false)
//                                     ? Text(
//                                         "Update",
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     : SizedBox(
//                                         height: 15,
//                                         width: 15,
//                                         child: CircularProgressIndicator(
//                                           color: Colors.white,
//                                           strokeWidth: 2,
//                                         )),
//                               ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<ReadinessAddValueModels> upDateReadinessApi(
//       Map<String, dynamic> data) async {
//     var data1 = jsonEncode(data);
//     final res = await http
//         .patch(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
//       "Content-type": "application/json;charset=UTF-8",
//       "Authorization": token,
//     });
//     if (res.statusCode == 200) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => BottomBarPage()));
//
//       controller.animateTo(2);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             backgroundColor: Colors.green,
//             content: Text('Successfully Update...')),
//       );
//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => ReadinessPage()));
//       return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Something Error')),
//       );
//       throw Exception("Failed to load ReadinessAddValueModels");
//     }
//   }
//
//   Future<void> getDriverListApiFunction() async {
//     final res = await http.get(
//         Uri.parse(
//             "https://canadalogistic.metalsart.in/dispatcherApp/DriverList1API/"),
//         headers: {
//           "Content-type": "application/json;charset=UTF-8",
//           "Authorization": token,
//         });
//
//     if (res.statusCode == 200) {
//       driverListData = jsonDecode(res.body.toString());
//
//       const SnackBar(
//           backgroundColor: Colors.green, content: Text('Success...'));
//
//       print(driverListData);
//     } else {
//       throw Exception("Something Error");
//     }
//   }
//
//   Future<ReadinessAddValueModels> postReadinessFormApi(
//       Map<String, Object> data) async {
//     var data1 = jsonEncode(data);
//     final res = await http
//         .post(Uri.parse("$baseUrl/ReadinessFormAPI/"), body: data1, headers: {
//       "Content-type": "application/json;charset=UTF-8",
//       "Authorization": token,
//     });
//     if (res.statusCode == 200) {
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //       backgroundColor: Colors.green, content: Text('Success...')),
//       // );
//       return ReadinessAddValueModels.fromJson(jsonDecode(res.body.toString()));
//     } else {
//       throw Exception("Failed to load ReadinessAddValueModels");
//     }
//   }
//
//   Future<void> postAssionApi(
//       tripId1, String driver0id, String driver2, String statusText, id1) async {
//     var data = {
//       "tripId": tripId1.toString(),
//       "driver1Id": driver0id.toString(),
//       "driver2Id": driver2.toString(),
//       "statusText": statusText.toString(),
//       "id": '',
//     };
//     var data12 = jsonEncode(data);
//
//     print(data12);
//     final res = await http.patch(
//       Uri.parse(
//           "https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/"),
//       body: data12,
//       headers: {
//         "Content-type": "application/json;charset=UTF-8",
//         "Authorization": token,
//       },
//     );
//     if (res.statusCode == 200) {
//       controller.animateTo(2);
//       Navigator.of(context).pop();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             backgroundColor: Colors.green,
//             content: Text(
//               'Tender Assign Dispatched Successfully',
//             )),
//       );
//       return data123 = jsonDecode(res.body.toString());
//     } else {
//       throw Exception("Failed to load data123");
//     }
//   }
//
//   Future<void> postAssionApiPost(
//       tripId1, String driver0id, String driver2, String statusText, id1) async {
//     var data = {
//       "tripId": tripId1.toString(),
//       "driver1Id": driver0id.toString(),
//       "driver2Id": driver2.toString(),
//       "statusText": statusText.toString(),
//       "id": '',
//     };
//     var data12 = jsonEncode(data);
//
//     print(data12);
//     final res = await http.post(
//       Uri.parse(
//           "https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/"),
//       body: data12,
//       headers: {
//         "Content-type": "application/json;charset=UTF-8",
//         "Authorization": token,
//       },
//     );
//     if (res.statusCode == 200) {
//       controller.animateTo(2);
//       Navigator.of(context).pop();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             backgroundColor: Colors.green,
//             content: Text(
//               'Tender Assign Dispatched Successfully',
//             )),
//       );
//       return data123 = jsonDecode(res.body.toString());
//     } else {
//       throw Exception("Failed to load data123");
//     }
//   }
// }
