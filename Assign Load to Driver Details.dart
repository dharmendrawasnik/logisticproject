// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../ApiConttrollerPage/ApiControllerPage.dart';
// import '../AssignDetailsUpdatePage/AssignDetailsUpdatepage.dart';
// import '../Assign_Load_To_Driver_Page/Assign Load To Driver.dart';
//
// class AssignDetailsPage extends StatefulWidget {
//   final String driverName;
//   final String lastName;
//   final String email;
//   final String licenseNo;
//   final String mobileNo;
//   final String destination;
//   final String origin;
//   final String length;
//   final String deadHead;
//   final String pickUpDateTime;
//   final String price;
//   final String size;
//   final String weight;
//   final String status;
//   final String id;
//   final String tripId;
//   final String customerName;
//   final String driverId;
//   const AssignDetailsPage({Key? key,  required this.driverName, required this.email, required this.licenseNo, required this.mobileNo, required this.destination, required this.origin, required this.length, required this.deadHead, required this.pickUpDateTime, required this.price, required this.size, required this.weight, required this.status, required this.id, required this.lastName, required this.tripId, required this.customerName, required this.driverId}) : super(key: key);
//
//   @override
//   State<AssignDetailsPage> createState() => _AssignDetailsPageState();
// }
//
// class _AssignDetailsPageState extends State<AssignDetailsPage> {
//   var driverName1;
//   var lastName1;
//   var email1;
//   var  licenseNo1;
//   var  mobileNo1;
//   var status1;
//   var id1;
//   var tripId1;
//   var customerName1;
//   var driverId1;
// @override
// void initState() {
//   tripId1=widget.tripId;
//    driverName1=widget.driverName;
//    lastName1=widget.lastName;
//    email1=widget.email;
//     licenseNo1=widget.licenseNo;
//     mobileNo1=widget.mobileNo;
//    status1=widget.status;
//    id1=widget.id;
//   customerName1=widget.customerName;
//   driverId1=widget.driverId;
//    print(driverName1);
//    print(lastName1);
//    print( email1);
//    print("tripId:$tripId1,driverId:$driverId1,id:$id1,status:$status1");
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: Text("Assign Load To Driver Details"),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 750,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15)
//                 ),
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Driver Full Name",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Row(
//                               children: [
//                                 Text(driverName1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                                 Text(lastName1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Email",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text(email1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("License Number",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text(licenseNo1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Mobile Number",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text(mobileNo1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Destination",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Origin",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Length",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Dead Head",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Pickup Date Time",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Price",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Size",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Weight",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text("",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(), SizedBox(height: 10,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Status",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                             Text(status1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                           ],
//                         ),
//                         Divider(),
//                         SizedBox(height: 25,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(width: 15,),
//                             SizedBox(
//                               height: 40,
//                               width: 130,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.red,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                   )
//                                 ),
//                                 onPressed: (){
//                                   _showMyDialog(id1);
//                                 },
//                                 child: Row(
//                                   children: [
//
//                                     Icon(Icons.delete_outlined,color: Colors.white),
//                                     Text("DELETE",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 40,
//                               width: 130,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10)
//                                     )
//                                 ),
//                                 onPressed: (){
//                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AssingDetailsUpdatePage(id: '$id1', tripId: '$tripId1', customerName: '${customerName1}', firstName: '$driverName1', lastName: '$lastName1', driverId: '$driverId1',)));
//                                 },
//                                 child: Row(
//                                   children: [
//
//                                     Icon(Icons.edit_outlined,color: Colors.white),
//                                     Text("UPDATE",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 15,),
//                           ],
//                         ),
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//     );
//   }
//   Future<void> _showMyDialog(String id) async {
//
//     return showDialog<void>(
//
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content:Container(
//             width: MediaQuery.of(context).size.width,
//             height: 200,
//             decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//
//                 borderRadius: BorderRadius.circular(25)
//
//
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border.all(color: Colors.red,width: 3.0)
//                   ),
//                   child: Center(child: Icon(Icons.close_outlined,color: Colors.red,size: 35,)),
//                 ),
//                 Text("Are you sure?",style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.bold),),
//                 Text("Do you really want  to delete this assign details. ",style: TextStyle(fontSize: 14),),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 110,
//                       child: ElevatedButton(
//                           onPressed: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AssignLoadToDriverPage()));
//
//                       }, child: Text("CANCEL",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
//                     ),
//                     SizedBox(
//                       width: 110,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.red
//                           ),
//                           onPressed: (){
//                            deleteAssignDetailsApiFunction(id);
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=> AssignLoadToDriverPage()));
//                            Navigator.pop(context);
//                           }, child: Text("DELETE NOW ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
//                     ),
//                   ],
//                 ),
//
//
//               ],
//             ),
//           ),
//
//
//
//
//
//         );
//       },
//     );
//
//
//
//   }
//
//   Future<void> deleteAssignDetailsApiFunction(String id)async{
//   final res =await http.delete(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/AssignLoadToDriverAPI/?id=$id"),
//   headers: {
//     "Content-type":"application/json;charset=UTF-8",
//     "Authorization":token,
//   }
//   );
//   if(res.statusCode==200){
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(backgroundColor:Colors.green,content: Text('Assign Details Delete Successfully')),
//     );
//   }else{
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(backgroundColor:Colors.green,content: Text('Something Wrong')),
//     );
//   }
//   }
// }
//
