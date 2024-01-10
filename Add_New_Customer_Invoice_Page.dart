import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CustomerInvoiceFormPage extends StatefulWidget {
  const CustomerInvoiceFormPage({Key? key}) : super(key: key);

  @override
  State<CustomerInvoiceFormPage> createState() => _CustomerInvoiceFormPageState();
}

class _CustomerInvoiceFormPageState extends State<CustomerInvoiceFormPage> {
  final _formKey = GlobalKey<FormState>();
  var driverMediclaim="Select DriverMedical";
  // final TextEditingController vehicleLicence=TextEditingController();
  // final TextEditingController vehicleLicence=TextEditingController();
  // final TextEditingController vehicleLicence=TextEditingController();
  // final TextEditingController vehicleLicence=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add New Invoice"),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Vehicle License",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            TextFormField(
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
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("VehicleLic License ",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            TextFormField(
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
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Insurance",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            TextFormField(
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
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$driverMediclaim",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.grey)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    underline: Row(),

                                    hint: Text(driverMediclaim),

                                    items: [
                                      DropdownMenuItem<String>(

                                        value: "yes",
                                        child: Center(
                                          child: Text("Yes"),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(

                                        value: "no",
                                        child: Center(
                                          child: Text("No"),
                                        ),
                                      ),

                                    ], onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        if(value=="yes"){
                                          driverMediclaim="Yes";
                                        }else{
                                          driverMediclaim="No";
                                        }
                                      });
                                  },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Maintenance Year",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            TextFormField(
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
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold),),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:Border.all(color: Colors.grey)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 240,
                                  ),
                                  DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    underline: Row(),
                                    hint: Text("Status"),
                                    items: [
                                      DropdownMenuItem<String>(

                                        value: "active",
                                        child: Center(
                                          child: Text("Active"),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(

                                        value: "inactive",
                                        child: Center(
                                          child: Text("Inactive"),
                                        ),
                                      ),

                                    ], onChanged: (value) {
                                    print(value);
                                  },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.lightBlue,
                                  Colors.white70,
                                  Colors.lightBlue,
                                ]
                              ),
                              borderRadius: BorderRadius.circular(10)

                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                               
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: Text("Add",style: TextStyle(color: Colors.black87,fontSize: 18),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
  var invoiceData;
  // Future<void> postinvoiceApi(){
  //   final res=await http.post(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/InvoiceAPI/"),body: {},headers: {});
  //   if(res.statusCode==200){
  //     invoiceData=jsonDecode(res.body.toString());
  //     print(invoiceData);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(backgroundColor: Colors.green,content: Text('Success...')),
  //
  //     );
  //   }else{
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(backgroundColor: Colors.green,content: Text('Something Error')),
  //
  //     );
  //   }
  // }
}
