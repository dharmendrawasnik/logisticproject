import 'dart:convert';
import 'package:bridge_point_logistics/ModelsPage/VehicleDetailsModels.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../Maintenance_Record_Page/Maintenance_Record_Page.dart';
import '../ModelsPage/ApproveDriverModels.dart';

import '../ModelsPage/AssionLoadModels.dart';

import '../ModelsPage/MaintananceData.dart';
import '../ModelsPage/MaintenanceRecordeModels.dart';
import '../ModelsPage/ReadinessDetailsModels.dart';
import '../ModelsPage/TripExpansesModels.dart';
import '../ModelsPage/TripExpansesModels1.dart';


import '../ModelsPage/TripsNewModels.dart';
import '../ModelsPage/VehicleIDPAge.dart';
import '../ModelsPage/redinessModelsstaus0.dart';
var DriverData;
var data123;
var DriverData2;
String token="";
String token3="";
String token4="";

//Login Post Api

FlutterSecureStorage store=const FlutterSecureStorage();
FlutterSecureStorage store1=const FlutterSecureStorage();
FlutterSecureStorage store4=const FlutterSecureStorage();
String baseUrl="https://canadalogistic.metalsart.in/dispatcherApp";







//ApproveDriverApi


Future<ApproveDriverModels> approveDriverApi()async{

  final res=await http.get(Uri.parse("$baseUrl/ApproveDriverAPI/"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    final json = res.body;
    return ApproveDriverModels.fromJson(jsonDecode(json.toString()),

    );
  }else{
    throw Exception("Failed to load ApproveDriverModels");
  }
}




// TripExpanses Api 


Future<TripExpansesModels> getTripExpansesApi()async{
  final res=await http.get(Uri.parse("$baseUrl/TripExpensesAPI/?status=1"),
  headers: {
    "Content-type":"application/josn;charset=UTF-8",
    "Authorization":token,
  }

  );
  if(res.statusCode==200){
    return TripExpansesModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load TripExpanses");
  }
}
Future<TripExpansesModels1> getTripExpansesApi1()async{
  final res=await http.get(Uri.parse("$baseUrl/TripExpensesAPI/?status=0"),
      headers: {
        "Content-type":"application/josn;charset=UTF-8",
        "Authorization":token,
      }

  );
  if(res.statusCode==200){
    return TripExpansesModels1.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load TripExpansesModels1");
  }
}

// VehicleDetailsApi


Future<VehicleDetailsModels> getVehicleDetails(int id)async{
  final res=await http.get(Uri.parse("$baseUrl/VehicleDetailAPI/?status=$id"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){

    return VehicleDetailsModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load VehicleDetailsModels");
  }
}


// Maintenance Recorde get Api

Future<MaintenanceRecordeModels> getMaintenanceRecordeApi()async{
  final res=await http.get(Uri.parse("$baseUrl/VehicleMaintenanceAPI/?status=1"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return MaintenanceRecordeModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load MaintenanceRecordeModels");
  }
}
var maintananceData;
Future<MaintananceData> getMaintenanceRecordeApi1()async{
  final res=await http.get(Uri.parse("$baseUrl/VehicleMaintenanceAPI/?status=0"),
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    return MaintananceData.fromJson(jsonDecode(res.body.toString()));

  }else{
    throw Exception("Failed to load MaintananceData");
  }
}
//Trips ListApi

var TripsListModels3;
Future<void> getTripsApi(page)async{
  //
  final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id=617fac7c611feecae48da6a8&page=$page"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return TripsListModels3=jsonDecode(res.body.toString());
  }else{
    throw Exception("Failed to load TripListModels");
  }

}


//TripsApi





//TripsApiNew


Future<TripNewModels> getTripsNewFunction()async{
  final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id=617fac7c611feecae48da6a8"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return TripNewModels.fromJson(jsonDecode(jsonDecode(res.body.toString())));
}else{
    throw Exception("Failed to load TripsListModels3");
  }
}



//ReadinessDdetailsApi

Future<ReadinessDetailsModels> getReadinessDetailsApiFunction()async{
  final res =await http.get(Uri.parse("$baseUrl/ReadinessFormAPI/"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return ReadinessDetailsModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load ReadinessDetailsModels");
  }
}

Future<ReadinessDetailsModels1> getReadinessDetailsApiFunction1()async{
  final res =await http.get(Uri.parse("$baseUrl/ReadinessFormAPI/?status=0"),
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    return ReadinessDetailsModels1.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load ReadinessDetailsModels");
  }
}

// ReadinessAllDetailsApi


//TripIdApi
var tripGetData;
Future<void> getTripsIdApiFunction(id)async{
  final res=await http.get(Uri.parse("$baseUrl/TripListForReadnessAPI/?id=$id"),
    headers: {
    "Content-type":"application/json;charset=UTF-8",
      "Authorization":token
    }
  );
  if(res.statusCode==200){
    return tripGetData=jsonDecode(res.body.toString());
  }else{
    throw Exception("Failed to load tripGetData");
  }
}




//ReadinessUpdateDataApi


Future<ReadinessDetailsModels> getReadinessDetailsApiUpdateApi(Map<String, dynamic> data)async{
  final res =await http.put(Uri.parse("$baseUrl/ReadinessFormAPI/"),body: data,
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    return ReadinessDetailsModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load ReadinessDetailsModels");
  }
}

//ReadinessFormApi






Future<VehicleDetailsModels> getVehicleDetails1(int id2)async{
  final res=await http.get(Uri.parse("$baseUrl/VehicleDetailAPI/?status=0"),
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    return VehicleDetailsModels.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Failed to load VehicleDetailsModels");
  }
}

var TripsAccepteModels1;
Future<void> getAcceptTripFunction(page1)async{
  final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id=619e22f1b34ebb0f38fe25ff&page=$page1"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return TripsAccepteModels1=jsonDecode(res.body.toString());
  }
  else{
    throw Exception("Failed to load TripsAccepteModels");
  }
}



// dispatchApi
var TripsDispatchModels2;
Future<void> getDispatchApi(page2)async{
  final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id=619e23bfb34ebb0f38fe2600&page=$page2"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    return TripsDispatchModels2=jsonDecode(res.body.toString());
  }else{
    throw Exception("Failed to load TripsDispatchModels");
  }
}


