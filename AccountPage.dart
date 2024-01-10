
import 'package:flutter/material.dart';

import '../AboutUS/AboutUs.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../BottomBarPage/BottomBarPage.dart';
import '../DrawClip/DrawClip.dart';
import '../Edit_Profile_Page/Edit_Profile_Page.dart';
import '../Privacy_ Policy_Page/Privacy_Policy_Page.dart';
import '../Selection_Page/Selection_page.dart';
import '../splash_Screen_Page/Splash_Screen_Page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String authorization="";
  double top=1200;
  double top1=1200;
  @override
  void initState() {
    getProfileApi();
    Future.delayed(Duration(milliseconds: 100),(){
      setState(() {

        top1=0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(

    onWillPop: ()async{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBarPage()),(Route<dynamic>route)=>false);
      return shouldPop;
    },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              ClipPath(
                clipper: DrawClip2(),
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF5c6BC0),
                          Color(0xFF82B1FF)
                        ],

                      )
                  ),
                ),
              ),
              ClipPath(
                clipper: DrawClip( ),
                child: Container(
                  width: size.width,
                  height: size.height*0.8,
                  decoration: BoxDecoration(

                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [

                          Color(0xFF82B1FF),
                          Color(0xFF303F9F),
                        ],

                      )
                  ),
                ),
              ),
              AnimatedPositioned(
                top: top1,

                duration: const Duration(milliseconds: 1000),
                child: SingleChildScrollView(
                  child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),

                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1.2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                FutureBuilder(
                                  future: getProfileApi(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return ListView.builder(
                                        itemCount: 1,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Center(
                                            child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            profileData['result'][0]
                                                                    ['image']
                                                                .toString()),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    border: Border.all(
                                                        color: Colors.grey, width: 1)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: FutureBuilder(
                                        future: getProfileApi(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          } else {
                                            return ListView.builder(
                                              itemCount: 1,
                                              shrinkWrap: true,
                                              physics: ClampingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${profileData['result'][0]['fullName'].toString()}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18),
                                                    ),

                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                                FutureBuilder(
                                  future: getProfileApi(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return ListView.builder(
                                        itemCount: 1,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.white10,
                                                      offset: Offset(5, 5),

                                                      blurRadius: 15,
                                                      spreadRadius: 1),
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(-5, -5),
                                                      blurRadius: 15,
                                                      spreadRadius: 1),
                                                ],
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => EditProfile(
                                                              fistName1:
                                                                  '${profileData['result'][0]['fullName'].toString()}',

                                                              email1:
                                                                  '${profileData['result'][0]['email'].toString()}',
                                                              password1:
                                                                  '${profileData['result'][0]['password'].toString()}',
                                                              image1:
                                                                  '${profileData['result'][0]['image'].toString()}',
                                                            )));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    EditProfile(
                                                                      fistName1:
                                                                          '${profileData['result'][0]['fullName'].toString()}',

                                                                      email1:
                                                                          '${profileData['result'][0]['email'].toString()}',
                                                                      password1:
                                                                          '${profileData['result'][0]['password'].toString()}',
                                                                      image1:
                                                                          '${profileData['result'][0]['image'].toString()}',
                                                                    )));
                                                      },
                                                      child: Row(
                                                        children: const [
                                                          Icon(Icons.person,
                                                              color: Colors.black54,
                                                              size: 25),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            "Edit Profile",
                                                            style: TextStyle(
                                                                color: Colors.black54,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.bold),
                                                          )
                                                        ],
                                                      )),
                                                  const Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black54,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => AboutUs()));

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:Colors.white10,
                                              offset: Offset(5, 5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(-5, -5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => AboutUs()));
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => AboutUs()));
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.edit,
                                                      color: Colors.black54, size: 25),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "About Us",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black54,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PrivacyPolicyPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.white10,
                                              offset: Offset(5, 5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color:Colors.grey,
                                              offset: Offset(-5, -5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PrivacyPolicyPage()));
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.privacy_tip,
                                                      color: Colors.black54, size: 25),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Privacy Policy",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black54,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container( decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color:Colors.white10,
                                            offset: Offset(5, 5),
                                            blurRadius: 15,
                                            spreadRadius: 1),
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(-5, -5),
                                            blurRadius: 15,
                                            spreadRadius: 1),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white
                                  ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.dashboard,
                                                      color: Colors.black54, size: 25),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Terms of use ",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black54,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      top=150;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.white10,
                                              offset: Offset(5, 5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(-5, -5),
                                              blurRadius: 15,
                                              spreadRadius: 1),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          top=150;
                                        });
                                      //  _showMyDialog();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () async {
                                            //    _showMyDialog();
                                                setState(() {
                                                  top=150;
                                                });


                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.logout,
                                                      color: Colors.black54, size: 25),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Logout",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black54,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                ),
              ),
              AnimatedPositioned(
                left: 30,
                top: top,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white10,
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ],
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(15),

                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Icon(Icons.warning,color: Colors.red,size: 100),
                      SizedBox(height: 10,),

                      Text('Alert Message',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),),
                      SizedBox(height: 10,),
                      Text('Are you sure you want to logout.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              child: const Text('Cancel',style: TextStyle(fontSize:25 ),),
                              onPressed: () {
                               setState(() {
                                 top=1200;
                               });
                              },
                            ),
                            TextButton(
                              child:  const Text('Logout',style: TextStyle(color: Colors.red,fontSize: 25),),
                              onPressed: ()async {

                                setState(()async {

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SelectionPage()),(Route<dynamic> route) => false);

                                  await store.delete(key: "token");
                                  token = (await store.read(key: "token")) ?? "";
                                }
                                );


                                print("token:-$token");

                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog1111() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to logout.',style: TextStyle(fontSize: 15),),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',style: TextStyle(fontSize: 18),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:  const Text('Logout',style: TextStyle(color: Colors.red,fontSize: 18),),
              onPressed: ()async {

             setState(()async {

               Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(
                       builder: (context) =>
                           const SelectionPage()),(Route<dynamic> route) => false);

               await store.delete(key: "token");
               token = (await store.read(key: "token")) ?? "";
             }
             );


             print("token:-$token");

              },
            ),
          ],
        );
      },
    );
  }

}
