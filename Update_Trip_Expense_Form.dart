import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Trip_Expenses_Deatails_Page/Trip_Expenses_Details_Page.dart';
import '../Trips_Expenses/Trip_Expenses.dart';
import '../Trips_Expenses_Details/Trips_Expenses_Details.dart';

class UpdateTripExPenseFormPage extends StatefulWidget {
  final String driverCharges;
  final String foodCharge;
  final String fuelCharge;
  final String otherCharge;
  final String tripId;
  final String status;
  final String id;
   final String name;

  const UpdateTripExPenseFormPage({Key? key, required this.driverCharges, required this.foodCharge, required this.fuelCharge, required this.otherCharge, required this.tripId, required this.status, required this.id, required this.name}) : super(key: key);

  @override
  State<UpdateTripExPenseFormPage> createState() =>
      _UpdateTripExPenseFormPageState();
}

class _UpdateTripExPenseFormPageState extends State<UpdateTripExPenseFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController driverCharge = TextEditingController();
  final TextEditingController foodCharge = TextEditingController();
  final TextEditingController fuelCharge = TextEditingController();
  final TextEditingController otherCharge = TextEditingController();
  var tripId1;
  var status1;
  var status2;
  var statusText="Status";
  var id1;
  var name1="Add New Trip Expenses";
  var seletct="SelectTripId";
  @override
  void initState() {
    getTripsIdApiFunction('');
    //tripGetData
    driverCharge.text=widget.driverCharges.toString();
    foodCharge.text=widget.foodCharge.toString();
    fuelCharge.text=widget.fuelCharge.toString();
    otherCharge.text=widget.otherCharge.toString();
    tripId1=widget.tripId.toString();
    status1=widget.status.toString();
    id1=widget.id.toString();
    name1=widget.name.toString();
    super.initState();
    getTripsIdApiFunction123();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text((btntxt==true)?"Update Trips Details":"Add New Trips Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 800,
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
                            "Driver Charges",
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
                        controller: driverCharge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter driver charge';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "driver charge here",
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
                            "Food Charges",
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
                        controller: foodCharge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter food charge';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "food charge here",
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
                            "Fuel Charges",
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
                        controller: fuelCharge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter fuel charge';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: " fuel charge here",
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
                            "Other Charges",
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
                        controller: otherCharge,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter other charge';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: " other charge here",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Status",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),SizedBox(height: 5,),
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
                          width: 200,
                        ),
                        DropdownButton(
                          underline: Row(),
                          borderRadius: BorderRadius.circular(10),
                          hint: Text("$statusText"),
                          items: [
                            DropdownMenuItem(
                              child: Text("Active"),
                              value: "1",
                            ),
                            DropdownMenuItem(
                              child: Text("Inactive"),
                              value: "0",
                            )
                          ],
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              status1=value.toString();
                              if(value=="1"){
                                statusText="Active";
                              }else{
                                statusText="Inactive";
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),








                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Trips",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),


                  SizedBox(height: 5,),
                  FutureBuilder(
                    future:getTripsIdApiFunction123(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }else{
                        return ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,

                          itemBuilder: (context,index){
                            return Container(

                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),

                              child: DropdownButton(
                                underline: Row(),
                                borderRadius: BorderRadius.circular(10),
                                hint:Text(seletct),
                                isExpanded: true,
                                items: [
                                  for(var i=0;i<tripGetData['result'].length;i++)
                                    DropdownMenuItem(

                                      child: Text("${tripGetData['result'][i]['detail'].toString()}"),
                                      value: "${tripGetData['result'][i]['id'].toString()}",
                                    )
                                ],
                                onChanged: (value) {
                                  tripId1=value.toString();
                                  setState(() {
                                    for(var i=0;i<tripGetData['result'].length;i++){
                                      if(tripGetData['result'][i]['id']==value){
                                        seletct=tripGetData['result'][i]['detail'].toString();
                                      }
                                    }
                                    print(seletct);
                                  });
                                },
                              ),



                            );
                          },

                        );
                      }
                    },

                  ),
                  SizedBox(
                    height: 25,
                  ),
                //  Text("Trips",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),),SizedBox(height: 5,),
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
                    child:(btntxt==true)?ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {

                        final int driCharge=int.parse(driverCharge.text);
                        final int fueCharge= int.parse(fuelCharge.text);
                        final int  fooCharge=int.parse(foodCharge.text);
                        final int othCharge=int.parse(otherCharge.text) ;



                        var   data={
                          "driverCharges":driCharge ,
                          "foodCharges": fooCharge ,
                          "fuelCharges":fueCharge,
                          "otherCharges": othCharge,
                          "tripId": seletct.toString(),

                          "status": status1.toString(),
                          "statusText":statusText.toString(),

                          "id": id1.toString(),

                        };
                        if (_formKey.currentState!.validate()) {
                          upDateTripsExpensesApi(data as Map<String, String>);


                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(backgroundColor: Colors.green,content: Text('Invalid Value')),
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
                    ): ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        // var data={
                        //   "driverCharges":driverCharge.text.toString(),
                        //   "foodCharges": foodCharge.text.toString(),
                        //   "fuelCharges": fuelCharge.text.toString(),
                        //   "otherCharges": otherCharge.text.toString(),
                        //   "tripId": seletct.toString(),
                        //   "statusText": statusText.toString(),
                        //   "status": status1.toString(),
                        //
                        //   "id": id1.toString(),
                        //
                        // };
                        if (_formKey.currentState!.validate()) {
                          setState(() {


                            upDateTripsExpensesApi1(driverCharge,foodCharge,fuelCharge,otherCharge,seletct,status1,statusText,id1);
                          });


                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(backgroundColor: Colors.green,content: Text('Invalid Value')),
                          );
                        }
                      },
                      child: Text(
                        "Save",
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TripExpensesPage()));
                      },
                      child: Text(
                        "Cancel",
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
    ));
  }
  Future<void> upDateTripsExpensesApi(Map<String, String> data)async{
    var data1=jsonEncode(data);
    final res=await http.patch(Uri.parse("$baseUrl/TripExpensesAPI/"),body: data1,headers: {
      "Content-type":"application/json;charset=UTF-8",
      "Authorization":token,
    });
    if(res.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TripExpensesPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.green,content: Text('UpData Successfully')),
      );
    }else{
      throw Exception("Something Error");
    }
  }

  Future<void> getTripsIdApiFunction123()async{
    final res=await http.get(Uri.parse("$baseUrl/TripListForReadnessAPI/"),
        headers: {
          "Content-type":"application/json;charset=UTF-8",
          "Authorization":token
        }
    );
    if(res.statusCode==200){
      return tripGetData=jsonDecode(res.body.toString());
    }else{
      throw Exception("Failed to load tripGetData");
    }
  }
  //post api
  Future<void> upDateTripsExpensesApi1(TextEditingController driverCharge, TextEditingController foodCharge, TextEditingController fuelCharge, TextEditingController otherCharge,seletct, status1, String statusText, id)async{
   var data={
     "driverCharges":driverCharge.text.toString(),
     "foodCharges": foodCharge.text.toString(),
     "fuelCharges": fuelCharge.text.toString(),
     "otherCharges": otherCharge.text.toString(),
     "tripId": seletct.toString(),
     "statusText": statusText.toString(),
     "status": status1.toString(),
     "id":id.toString()

   };
   print(data);
  var cdata=jsonEncode(data);
  print(cdata);
    final res=await http.post(Uri.parse("$baseUrl/TripExpensesAPI/"),
        body:cdata,
        headers: {
      "Content-type":"application/json;charset=UTF-8",
      "Authorization":token,
    });
    if(res.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TripExpensesPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.green,content: Text('UpData Successfully')),
      );
    }else{
      throw Exception("Something Error");
    }
  }

}
