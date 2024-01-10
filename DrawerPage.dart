import 'package:bridge_point_logistics/VehiclesPage/VehiclesPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Assign_Load_To_Driver_Page/Assign Load To Driver.dart';
import '../BottomBarPage/BottomBarPage.dart';
import '../Customer_Invoice/Customer_Invoice.dart';
import '../DrawClip/DrawClip.dart';
import '../Driver_Page/Driver_Page.dart';
import '../Maintenance_Record_Page/Maintenance_Record_Page.dart';
import '../Readiness_page/Readiness_page.dart';
import '../Trips_Expenses/Trip_Expenses.dart';
import '../Weather_InfoPage/Weather_InfoPage.dart';

late int indexvalue = 1;

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ClipPath(
            clipper: DrawClip2(),
            child: Container(
              width: size.width,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.bottomRight,
                colors: [Color(0xFF5c6BC0), Color(0xFF82B1FF)],
              )),
            ),
          ),
          ClipPath(
            clipper: DrawClip(),
            child: Container(
              width: size.width,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF82B1FF),
                  Color(0xFF303F9F),
                ],
              )),
            ),
          ),
          AnimatedPositioned(
            top: 10,
            duration: Duration(milliseconds: 1),
            child: Container(
              child: Stack(
                children: [
                  Image.asset('assets/images/bridgePointLogo.png',
                      fit: BoxFit.cover),
                ],
              ),
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                BoxShadow(
                    color: Color(0xFF5c6BC0),
                    offset: Offset(5, 5),
                    blurRadius: 7,
                    spreadRadius: 1),
                BoxShadow(
                    color: Color(0xFF5c6BC0),
                    offset: Offset(-5, -5),
                    blurRadius: 7,
                    spreadRadius: 1),
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          AnimatedPositioned(
            duration: Duration(microseconds: 1),
            top: 150,
            child: Container(
              
              width: 270,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 1;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBarPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_shipping,
                              color: (indexvalue == 1)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Trips",
                              style: GoogleFonts.merriweather(
                                  color: (indexvalue == 1)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 2;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VehiclesPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: (indexvalue == 2)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Vehicles",
                              style: GoogleFonts.merriweather(
                                  color: (indexvalue == 2)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                              // TextStyle(
                              //     color: (indexvalue == 2)
                              //         ? Colors.red
                              //         : Colors.black87,
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 3;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: (indexvalue == 3)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Driver",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 3)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 4;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AssignLoadToDriverPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: (indexvalue == 4)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Assign Load To \nDriver",
                              style:  GoogleFonts.merriweather(

                                  color: (indexvalue == 4)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 5;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WeatherInfoPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.cloud,
                              color: (indexvalue == 5)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Weather Info",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 5)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 6;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerInvoicePage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.description,
                              color: (indexvalue == 6)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Customer Invoice",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 6)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 7;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripExpensesPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              color: (indexvalue == 7)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Trip Expenses",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 7)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            indexvalue = 8;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MaintenanceRecordPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.table_rows_outlined,
                              color: (indexvalue == 8)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Maintain Record",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 8)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              indexvalue = 9;
                            });
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadinessPage()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.insert_drive_file_outlined,
                              color: (indexvalue == 9)
                                  ? Colors.red
                                  : Colors.black87,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Readiness",
                              style:  GoogleFonts.merriweather(
                                  color: (indexvalue == 9)
                                      ? Colors.red
                                      : Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 350,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
