import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ApiConttrollerPage/ApiControllerPage.dart';



class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  void initState() {
    getprivacypolicyAli();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Privacy Policy",style: GoogleFonts.merriweather(),),
          ),
          body: FutureBuilder(
            future: getprivacypolicyAli() ,
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: Column(
                        children: [
                          SizedBox(height: 25,),
                          Text("${privacyPolicyData["result"]["Result"][0]["heading"].toString()}",style: GoogleFonts.merriweather(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                          ,
                          Padding(
                            padding: const EdgeInsets.only(top: 10,right: 15,left: 15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text("${privacyPolicyData["result"]["Result"][0]["description"].toString()}",style: GoogleFonts.merriweather(color: Colors.black,fontSize: 12),),


                                ],
                              ),

                            ),
                          ),
                        ],
                      ),
                    );
                  },

                );
              }
            },

          ),
        )
    );
  }
}
