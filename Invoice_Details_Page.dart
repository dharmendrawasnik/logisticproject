import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({Key? key}) : super(key: key);

  @override
  State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Invoice Details"),
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
                            "Invoice#",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "PNY46545645Nb",
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
                            "Date",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "09-11-2023",
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
                            "Invoice To",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "CYTS009776LKA",
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
                            "Address ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "ganesh Nagar,Gujrat",
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
                            "Deliery",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "Indore-Bhopal",
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
                            "Price",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "14,000",
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
                            "Drivers Charges",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "2,000",
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
                            "Tax",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "4,000",
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
                            "Sub Total",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                "20,000",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 15),
                              )),
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 10),
                        child: SizedBox(
                          child: Container(
                            height: 50,
                            width: 330,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlue,
                                    Colors.white70,
                                    Colors.lightBlue
                                  ]),
                              borderRadius: BorderRadius.circular(10)

                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent
                              ),
                              onPressed: (){},child: Text("Send To Customer",style: TextStyle(fontSize: 18,color: Colors.black87),),),
                          ),
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
    ));
  }
}
