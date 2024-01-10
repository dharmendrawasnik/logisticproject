import 'package:flutter/material.dart';

import '../DrawClip/DrawClip.dart';
import '../DrawerPage/DrawerPage.dart';


class WeatherInfoPage extends StatefulWidget {
  const WeatherInfoPage({Key? key}) : super(key: key);

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
          color: Colors.white,
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
              Scaffold(
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                  child: DrawerPage(),
                ),
                appBar: AppBar(
                  backgroundColor: Colors.indigo,
                  title: Text("Weather Info"),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 750,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)
                           ),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/weather2.gif"),fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(10)

                              ),


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Container(
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
                                ]
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent
                              ),
                              onPressed: (){},
                              child: Text("START TODAY",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/weather.gif"),fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10)

                              ),


                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
