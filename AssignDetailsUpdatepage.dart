// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import '../ApiConttrollerPage/ApiControllerPage.dart';
// import '../Assign Load  To Driver Details/Assign Load to Driver Details.dart';
// import '../Assign_Load_To_Driver_Page/Assign Load To Driver.dart';
// import 'package:http/http.dart' as http;
//
// import '../ModelsPage/AssionLoadModels.dart';
//
// class AssingDetailsUpdatePage extends StatefulWidget {
//   final String id;
//   final String tripId;
//   final String customerName;
//   final String firstName;
//   final String lastName;
//   final String driverId;
//
//   const AssingDetailsUpdatePage(
//       {Key? key,
//       required this.id,
//       required this.tripId,
//       required this.customerName,
//       required this.firstName,
//       required this.lastName,
//       required this.driverId})
//       : super(key: key);
//
//   @override
//   State<AssingDetailsUpdatePage> createState() =>
//       _AssingDetailsUpdatePageState();
// }
//
// class _AssingDetailsUpdatePageState extends State<AssingDetailsUpdatePage> {
//   var trip;
//   var status;
//   var statusText;
//   var driver;
//   var tripIdName;
//   var tripIdNameValue;
//
//   var id1;
//   var tripId1;
//   var customerName1;
//   var firstName1;
//   var lastName1;
//   var driverId1;
//
//   @override
//   void initState() {
//     id1 = widget.id;
//     tripId1 = widget.tripId;
//     customerName1 = widget.customerName;
//     firstName1 = widget.firstName;
//     lastName1 = widget.lastName;
//     driverId1 = widget.driverId;
//     getTripListApiFunction();
//     getDriverListApi();
//     print(
//         "id:$id1,tripId:$tripId1,driverId:$driverId1,customerName:$customerName1,driverName:$firstName1$lastName1");
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Update Assign Load Driver"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15, right: 15),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 child: Center(
//                     child: Text(
//                   "Update Detail",
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 )),
//                 height: 40,
//                 width: 250,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         bottomRight: Radius.circular(50)),
//                     gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           Colors.blue,
//                           Colors.blue,
//                           Colors.white54,
//                           Colors.blue
//                         ])),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 0, bottom: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Status",
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     SizedBox(
//                       width: 25,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 15,
//                     ),
//                     DropdownButton(
//                       borderRadius: BorderRadius.circular(10),
//                       underline: Row(),
//                       items: [
//                         DropdownMenuItem<String>(
//                           child: Text("Active"),
//                           value: "1",
//                         ),
//                         DropdownMenuItem<String>(
//                           child: Text("Inactive"),
//                           value: "0",
//                         )
//                       ],
//                       onChanged: (value) {
//                         status = value;
//                         print(value);
//
//                         setState(() {
//                           if (status == "1") {
//                             statusText = "Active";
//                           } else {
//                             statusText = "Inactive";
//                           }
//                         });
//                       },
//                       hint: Text((statusText != null) ? statusText : "Status"),
//                     ),
//                   ],
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 0, bottom: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Trip",
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     SizedBox(
//                       width: 25,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 15,
//                     ),
//                     DropdownButton(
//                       borderRadius: BorderRadius.circular(10),
//                       underline: Row(),
//                       items: [
//                         DropdownMenuItem<String>(
//                           child: Text("${customerName1}"),
//                           value: "${tripId1}",
//                         ),
//                       ],
//                       onChanged: (value) {
//                         trip = value.toString();
//                         setState(() {
//                           tripIdName = customerName1;
//                         });
//                       },
//                       hint: Text((tripIdName != null) ? tripIdName : "Trip"),
//                     ),
//                   ],
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 0, bottom: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Driver",
//                       style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     SizedBox(
//                       width: 25,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 5,
//                     ),
//                     DropdownButton(
//                       borderRadius: BorderRadius.circular(10),
//                       underline: Row(),
//                       items: [
//                         DropdownMenuItem<String>(
//                           child: Text("${firstName1}${' '}${lastName1}"),
//                           value: "${driverId1}",
//                         ),
//                       ],
//                       onChanged: (value) {
//                         driver = value.toString();
//                         tripIdNameValue = "${firstName1}${' '}${lastName1}";
//                         setState(() {});
//                       },
//                       hint: Text((tripIdNameValue != null)
//                           ? "${firstName1}${' '}${lastName1}"
//                           : "Driver"),
//                     ),
//                   ],
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.blue, Colors.white54, Colors.blue]),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.transparent,
//                   ),
//                   onPressed: () {
//                     print("$trip,$status,$driver");
//                   //  upDateAssignLoadApi(trip, statusText, driver, id1);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AssignLoadToDriverPage()));
//                   },
//                   child: Text(
//                     "Save",
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.blue, Colors.white54, Colors.blue]),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.transparent,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AssignLoadToDriverPage()));
//                   },
//                   child: Text(
//                     "Cancel",
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
//
//
// }
