import 'package:flutter/material.dart';

import '../BottomBarPage/BottomBarPage.dart';
import '../DrawClip/DrawClip.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    bool shouldPop= true;
    return WillPopScope(

      onWillPop: ()async{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBarPage()),(Route<dynamic>route)=>false);
        return shouldPop;
      },
      child: SafeArea(
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
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: Text("Search Trips"),

                  ),
                  body: /*Container(
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    child: Column(
                      children: [
                        Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(

color: Colors.tealAccent


                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top:10,bottom: 10 ),
                            child: TextFormField(
                              decoration: InputDecoration(
filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.search_outlined),
                                  suffixIcon: Icon(Icons.close),
                                 hintText: "Search",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  )
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 250,),
                              Text("Coming Soon",style: TextStyle(color: Colors.black87,),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),*/
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/images/coming-soon.gif"),height: 200,
                        width: 200,),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          )
      ),
    );
  }
}
