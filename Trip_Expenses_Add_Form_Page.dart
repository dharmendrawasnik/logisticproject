// import 'package:flutter/material.dart';
//
//
// class TripExpensesAddForm extends StatefulWidget {
//   const TripExpensesAddForm({Key? key}) : super(key: key);
//
//   @override
//   State<TripExpensesAddForm> createState() => _TripExpensesAddFormState();
// }
//
// class _TripExpensesAddFormState extends State<TripExpensesAddForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController driverCharge=TextEditingController();
//   final TextEditingController foodCharge=TextEditingController();
//   final TextEditingController fuelCharge=TextEditingController();
//   final TextEditingController otherCharge=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Add New Trip Expense"),
//           ),
//           body: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 800,
//
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//
//                     children: [
//                       Column(
//
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Driver Charges",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18),),
//                             ],
//                           ),SizedBox(height: 5,),
//                           TextFormField(
//                             controller: driverCharge,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter driver charge';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "driver charge here",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                 )
//                             ),
//                           )
//                         ],
//                       ),SizedBox(height: 15,),
//                       Column(
//
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Food Charges",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18),),
//                             ],
//                           ),SizedBox(height: 5,),
//                           TextFormField(
//                             controller: foodCharge,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter food charge';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: "food charge here",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                 )
//                             ),
//                           )
//                         ],
//                       ),SizedBox(height: 15,),
//                       Column(
//
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Fuel Charges",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18),),
//                             ],
//                           ),SizedBox(height: 5,),
//                           TextFormField(
//                             controller: fuelCharge,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter fuel charge';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: " fuel charge here",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                 )
//                             ),
//                           )
//                         ],
//                       ),SizedBox(height: 15,),
//                       Column(
//
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Other Charges",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18),),
//                             ],
//                           ),SizedBox(height: 5,),
//                           TextFormField(
//                             controller: fuelCharge,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter other charge';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: " other charge here",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10)
//                                 )
//                             ),
//                           )
//                         ],
//                       ),SizedBox(height: 15,),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey,)
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 130,),
//                             DropdownButton(
//                               underline: Row(),
//                               borderRadius: BorderRadius.circular(10),
//                               hint: Text("There's nothing to show!  "),
//                               items: [
//                                 DropdownMenuItem(
//                                   child:Text("Select an item") ,
//                                   value: "SelectItem",
//                                 )
//                               ], onChanged: (value) {
//                               print(value);
//                             },
//
//                             ),
//                           ],
//                         ),
//                       ),SizedBox(height: 15,),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.grey,)
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 250,),
//                             DropdownButton(
//                               underline: Row(),
//                               borderRadius: BorderRadius.circular(10),
//                               hint: Text("Status  "),
//                               items: [
//                                 DropdownMenuItem(
//                                   child:Text("Active") ,
//                                   value: "1",
//                                 ),
//                                 DropdownMenuItem(
//                                   child:Text("Inactive") ,
//                                   value: "0",
//                                 )
//                               ], onChanged: (value) {
//                               print(value);
//                             },
//
//                             ),
//                           ],
//                         ),
//                       ),SizedBox(height: 25,),
//                       Container(
//                         width: 330,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Colors.lightBlue,
//                                 Colors.white,
//                                 Colors.lightBlue
//                               ],
//                             ),
//                             borderRadius: BorderRadius.circular(10)
//
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)
//                               )
//                           ), onPressed: () {
//
//                           if (_formKey.currentState!.validate()) {
//
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text('Processing Data')),
//                             );
//                           }
//                         }, child: Text("Save",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold),),
//                         ),
//                       ),SizedBox(height: 15,),
//
//                     ],
//                   ),
//                 ),
//               ),
//
//             ),
//           ),
//         )
//     );
//   }
// }
