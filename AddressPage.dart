import 'dart:convert';

import 'package:bridge_point_logistics/ApiConttrollerPage/ApiControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressPage extends StatefulWidget {
  const  AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var orderData;
  Future<void> getAddressDataApi() async {
    final res = await http.get(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/demoTripListAPI/?id=617fac7c611feecae48da6a8&page=1"),
        headers: {"Authorization": token});
    if (res.statusCode == 200) {
      return orderData = jsonDecode(res.body.toString());
    } else {
      return print("Something Error");
    }
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Tender Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getAddressDataApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: orderData['result'].length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemBuilder:(context,index1){
                      return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Container(

                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          //  Colors.lightBlue,
                                          Colors.white,
                                          Colors.lightBlue,
                                          // Colors.cyanAccent
                                        ]),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                          Colors.grey.shade500,
                                          offset: Offset(5, 5),
                                          blurRadius: 15,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-5, -5),
                                          blurRadius: 15,
                                          spreadRadius: 1),
                                    ]),

                                child: ExpansionTile(
                                  title:
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      SizedBox(
                                        width: 230,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'OrderId:-${orderData['result'][index1]['orderId'].toString()}',style: TextStyle(fontSize: 15),),
                                            Text(
                                                'OrderId:-${orderData['result'][index1]['orderId'].toString()}',style: TextStyle(fontSize: 15)),
                                            Text(
                                                'OrderId:-${orderData['result'][index1]['orderId'].toString()}',style: TextStyle(fontSize: 15)),
                                            Text(
                                                'OrderId:-${orderData['result'][index1]['orderId'].toString()}',style: TextStyle(fontSize: 15)),

                                          ],
                                        ),
                                      ),
                                      Column(

                                        children: [
                                          SizedBox(height: 25,),
                                          SizedBox(width: 60,
                                          height: 25,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25)
                                              ),
                                              primary: Colors.black87

                                            ),
                                            onPressed: (){},
                                            child: Text("View",style: TextStyle(fontSize: 10),),
                                          ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  children: [
                                    ListView.builder(
                                      itemCount: orderData['result'][index1]['data'].length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Card(

                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            color: Colors.cyan.shade50,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ExpansionTile(
                                             backgroundColor: Colors.cyan.shade100,
                                                title: Text(
                                                    'SequenceNumber:-${orderData['result'][index1]['data'][index]['sequenceNum']}'),
                                                children: [
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("OrderId"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['orderId']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("City"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['city']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("LocName"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['locName']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("Type"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['type']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("PickupDeliveryId"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['pickupDeliveryId']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("PickupAppointmentDateAndTime"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['pickupAppointmentDateAndTime']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("Id"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['id']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("CustomerPo"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['customerPo']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("Facility"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['facility']}')),
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [SizedBox(width: 5,),
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text("Status"),
                                                      ),
                                                      SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              '${orderData['result'][index1]['data'][index]['status']}')),
                                                    ],
                                                  ),
                                                  SizedBox(height: 25,),


                                                ],
                                              ),
                                            ),
                                          );

                                      },
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          );


                    } ,

                  );
                }
              },
            ),
          ),
        ),
      ),
    ));
  }
}