//Driver List Api


// Future<DriveListModels123> getDriverListApiFunction()async{
//   final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/DriverList1API/"),
//       headers:{
//         "Content-type":"application/json;charset=UTF-8",
//         "Authorization":token,
//       } );
//
//   if(res.statusCode==200){
//       return DriveListModels123.fromJson(jsonDecode(res.body.toString()));
//
//   }else{
//     throw Exception("Failed to load DriveListModels123");
//   }
// }


Future<void> getDriverApi()async{
  final res=await http.get(Uri.parse("$baseUrl/DriverCRUDAPI/?status=1"),
      headers:{
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,   }
  );
  if(res.statusCode==200){
    DriverData=jsonDecode(res.body.toString());
    print('driverDetails$DriverData');
  }else{
    throw Exception("Something Wrong");
  }
}

///InactiveApiDriver
Future<void> getDriver2Api()async{
  final res=await http.get(Uri.parse("$baseUrl/DriverCRUDAPI/?status=0"),
      headers:{
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,   }
  );
  if(res.statusCode==200){
    DriverData2=jsonDecode(res.body.toString());
  }else{
    throw Exception("Something Wrong");
  }
}





// vehiclesDetailsUpdateApi

var updatavehicles;

// Assign Loat to Driver getApi 
var assignLoadData;
Future<void> getAssignLoadToDriverApi(int id)async{
  final res=await http.get(Uri.parse("$baseUrl/AssignLoadToDriverAPI/?status=$id"),
    headers: {
    "Content-type":"application/json;charset=UTF-8",
      "Authorization":token,
    }
  );
  if(res.statusCode==200){
    assignLoadData=jsonDecode(res.body.toString());

    print('assignLoadData$assignLoadData');

  }else{
    throw Exception("Something Wrong");
  }
}


