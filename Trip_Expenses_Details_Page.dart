import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../Trips_Expenses/Trip_Expenses.dart';
import '../Update_Trip_Expense_Form/Update_Trip_Expense_Form.dart';


class TripExpensesDetailsPage extends StatefulWidget {
  final String driverLicense;
  final String driverMediclaim;
  final String insurance;
  final String maintananceYear;
  final String vehicleLicense;
  final String status;
  final String dateTime;
  final String id;
  const TripExpensesDetailsPage( {Key? key, required this.driverLicense, required this.driverMediclaim, required this.insurance, required this.maintananceYear, required this.vehicleLicense, required this.status, required this.dateTime, required this.id}) : super(key: key);

  @override
  State<TripExpensesDetailsPage> createState() => _TripExpensesDetailsPageState();
}

class _TripExpensesDetailsPageState extends State<TripExpensesDetailsPage> {
  var driverLicense1;

  var driverMediclaim1;
  var insurance1;
  var maintananceYear1;
  var vehicleLicense1;
  var status1;
  var dateTime1;
  var id2;
  @override
  void initState() {
     driverLicense1=widget.driverLicense;

     driverMediclaim1=widget.driverMediclaim;
     insurance1=widget.insurance;
     maintananceYear1=widget.maintananceYear;
     vehicleLicense1=widget.vehicleLicense;
     status1=widget.status;
     dateTime1=widget.dateTime;
     id2=widget.id;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Maintanance Record Details "),
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
                                "Driver License",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$driverLicense1",
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
                                "Driver Mediclaim",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$driverMediclaim1",
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
                                "Insurance",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$insurance1",
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
                                "MaintananceYear",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$maintananceYear1",
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
                                "VehicleLicense",
                                style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    "$vehicleLicense1",
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
                                    "$status1",
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
                               SizedBox(
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
                                     _showMyDialog(id2);
                                   },child: Row(
                                   children: [
                                     Icon(Icons.delete_outline,color: Colors.white,),
                                     Text("DELETE",style: TextStyle(color: Colors.white),),
                                   ],
                                 ),),
                               ),SizedBox(
                                 height: 40,
                                 width: 120,
                                 child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     primary: Colors.black87,
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                   ),
                                   onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateTripExPenseFormPage(driverCharges: '', foodCharge: '', fuelCharge: '', otherCharge: '', tripId: '', status: '', id: '', name: '',) ));
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
  Future<void> _showMyDialog(id2) async {

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
                 Text("Do you really want  to delete this driver. ",style: TextStyle(fontSize: 14),),

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
                             tripExpensesDetailsDeleteApi(id2);
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
  Future<void> tripExpensesDetailsDeleteApi(id)async{
    final res=await http.delete(Uri.parse("$baseUrl/TripExpensesAPI/?id=$id"));
    if(res.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TripExpensesPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.green,content: Text('Delete Successfully')),
      );
    }else{
      throw Exception("Something Error");
    }
  }
}
