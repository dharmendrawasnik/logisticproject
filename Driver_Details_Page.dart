import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../Driver_Add_Form_Page/Driver_Add_Form_Page.dart';
import '../Driver_Page/Driver_Page.dart';



class DriverDetailsPage extends StatefulWidget {
//   final String fullName;
//   final String lastName;
//   final String mobileNo;
//   final String email;
//   final String licenseClass;
//   final String id;
// final String password;
//   final String status;



  const DriverDetailsPage(
      {Key? key,
     // required this.fullName,
     // required this.mobileNo,
     // required this.email,
     // required this.licenseClass,
     // required this.status,
     // required this.lastName,
     // required this.id, required this.password,
  })
      : super(key: key);

  @override
  State<DriverDetailsPage> createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  var fName;
  var lName;
  var email1;
  var licenseNo1;
  var id1;
  var status1;
  var mobileNo1;
  var password1;
  var update=false;
  @override
  void initState() {

    getDriverApi();
    // mobileNo1 = widget.mobileNo;
    // fName = widget.fullName;
    // lName = widget.lastName;
    // email1 = widget.email;
    // licenseNo1 = widget.licenseClass;
    // id1 = widget.id;
    // status1 = widget.status;
    // password1 = widget.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Driver Details"),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder(
              future: getDriverApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("waiting"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 600,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Full Name",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "$fName $lName",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Mobile Number",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "$mobileNo1",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "$email1",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "License Class",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "$licenseNo1",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "Endorsment",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "Null",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "Status",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                "$status1",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: 120,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                                onPressed: () {
                                                  var deleteId = id1;
                                                  _showMyDialog(deleteId);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "DELETE",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              width: 120,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.black87,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                                onPressed: () {
                                                  update=true;
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             DriverAddForm(
                                                  //               firstName1:
                                                  //               '$fName',
                                                  //               lastName1:
                                                  //               "$lName",
                                                  //               mobileNumber1:
                                                  //               "$mobileNo1",
                                                  //               email1:
                                                  //               "$email1",
                                                  //               password1:
                                                  //               '$password1',
                                                  //               licenseNumber1:
                                                  //               '$licenseNo1',
                                                  //               id: '$id1',
                                                  //             )
                                                  //     ));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "UPDATE",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                      );
                    },
                  );
                  ;
                }
              },
            ),
          ),
        ));
  }

  Future<void> _showMyDialog(String deleteId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.red, width: 3.0)),
                  child: Center(
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                        size: 35,
                      )),
                ),
                Text(
                  "Are you sure?",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Do you really want  to delete this driver. ",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DriverPage()));
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            deleteDriverInactiveApi(id1);

                          },
                          child: Text(
                            "DELETE NOW ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
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

  Future<void> deleteDriverInactiveApi(String id) async {
    final res = await http.delete(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/DriverCRUDAPI/?id=$id"),
        headers: {
          "Content-type": "application/json:charset=UTF-8",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DriverPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('DeleteData Successfully')),

      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Wrong')),
      );
    }
  }
}

//InctiveDetailsPage

