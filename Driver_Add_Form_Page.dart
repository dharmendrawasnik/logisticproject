// import 'dart:convert';
//
// import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../Driver_Details_Page/Driver_Details_Page.dart';
// import '../Driver_Page/Driver_Page.dart';
//
//
// class DriverAddForm extends StatefulWidget {
//   final String firstName1;
//   final String lastName1;
//   final String mobileNumber1;
//   final String email1;
//   final String password1;
//   final String licenseNumber1;
//   final String id;
//
//   const DriverAddForm({Key? key,
//     required this.firstName1,
//     required this.lastName1,
//     required this.mobileNumber1,
//     required this.email1,
//     required this.password1,
//     required this.licenseNumber1, required this.id,}) : super(key: key);
//
//   @override
//   State<DriverAddForm> createState() => _DriverAddFormState();
// }
//
// class _DriverAddFormState extends State<DriverAddForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController firstName=TextEditingController();
//   final TextEditingController lastName=TextEditingController();
//   final TextEditingController mobileNumber=TextEditingController();
//   final TextEditingController email=TextEditingController();
//   final TextEditingController password=TextEditingController();
//   final TextEditingController licenseNumber=TextEditingController();
//   var countryCode="+91";
//   var licenseClassData;
//   var licenseClass;
//   var endorsmentData;
//   var endorsment;
//   var status;
//   var id1;
//   var btnN;
//   bool licClass=false;
//   bool endhost=false;
//   var endhost1;
//   var licClass1;
//   var textStatus;
//   @override
//   void initState() {
//     firstName.text=widget.firstName1;
//     lastName.text=widget.lastName1;
//     mobileNumber.text=widget.mobileNumber1;
//     email.text=widget.email1;
//     password.text=widget.password1;
//     licenseNumber.text=widget.licenseNumber1;
//     id1=widget.id;
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//
//
//             title: Text((update==true)?"Update Driver Detail":"Add New Driver"),
//           ),
//           body: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 900,
//
//               child:Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "First Name",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.name,
//                             controller: firstName,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter first Name';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "Enter first Name",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Last Name",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.name,
//                             controller:lastName,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Last Name';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "Enter Last Name",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Mobile Number",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                             Container(
//                                 height: 60,width: 100,
//
//                                 child: DropdownButtonFormField(
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10)
//                                     )
//                                   ),
//
//                                   hint: Text('Select'),
//                             borderRadius: BorderRadius.circular(10),
//
//                             items: [
//
//                               DropdownMenuItem(
//
//                                 value:"+91" ,
//                                 child: Text("+91"),
//                               ),
//                               DropdownMenuItem(
//                                 value:"+1" ,
//                                 child: Text("+1"),
//                               ),
//
//                             ], onChanged: (String? value) {
//                                     countryCode=value.toString();
//                                 },
//                           ),
//                               ),
//
//                                SizedBox(
//                                  width: 220,
//                                  child: TextFormField(
//                                       keyboardType: TextInputType.number,
//                                       controller:mobileNumber ,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please Enter Mobile Number';
//                                         }
//                                         return null;
//                                       },
//                                       decoration: InputDecoration(
//                                           hintText: "Enter Mobile Number",
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(10))),
//                                     ),
//                                ),
//
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Email",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.emailAddress,
//                             controller: email,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Email';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "Enter Email",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Password",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.text,
//                             controller: password,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Password';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "Enter Password",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "License Number",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           TextFormField(
//                             keyboardType: TextInputType.text,
//                             controller: licenseNumber,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter License Number';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "Enter License Number",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Status",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           DropdownButtonFormField(
//
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                 )
//                             ),
//                             hint: Text("Status"),
//                             borderRadius: BorderRadius.circular(10),
//
//                             items: [
//
//                               DropdownMenuItem(
//                                 value: "1",
//                                 child: Text("Active"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "0",
//                                 child: Text("Inactive"),
//                               ),
//                             ], onChanged: (String? value) {
//                             textStatus=value.toString();
//                           },
//
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "License Class",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           FutureBuilder(
//                             future:getLicenseClassApi(),
//                             builder: (context,snapshot) {
//                               if(snapshot.connectionState==ConnectionState.waiting){
//                                 return Center(
//                                   child: Text("Loading..."),
//                                 );
//                               }else{
//                                 return DropdownButtonFormField(
//                                     borderRadius: BorderRadius.circular(10),
//                                     hint: Text('Select License Class'),
//                                     decoration: InputDecoration(
//
//                                         border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(10)
//                                         )
//                                     ),
//                                     items: [
//                                       for(var i=0;i<licenseClassData["result"].length;i++)
//                                         DropdownMenuItem(
//                                           value: "${licenseClassData["result"][i]["id"].toString()}",
//                                           child: Text("${licenseClassData["result"][i]["licenseClassName"].toString()}"),
//                                         ),
//
//
//                                     ],
//                                   onChanged: (String? value) {
//
//
//                                     licClass=true;
//                                     licenseClass=value.toString();
//                                     licClass1=value.toString();
//
//
//
//                                   },
//                                 );
//                               }
//                             },
//
//                           ),
//                           // Container(
//                           //   width: MediaQuery.of(context).size.width,
//                           //   height: 60,
//                           //
//                           //   child: Row(
//                           //     children: [
//                           //
//                           //       FutureBuilder(
//                           //         future:getLicenseClassApi(),
//                           //         builder: (context,snapshot){
//                           //           if(snapshot.connectionState==ConnectionState.waiting){
//                           //             return Center(
//                           //               child: Text("Loading..."),
//                           //             );
//                           //           }else{
//                           //             return DropdownButtonFormField(
//                           //               hint: Text("Select License Class"),
//                           //
//                           //
//                           //               items: [
//                           //                 for(var i=0;i<licenseClassData["result"].length;i++)
//                           //                   DropdownMenuItem(
//                           //                     value: "${licenseClassData["result"][i]["id"].toString()}",
//                           //                     child: Text("${licenseClassData["result"][i]["licenseClassName"].toString()}"),
//                           //                   ),
//                           //
//                           //
//                           //               ],
//                           //               onChanged: (String? value) {
//                           //
//                           //
//                           //                   licClass=true;
//                           //                   licenseClass=value.toString();
//                           //
//                           //                   for(var i=0;i<licenseClassData["result"].length;i++){
//                           //                     if(licenseClassData["result"][i]["id"]==value){
//                           //                       licClass1=licenseClassData["result"][i]["licenseClassName"].toString();
//                           //                     }
//                           //                   }
//                           //
//                           //             },
//                           //
//                           //             );
//                           //           }
//                           //         },
//                           //
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Endorsment",
//                                 style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           FutureBuilder(
//                              future:getEndoesmentApi(),
//                             builder: (context, snapshot) {
//                                if(snapshot.connectionState==ConnectionState.waiting){
//                                  return Center(
//                                    child: Text('Loading...'),
//                                  );
//                                }else{
//                                  return DropdownButtonFormField(
//                                      hint: Text("Select"),
//                                      borderRadius: BorderRadius.circular(10),
//                                      decoration: InputDecoration(
//
//                                          border: OutlineInputBorder(
//                                              borderRadius: BorderRadius.circular(10)
//                                          )
//                                      ),
//                                    items: [
//
//                                      for(var i=0;i<endorsmentData['result']['Result'].length;i++)
//                                        DropdownMenuItem(
//                                          value: "${endorsmentData['result']['Result'][i]['id'].toString()}",
//                                          child: Text("${endorsmentData['result']['Result'][i]['endorsementName'].toString()}"),
//                                        ),
//
//                                    ], onChanged: (String? value) {
//
//                                      endhost==true;
//                                      endhost1=value.toString();
//                                      print(endhost1);
//
//                                  },
//                                  );
//                                }
//                             },
//                           )
//                           // Container(
//                           //   width: MediaQuery.of(context).size.width,
//                           //   height: 50,
//                           //   decoration: BoxDecoration(
//                           //       border: Border.all(color: Colors.grey),
//                           //       borderRadius: BorderRadius.circular(10)
//                           //
//                           //   ),
//                           //   child: Row(
//                           //     children: [SizedBox(width: 180
//                           //       ,),
//                           //       FutureBuilder(
//                           //         future:getEndoesmentApi(),
//                           //         builder: (context,snapshot){
//                           //           if(snapshot.connectionState==ConnectionState.waiting){
//                           //             return Center(
//                           //               child: Text("Loading..."),
//                           //             );
//                           //           }else{
//                           //             return  DropdownButton(
//                           //               hint: Text((endhost1!=null)?endhost1:"Endorsement"),
//                           //               borderRadius: BorderRadius.circular(10),
//                           //               underline: Row(),
//                           //               items: [
//                           //
//                           //          for(var i=0;i<endorsmentData['result']['Result'].length;i++)
//                           //                 DropdownMenuItem(
//                           //                   value: "${endorsmentData['result']['Result'][i]['id'].toString()}",
//                           //                   child: Text("${endorsmentData['result']['Result'][i]['endorsementName'].toString()}"),
//                           //                 ),
//                           //
//                           //               ], onChanged: (String? value) {
//                           //               setState(() {
//                           //                 endhost==true;
//                           //                 for(var i=0;i<endorsmentData['result']['Result'].length;i++){
//                           //                   if(endorsmentData['result']['Result'][i]['id']==value){
//                           //                     endhost1=endorsmentData['result']['Result'][i]['endorsementName'].toString();
//                           //               print(endhost1);
//                           //                   }
//                           //                 }
//                           //               });
//                           //             },
//                           //
//                           //             );
//                           //           }
//                           //         },
//                           //
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                         ],
//                       ),
//
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15,bottom: 20),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width
//                           ,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.lightBlue,
//                             Colors.white,
//                             Colors.lightBlue
//                           ]
//                         ),
//                         borderRadius: BorderRadius.circular(10)
//
//                       ),
//                       child:(update==true)?ElevatedButton(
//                           onPressed: (){
//                             var driverdata={
//                               "firstName":firstName.text.toString(),
//                               "lastName":lastName.text.toString(),
//                               "mobileNo":mobileNumber.text.toString(),
//                               "email":email.text.toString(),
//                               "password":password.text.toString(),
//                               "licenseNo":licenseNumber.text.toString(),
//                               "id":id1.toString(),
//                               "statusText":textStatus.toString()
//                             };
//
//
//                               driverUpdateApi(driverdata);
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverPage()));
//
//                           },
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.transparent
//                           ),
//                           child: Text("Update",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),)
//                       ): ElevatedButton(
//                         onPressed: (){
//                           var driverdata={
//                           "firstName":firstName.text.toString(),
//                           "lastName":lastName.text.toString(),
//                           "mobileNo":mobileNumber.text.toString(),
//                           "email":email.text.toString(),
//                           "password":password.text.toString(),
//                           "licenseNo":licenseNumber.text.toString(),
//
//                           "id":"",
//                             "statusText":textStatus.toString()
//                           };
//
//
//                             driverUpdateApi1(driverdata);
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverPage()));
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.transparent
//                         ),
//                         child: Text("Submit",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),)
//                       ),
//                     ),
//                   )
//                     ],
//                   ),
//                 ),
//               ) ,
//             ),
//           ),
//         )
//     );
//   }
//   Future<void> getLicenseClassApi()async{
//     final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/driverApp/LicenseClassListAPI/?status=1"),headers: {
//       "Content-type":"application/json;charset=UTF-8",
//       "Authorization":token,
//     });
//     if(res.statusCode==200){
//
//       return licenseClassData=jsonDecode(res.body.toString());
//     }else{
//       throw Exception("Failed to load licenseClassData");
//     }
//   }
//   Future<void> getEndoesmentApi()async{
//     final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/AdminApp/EndorsementAPI/?status=1"),headers: {
//       "Content-type":"application/json;charset=UTF-8",
//       "Authorization":token,
//     });
//     if(res.statusCode==200){
//
//       return endorsmentData=jsonDecode(res.body.toString());
//     }else{
//       throw Exception("Failed to load endorsmentData");
//     }
//   }
//   // Driver UpdateApi
//
// Future<void> driverUpdateApi(Map<String, dynamic> driverdata)async{
//     var data=jsonEncode(driverdata);
//     final res=await http.patch(Uri.parse("$baseUrl/DriverCRUDAPI/?status=1"),body:data ,headers: {
//       "Content-type":"application/json;charset=UTF-8",
//       "Authorization":token,
//     });
//     if(res.statusCode==200){
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DriverPage()),(Route<dynamic>route)=>false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Driver Details Update Successfully')),
//       );
//     }else{
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Something error')),
//       );
//
//     }
// }
//   Future<void> driverUpdateApi1(Map<String, dynamic> driverdata)async{
//     var data=jsonEncode(driverdata);
//     final res=await http.post(Uri.parse("$baseUrl/DriverCRUDAPI/?status=1"),body:data ,headers: {
//       "Content-type":"application/json;charset=UTF-8",
//       "Authorization":token,
//     });
//     if(res.statusCode==200){
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DriverPage()),(Route<dynamic>route)=>false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Driver Details Update Successfully')),
//       );
//     }else{
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Something error')),
//       );
//
//     }
//   }
//
// }
//
