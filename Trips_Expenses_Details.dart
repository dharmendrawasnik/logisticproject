import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../Trips_Expenses/Trip_Expenses.dart';
import '../Update_Trip_Expense_Form/Update_Trip_Expense_Form.dart';

bool btntxt=false;
class TripExpensesDetailsPage1 extends StatefulWidget {
  final String fuelCharge;
  final String foodCharge;
  final String driverCharge;
  final String otherCharge;
  final String totalCount;
  final String tripId;
  final String statusText;
  final String dateTime;
  final String id;
  const TripExpensesDetailsPage1( {Key? key, required this.fuelCharge, required this.foodCharge, required this.driverCharge, required this.otherCharge, required this.totalCount, required this.tripId, required this.statusText, required this.dateTime, required this.id,}) : super(key: key);

  @override
  State<TripExpensesDetailsPage1> createState() => _TripExpensesDetailsPage1State();
}

class _TripExpensesDetailsPage1State extends State<TripExpensesDetailsPage1> {
  var fuelCharge1;
  var foodCharge1;
  var driverCharge1;
  var otherCharge1;
  var totalCount1;
  var tripId1;
  var statusText1;
  var dateTime1;
  var id1;
  @override
  void initState() {
    print(otherCharge1.toString());
     fuelCharge1=widget.fuelCharge.toString();
     foodCharge1=widget.foodCharge.toString();
     driverCharge1=widget.driverCharge.toString();
     otherCharge1=widget.otherCharge.toString();
     totalCount1=widget.totalCount.toString();
     tripId1=widget.tripId.toString();
     statusText1=widget.statusText.toString();
     dateTime1=widget.dateTime.toString();
     id1=widget.id.toString();
    print(otherCharge1.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Trips Expenses Details "),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: 800,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fuel Charges",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$fuelCharge1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Food Charges",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$foodCharge1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Driver Charges",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$driverCharge1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Other Charges",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$otherCharge1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Count",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$totalCount1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Status",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$statusText1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date & Time",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$dateTime1",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  )),
                            ],
                          ),
                          Divider(),


                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:Colors.grey.shade500,
                                            offset: Offset(5,5),
                                            blurRadius: 15,
                                            spreadRadius: 1
                                        ),
                                        BoxShadow(
                                            color:Colors.grey.shade500,
                                            offset: Offset(-5,-5),
                                            blurRadius: 15,
                                            spreadRadius: 1
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)

                                  ),
                                  height: 40,
                                  width: 120,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red
                                        ,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                    onPressed: (){
                                      _showMyDialog(id1);
                                    },child: Row(
                                    children: [
                                      Icon(Icons.delete_outline,color: Colors.white,),
                                      Text("DELETE",style: TextStyle(color: Colors.white),),
                                    ],
                                  ),),
                                ),Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:Colors.grey.shade500,
                                            offset: Offset(5,5),
                                            blurRadius: 15,
                                            spreadRadius: 1
                                        ),
                                        BoxShadow(
                                            color:Colors.grey.shade500,
                                            offset: Offset(-5,-5),
                                            blurRadius: 15,
                                            spreadRadius: 1
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)

                                  ),
                                  height: 40,
                                  width: 120,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black87,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    ),
                                    onPressed: (){
                                   var namet="Update Trip Expenses";
                                    btntxt=true;
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateTripExPenseFormPage(driverCharges: '$driverCharge1', foodCharge: '$foodCharge1', fuelCharge: '$fuelCharge1', otherCharge: '$otherCharge1', tripId: '$tripId1', status: '$statusText1', id: '$id1', name: namet,) ));
                                    },child: Row(
                                    children: [
                                      Icon(Icons.edit_outlined,color: Colors.white,),
                                      Text("UPDATE",style: TextStyle(color:Colors.white),),
                                    ],
                                  ),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
  Future<void> _showMyDialog(id1) async {

    return showDialog<void>(

      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content:Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,

                borderRadius: BorderRadius.circular(25)


            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.red,width: 3.0)
                  ),
                  child: Center(child: Icon(Icons.close_outlined,color: Colors.red,size: 35,)),
                ),
                Text("Are you sure?",style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Do you really want  to delete this Trips Expenses Details. ",style: TextStyle(fontSize: 14),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("CANCEL",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red
                          ),
                          onPressed: (){
                            tripsExpensesDetailsDeleteApi(id1);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TripExpensesPage()));
                          }, child: Text("DELETE NOW ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),


              ],
            ),
          ),





        );
      },
    );
  }
  Future<void> tripsExpensesDetailsDeleteApi(id)async{
    final res=await http.delete(Uri.parse("$baseUrl/TripExpensesAPI/?id=$id"),
    headers: {
      "Content-type":"application/json;charset=UTF-8"
    }
    );
    if(res.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.green,content: Text('Delete Details Successfully')),
      );
    }else{
      throw Exception("Something Error");
    }
  }
  Future<void> tripsExpensesDetailsUpdateApi()async{
    final res=await http.patch(Uri.parse("$baseUrl/TripExpensesAPI/"),body: {},headers: {});
  }
}
