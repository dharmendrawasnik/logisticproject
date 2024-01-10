import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: const [
                  SizedBox(height: 10,),
                  Text("Trucking operation-Brindgepoint Express",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
                  ,SizedBox(height: 10,),
                Text("-> Oeration 6 Terminals & Cross-Dock facilities in major metropolitan areas across Canada and the USA"),
                  SizedBox(height: 10,),
                  Text("Trucking operation-Brindgepoint Express",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                Text("->Strategic asset share partnership with major bolfide trucking companies with strong covenants in place .These agreements are reciprocal "),
              SizedBox(height: 10,),
              Text("->Specialist in Temperature Controlled shipping "),
                  SizedBox(height: 10,),
                  Text("Freight Brokerage-Bridgepoint Logistics",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                Text("->Pool of 10,000 carriers across North America and Continental Europe to supplement trucking aperations. A++ credit rating enables efficient closing of deals"),
                  SizedBox(height: 10,),
                Text("->Flexibility to consider many choices , price points and servise capabilities to deliver the optimal service guarantee to its customers"),
                  SizedBox(height: 10,),
                  Text("Freight Forwarding-Bridgepoint Logistics ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                Text("->Ocean and air freight solutions to medium & large size importers and exporters througth its ability to negotiate volume contracts & quotas in North America and Western Europe regions"),
                  SizedBox(height: 10,),
                  Text("Supply Chain Management-Bridgepoint Consulting",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                Text("->Consulting services to its customers and its own operating divisions to enable value creation throu the supply chain"),
                SizedBox(height: 10,),
                Text("->Impressive track record of creative solutions that have reduced lead times ,reduced\$/kg & \$/mile and improved cash flow & system integration"),
          SizedBox(height: 10,),
          Text("Leasing & Financial Services- Bridgepoint Services",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
                Text("->Equipment leasing to its owner operators and medium sized fleet operators "),
          SizedBox(height: 10,),
          Text("->Accounts Receivables management and debt factoring servieces through a joint venture with Canada's fastest growing credit company   "),
                  SizedBox(height: 10,),
                  Text("Technology-Bridgepoint Tech",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("->R&D,exploration, development & adoption of technology that enhance our product and service line in the area of Supply Chain Management creating long-term value and sustainibility for our customers."),
                  SizedBox(height: 10,),
                Text("->Current programs are development of an Intelligent Transport Management System ,in-the moment assimilation of in-motion logistics data and set u of alternate fuel dispensing terminals."),



          ]
              ),
            ),
          ),
        ),
      ),
    );
        



  }
}