var assignLoadData1;
Future<void> getAssignLoadToDriverApi1(int id2)async{
  final res=await http.get(Uri.parse("$baseUrl/AssignLoadToDriverAPI/?status=$id2"),
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    assignLoadData1=jsonDecode(res.body.toString());
    print(assignLoadData1);
  }else{
    throw Exception("Something Wrong");
  }
}



// TripListApi
var tlidata;
Future<void> getTripListApiFunction()async{
  final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id=617fac7c611feecae48da6a8"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  }
  );
  if(res.statusCode==200){
    tlidata=jsonDecode(res.body.toString());
  }else{
    throw Exception("Something Wrong");
  }
}


//Driver AssignDetailsUpdateApi
var driverData;
Future<void> getDriverListApi()async{
  final res=await http.get(Uri.parse("$baseUrl/DriverListAPI/"),
      headers: {
        "Content-type":"application/json;charset=UTF-8",
        "Authorization":token,
      }
  );
  if(res.statusCode==200){
    driverData=jsonDecode(res.body.toString());
    print(driverData[1]["firstName"].toString());
  }else{
    throw Exception("Driver List Api error ");
  }
}


// Assign load Update Api
//var deliverd;
// Future<void> getDeleverdFunctionApi()async{
//   final res=await http.get(Uri.parse("$baseUrl/TripListAPI/?id="),headers: {
//     "Content-type":"application/json;charset=UTF-8",
//     "Authorization":token,
//   });
//   if(res.statusCode==200){
//     return deliverd=jsonDecode(res.body.toString());
//   }else{
//     throw Exception("Failed to load deliverd");
//   }
// }


// Profile Api
var profileData;
Future<void> getProfileApi()async{
  final res=await http.get(Uri.parse("$baseUrl/DispatcherProfileAPI/"),
  headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    profileData=jsonDecode(res.body.toString());
  }else{
    throw Exception("Something error");
  }
}


//VehicleIDApi
var vehicleDataId;
Future<VehicleDataId> getVehicleIdApi()async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/AdminApp/TrailerAPI/"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    //vehicleDataId=jsonEncode(res.body.toString());
    return VehicleDataId.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Something Error in vehicleDataId");
  }
}






Future<VehicleDataId> getVehicleIdApiFilter(vehicleId)async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/AdminApp/TrailerAPI/?id=$vehicleId"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    vehicleDataId=jsonDecode(res.body.toString());


      vehicleText=vehicleDataId['result']['Result'][0]['trailerName'].toString();
      print('vehicleText$vehicleText');

    return vehicleDataId;
      //VehicleDataId.fromJson(jsonDecode(res.body.toString()));
  }else{
    throw Exception("Something Error in vehicleDataId");
  }
}











var privacyPolicyData;
Future<void> getprivacypolicyAli()async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/AdminApp/PrivacyPolicyAPI/"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    privacyPolicyData=jsonDecode(res.body.toString());
  }else{
    throw Exception("Something error");
  }

}

// DeleverdApi

var DeleverdModels123;
Future<void>getDeleverdDataFunctionApi(page3)async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/TripListAPI/?id=617fac7c611feecae48da512&page=$page3"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    return DeleverdModels123=jsonDecode(res.body.toString());
  }else{
    throw Exception("Failed to load DeleverdModels123");
  }
}


var newDeleverdData;
Future<void>getNewDeleverdDataFunctionApi(page4)async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/TripListAPI/?id=619e2497b34ebb0f38fe2601&page=$page4"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    return newDeleverdData=jsonDecode(res.body.toString());
  }else{
    throw Exception("Failed to load newDeleverdData");
  }
}










//AssionLoadMODELS

var assionData;
Future<AssionLoadModels> getAssionLoadApi()async{
  final res=await http.get(Uri.parse("https://canadalogistic.metalsart.in/dispatcherApp/TripListAPI/?id=617fac7c611feecae48da6a8"),headers: {
    "Content-type":"application/json;charset=UTF-8",
    "Authorization":token,
  });
  if(res.statusCode==200){
    assionData=AssionLoadModels.fromJson(jsonDecode(res.body.toString()));
    print(assionData.length);
    return AssionLoadModels.fromJson(jsonDecode(res.body.toString()));
  }else {
    throw Exception(" Failed to load AssionLoadModels");
  }
}
