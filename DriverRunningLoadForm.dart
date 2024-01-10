import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Driver_Page/MyHomePage.dart';
import '../Driver_Page/RoundedButton/RoundedBotton.dart';
import '../Driver_Page/SaftySecurityPage/SaftySecurityPage.dart';
import '../Driver_Page/driverApiPage/driverPageApi.dart';


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';





bool saftySecuritaButton = false;

class DriverRunningLaodForm extends StatefulWidget {
  const DriverRunningLaodForm({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverRunningLaodForm> createState() => _DriverRunningLaodForm();
}

class _DriverRunningLaodForm extends State<DriverRunningLaodForm> {
  final loc.Location location = loc.Location();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  StreamSubscription<loc.LocationData>? _locationSubscription;
  final _formKey = GlobalKey<FormState>();
  var baseUrl = "data:image/jpg;base64,";
  bool loader = false;
  var name = "SelectCustomer";
  var name1 = "SelectFacilityName";
  var name2 = "SelectAuthorizedContractor";
  var name3 = "SelectCustomer";
  var id;
  File? selectImage2;
  String? base64Image2;
  File? selectImage3;
  String? base64Image3;
  File? selectImage4;
  String? base64Image4;
  File? selectImage5;
  String? base64Image5;
  File? selectImage6;
  String? base64Image6;
  File? selectImage7;
  String? base64Image7;
  File? selectImage8;
  String? base64Image8;
  File? selectImage9;
  String? base64Image9;
  // File? selectImage9;
  // String? base64Image9;
  late final TextEditingController question1 = TextEditingController();
  final TextEditingController customer = TextEditingController();
  final TextEditingController bridgePoint = TextEditingController();
  final TextEditingController foustatusAuth = TextEditingController();
  final TextEditingController facilityname = TextEditingController();
  final TextEditingController customer1 = TextEditingController();
  final TextEditingController answer = TextEditingController();
  final TextEditingController officer1 = TextEditingController();
  final TextEditingController truckNo = TextEditingController();
  final TextEditingController padlockImageLink = TextEditingController();
  File? selectImage;
  File? selectImage1;
  String? base64Image='';

  bool visible = false;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible6 = false;
  bool visible7 = false;

  DateTime _datetime = DateTime.now();
  late String? time1 = "";
  String images = "";
  String? verbal='';
  String statusText1 = "";
  String tripId1 = "";
  String? statuscr='';
  String? gps='';
  String? calldone='';
  String? readiness='';
  String? bol='';
  String? license='';
  String? safety='';
  String? padLock='';
  String? id1='';
  @override
  String imagePath = "";
  String base64String = "";
  final imagePicker = ImagePicker();

  var selectImage21;
  @override
  void dispose() {
    // base64Image;
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final timestamp = DateTime.now();
      final formattedDate = DateFormat.yMd().add_Hms().format(timestamp);

      // Construct the path where the image will be saved
      final path = '${(await getTemporaryDirectory()).path}/$formattedDate.png';

      // Take the picture and save it to the path
    //  await _controller.takePicture(path);

      // Display a message with the path where the picture was saved
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Picture taken. Saved at $path'),
        ),
      );
    } catch (e) {
      print("Error taking picture: $e");
    }
  }




  late Uint8List decodeImage;

  Future<void> chooseImage() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    selectImage = File(image!.path);
    selectImage = await _cropImage(imageFile: selectImage);
    setState(() {
      selectImage = File(image!.path);
    });
  }

  Future<File?> _cropImage({File? imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile!.path);
    if (croppedImage != null) {
      selectImage1 = File(croppedImage.path);
      Uint8List imageBytes = await croppedImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      print('$base64Image');
      copyFunction();
    }
  }

  var url;
  var url1;
  var url2;
  var url3;
  var url4;
  var url5;
  var url6;

  void copyFunction() {
    if (id == 2) {
      setState(() {
        selectImage2 = File(selectImage1!.path);
        base64Image2 = base64Image;
        print(base64Image2);
        url = baseUrl + base64Image2!;
      });
    }
    if (id == 3) {
      setState(() {
        selectImage3 = File(selectImage1!.path);
        base64Image3 = base64Image;
        url1 = baseUrl + base64Image3!;
        print(base64Image3);
      });
    }
    if (id == 4) {
      setState(() {
        selectImage4 = File(selectImage1!.path);
        base64Image4 = base64Image;
        url2 = baseUrl + base64Image4!;
        print(base64Image4);
      });
    }
    if (id == 5) {
      setState(() {
        selectImage5 = File(selectImage1!.path);
        base64Image5 = base64Image;
        print(base64Image5);
      });
    }
    if (id == 6) {
      setState(() {
        selectImage6 = File(selectImage1!.path);
        base64Image6 = base64Image;
        url3 = baseUrl + base64Image6!;
        print(base64Image6);
      });
    }
    if (id == 7) {
      setState(() {
        selectImage7 = File(selectImage1!.path);
        base64Image7 = base64Image;
        url4 = baseUrl + base64Image7!;
        print(base64Image7);
      });
    }
    if (id == 8) {
      setState(() {
        selectImage8 = File(selectImage1!.path);
        base64Image8 = base64Image;
        url5 = baseUrl + base64Image8!;
        print(base64Image8);
      });
    }
    if (id == 9) {
      setState(() {
        selectImage9 = File(selectImage1!.path);
        base64Image9 = base64Image;
        url6 = baseUrl + base64Image9!;
        print(base64Image9);
      });
    }
  }

  var verbalImage1;
  var precheckImage1;
  var saftyImage1;
  var saftyvestImage1;
  var driverlicenceImage1;
  var bolImage1;
  var podlockImage1;
  @override

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }
  void initState() {
    _requestPermission();
    _getLocation();
    print("Id:-$id1");
    super.initState();
    _initializeCamera();













    if (saftyImage1 != null) {
      visible = true;
    }
    if (verbalImage1 != null) {
      visible1 = true;
    }
    if (precheckImage1 != null) {
      visible2 = true;
    }
    if (bolImage1 != null) {
      visible4 = true;
    }
    if (driverlicenceImage1 != null) {
      visible5 = true;
    }
    if (saftyvestImage1 != null) {
      visible6 = true;
    }
    if (podlockImage1 != null) {
      visible7 = true;
    }
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> permissionHandler() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus == PermissionStatus.granted) {
      chooseImage();
    }
    if (cameraStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The permission is recommended.")));
    }
    if (cameraStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      print(
          'latitude:-${_locationResult.latitude},longitude:-${_locationResult.longitude}');
      // await FirebaseFirestore.instance.collection('location').doc('user1').set({
      //   'latitude': _locationResult.latitude,
      //   'longitude': _locationResult.longitude,
      //   'name': 'Dharmendra_Wasnik'
      // },

      SetOptions(merge: true);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Safety & Security Form",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue[300],
        centerTitle: true,
        elevation: 0,
      ),


      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(Icons.camera),
      ),



      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      //     child: Form(
      //       key: _formKey,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // SizedBox(
      //           //   height: size.height * 0.03,
      //           // ),
      //           // Center(
      //           //   child: Container(
      //           //     height: size.height * 0.06,
      //           //     width: size.width * 0.65,
      //           //     decoration: BoxDecoration(
      //           //       gradient: LinearGradient(colors: [
      //           //         Colors.cyan,
      //           //         Colors.cyanAccent,
      //           //         Colors.cyan,
      //           //         Colors.cyanAccent,
      //           //         Colors.cyan,
      //           //       ]),
      //           //       borderRadius: BorderRadius.only(
      //           //           topLeft: Radius.circular(60),
      //           //           bottomRight: Radius.circular(60)),
      //           //     ),
      //           //     child: Center(
      //           //         child: Text(
      //           //       "Safety & Security Form",
      //           //       style: TextStyle(
      //           //           color: Colors.black, fontWeight: FontWeight.bold),
      //           //     )),
      //           //   ),
      //           // ),
      //           // SizedBox(
      //           //   height: size.height * 0.02,
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Questions",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // TextFormField(
      //           //   controller: question1,
      //           //   cursorColor: Colors.black,
      //           //   decoration: InputDecoration(
      //           //       border: OutlineInputBorder(
      //           //           borderRadius: BorderRadius.circular(10)),
      //           //       hintText: " Enter Here"),
      //           // ),
      //           // SizedBox(
      //           //   height: size.height * 0.00,
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Customer",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Container(
      //           //   height: size.height * 0.08,
      //           //   width: double.infinity,
      //           //   //width: size.width * 0.90,
      //           //   decoration: BoxDecoration(
      //           //       color: Colors.white,
      //           //       borderRadius: BorderRadius.circular(10),
      //           //       border: Border.all(color: Colors.black45)),
      //           //   child: DropdownButton<String>(
      //           //     hint: Padding(
      //           //       padding: const EdgeInsets.all(8.0),
      //           //       child: Text(
      //           //         name,
      //           //         style: TextStyle(color: Colors.black54, fontSize: 17),
      //           //       ),
      //           //     ),
      //           //     // elevation: 0,
      //           //     isExpanded: true,
      //           //     underline: Row(),
      //           //     // isDense: false,
      //           //     //borderRadius: BorderRadius.circular(25),
      //           //     items: [
      //           //       DropdownMenuItem(
      //           //         child: Text("Coustomer A"),
      //           //         value: "Coustomer A",
      //           //       ),
      //           //       DropdownMenuItem(
      //           //         child: Text("Coustomer B"),
      //           //         value: "Coustomer B",
      //           //       )
      //           //     ],
      //           //     onChanged: (value) {
      //           //       setState(() {
      //           //         name = value.toString();
      //           //         print(name);
      //           //       });
      //           //     },
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Bridge Point",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // TextFormField(
      //           //   controller: bridgePoint,
      //           //   cursorColor: Colors.black,
      //           //   decoration: InputDecoration(
      //           //       border: OutlineInputBorder(
      //           //           borderRadius: BorderRadius.circular(10)),
      //           //       hintText: " Enter Here"),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "For",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // TextFormField(
      //           //   controller: foustatusAuth,
      //           //   cursorColor: Colors.black,
      //           //   decoration: InputDecoration(
      //           //       border: OutlineInputBorder(
      //           //           borderRadius: BorderRadius.circular(10)),
      //           //       hintText: " Enter Bpe Here"),
      //           // ),
      //           // SizedBox(
      //           //   height: size.height * 0.00,
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Facility Name",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Container(
      //           //   height: size.height * 0.08,
      //           //   width: double.infinity,
      //           //   //width: size.width * 0.90,
      //           //   decoration: BoxDecoration(
      //           //       color: Colors.white,
      //           //       borderRadius: BorderRadius.circular(10),
      //           //       border: Border.all(color: Colors.black45)),
      //           //   child: DropdownButton<String>(
      //           //     hint: Padding(
      //           //       padding: const EdgeInsets.all(8.0),
      //           //       child: Text(
      //           //         name1,
      //           //         style: TextStyle(color: Colors.black54, fontSize: 17),
      //           //       ),
      //           //     ),
      //           //     // elevation: 0,
      //           //     isExpanded: true,
      //           //     underline: Row(),
      //           //     // isDense: false,
      //           //     //borderRadius: BorderRadius.circular(25),
      //           //     items: [
      //           //       DropdownMenuItem(
      //           //         child: Text("T2E0A0-CALGARY[3461]"),
      //           //         value: "T2E0A0-CALGARY[3461]",
      //           //       ),
      //           //       DropdownMenuItem(
      //           //         child: Text("CANADA POST BURNABYPIF[4909]"),
      //           //         value: "CANADA POST BURNABYPIF[4909]",
      //           //       )
      //           //     ],
      //           //     onChanged: (value) {
      //           //       setState(() {
      //           //         name1 = value.toString();
      //           //         print(name1);
      //           //       });
      //           //     },
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Pick up appointment Date (Est)",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // SizedBox(
      //           //   height: size.height * 0.02,
      //           // ),
      //           // Container(
      //           //   height: size.height * 0.08,
      //           //   width: double.infinity,
      //           //   decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10),
      //           //       border: Border.all(color: Colors.grey)),
      //           //   child: Row(
      //           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           //     children: [
      //           //       IconButton(
      //           //           onPressed: () {
      //           //             showDatePicker(
      //           //                     context: context,
      //           //                     initialDate: DateTime.now(),
      //           //                     firstDate: DateTime(2000),
      //           //                     lastDate: DateTime(2030))
      //           //                 .then((value) {
      //           //               setState(() {
      //           //                 _datetime = value!;
      //           //                 time1 = _datetime.day.toString() +
      //           //                     "/" +
      //           //                     _datetime.month.toString() +
      //           //                     "/" +
      //           //                     _datetime.year.toString();
      //           //                 print(time1);
      //           //               });
      //           //             });
      //           //           },
      //           //           icon: Icon(
      //           //             Icons.calendar_today,
      //           //             color: Colors.red,
      //           //           )),
      //           //       Text(time1.toString()),
      //           //     ],
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Customer",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Container(
      //           //   height: size.height * 0.08,
      //           //   width: double.infinity,
      //           //   //width: size.width * 0.90,
      //           //   decoration: BoxDecoration(
      //           //       color: Colors.white,
      //           //       borderRadius: BorderRadius.circular(10),
      //           //       border: Border.all(color: Colors.black45)),
      //           //   child: DropdownButton<String>(
      //           //     hint: Padding(
      //           //       padding: const EdgeInsets.all(8.0),
      //           //       child: Text(
      //           //         name2,
      //           //         style: TextStyle(color: Colors.black54, fontSize: 17),
      //           //       ),
      //           //     ),
      //           //     // elevation: 0,
      //           //     isExpanded: true,
      //           //     underline: Row(),
      //           //     // isDense: false,
      //           //     //borderRadius: BorderRadius.circular(25),
      //           //     items: [
      //           //       DropdownMenuItem(
      //           //         child: Text("BRIDGEPOINT EXPRESS (BPX)"),
      //           //         value: "BRIDGEPOINT EXPRESS (BPX)",
      //           //       ),
      //           //       DropdownMenuItem(
      //           //         child: Text("AMERICAN TRUCKLINE"),
      //           //         value: "AMERICAN TRUCKLINE",
      //           //       )
      //           //     ],
      //           //     onChanged: (value) {
      //           //       setState(() {
      //           //         name2 = value.toString();
      //           //         print(name2);
      //           //       });
      //           //     },
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Answer",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // TextFormField(
      //           //   controller: answer,
      //           //   cursorColor: Colors.black,
      //           //   decoration: InputDecoration(
      //           //       border: OutlineInputBorder(
      //           //           borderRadius: BorderRadius.circular(10)),
      //           //       hintText: " Enter Here"),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Officer",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Container(
      //           //   height: size.height * 0.08,
      //           //   width: double.infinity,
      //           //   //width: size.width * 0.90,
      //           //   decoration: BoxDecoration(
      //           //       color: Colors.white,
      //           //       borderRadius: BorderRadius.circular(10),
      //           //       border: Border.all(color: Colors.black45)),
      //           //   child: DropdownButton<String>(
      //           //     hint: Padding(
      //           //       padding: const EdgeInsets.all(8.0),
      //           //       child: Text(
      //           //         name3,
      //           //         style: TextStyle(color: Colors.black54, fontSize: 17),
      //           //       ),
      //           //     ),
      //           //     // elevation: 0,
      //           //     isExpanded: true,
      //           //     underline: Row(),
      //           //     // isDense: false,
      //           //     //borderRadius: BorderRadius.circular(25),
      //           //     items: [
      //           //       DropdownMenuItem(
      //           //         child: Text("Coustomer A"),
      //           //         value: "Coustomer A",
      //           //       ),
      //           //       DropdownMenuItem(
      //           //         child: Text("Coustomer B"),
      //           //         value: "Coustomer B",
      //           //       )
      //           //     ],
      //           //     onChanged: (value) {
      //           //       setState(() {
      //           //         name3 = value.toString();
      //           //         print(name3);
      //           //       });
      //           //     },
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Image",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: images,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 images = value.toString();
      //           //                 id = 2;
      //           //                 visible = true;
      //           //
      //           //                 print(images);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: images,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 images = value.toString();
      //           //                 visible = false;
      //           //                 base64Image2 = "";
      //           //
      //           //                 selectImage2 = File("");
      //           //                 print(images);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: images,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 images = value.toString();
      //           //                 print(images);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(saftyImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage2 != null
      //           //                 ? Image.file(
      //           //                     selectImage2!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           Padding(
      //             padding: const EdgeInsets.all(3.0),
      //             child: Text(
      //               "Verbal Verification",
      //               style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 15),
      //             ),
      //           ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: verbal,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 verbal = value.toString();
      //           //                 id = 3;
      //           //                 visible1 = true;
      //           //
      //           //                 print(verbal);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: verbal,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 verbal = value.toString();
      //           //
      //           //                 visible1 = false;
      //           //                 base64Image3 = "";
      //           //                 selectImage3 = File("");
      //           //                 print(verbal);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: verbal,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 verbal = value.toString();
      //           //                 print(verbal);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible1,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(verbalImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage3 != null
      //           //                 ? Image.file(
      //           //                     selectImage3!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "GPS",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // RadioListTile(
      //           //   title: Text("Truck"),
      //           //   value: "truck",
      //           //   groupValue: gps,
      //           //   onChanged: (value) {
      //           //     setState(() {
      //           //       gps = value.toString();
      //           //       print(gps);
      //           //     });
      //           //   },
      //           // ),
      //           // RadioListTile(
      //           //   title: Text("Trailer"),
      //           //   value: "trailer",
      //           //   groupValue: gps,
      //           //   onChanged: (value) {
      //           //     setState(() {
      //           //       gps = value.toString();
      //           //       print(gps);
      //           //     });
      //           //   },
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Pre check call done",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: calldone,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 calldone = value.toString();
      //           //                 id = 4;
      //           //                 visible2 = true;
      //           //
      //           //                 print(calldone);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: calldone,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 calldone = value.toString();
      //           //                 visible2 = false;
      //           //                 base64Image4 = "";
      //           //                 selectImage4 = File("");
      //           //                 print(calldone);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: calldone,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 calldone = value.toString();
      //           //                 print(calldone);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible2,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(precheckImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage4 != null
      //           //                 ? Image.file(
      //           //                     selectImage4!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Readiness form filled",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: readiness,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 readiness = value.toString();
      //           //                 //  id = 5;
      //           //                 //  visible3 = true;
      //           //                 // chooseImage();
      //           //                 print(readiness);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: readiness,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 readiness = value.toString();
      //           //                 // visible3 = false;
      //           //                 //   base64Image5 = "";
      //           //                 // selectImage5 = File("");
      //           //                 print(readiness);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: readiness,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 readiness = value.toString();
      //           //                 print(readiness);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible3,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: AssetImage(''),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage5 != null
      //           //                 ? Image.file(
      //           //                     selectImage5!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     ),
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "BOL",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: bol,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 bol = value.toString();
      //           //                 id = 6;
      //           //                 visible4 = true;
      //           //
      //           //                 print(bol);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: bol,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 bol = value.toString();
      //           //                 visible4 = false;
      //           //                 base64Image6 = "";
      //           //                 selectImage6 = File("");
      //           //                 print(bol);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: bol,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 bol = value.toString();
      //           //                 print(bol);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible4,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(bolImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage6 != null
      //           //                 ? Image.file(
      //           //                     selectImage6!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Driver License",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: license,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 license = value.toString();
      //           //                 id = 7;
      //           //                 visible5 = true;
      //           //
      //           //                 print(license);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: license,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 license = value.toString();
      //           //                 visible5 = false;
      //           //                 base64Image7 = "";
      //           //                 selectImage7 = File("");
      //           //                 print(license);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("Partial"),
      //           //             value: "partial",
      //           //             groupValue: license,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 license = value.toString();
      //           //                 print(license);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible5,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(driverlicenceImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage7 != null
      //           //                 ? Image.file(
      //           //                     selectImage7!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Safety Vest,Boots,PPE,etc",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: safety,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 safety = value.toString();
      //           //                 id = 8;
      //           //                 visible6 = true;
      //           //
      //           //                 print(safety);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: safety,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 safety = value.toString();
      //           //                 visible6 = false;
      //           //                 base64Image8 = "";
      //           //                 selectImage8 = File("");
      //           //                 print(safety);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible6,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(saftyvestImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage8 != null
      //           //                 ? Image.file(
      //           //                     selectImage8!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Pad lock image link",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // Row(
      //           //   children: [
      //           //     Container(
      //           //       width: 150,
      //           //       height: 170,
      //           //       child: Column(
      //           //         children: [
      //           //           RadioListTile(
      //           //             title: Text("Yes"),
      //           //             value: "yes",
      //           //             groupValue: padLock,
      //           //             onChanged: (value) {
      //           //               setState(() async {
      //           //                 permissionHandler();
      //           //                 padLock = value.toString();
      //           //                 id = 9;
      //           //                 visible7 = true;
      //           //
      //           //                 print(padLock);
      //           //               });
      //           //             },
      //           //           ),
      //           //           RadioListTile(
      //           //             title: Text("No"),
      //           //             value: "no",
      //           //             groupValue: padLock,
      //           //             onChanged: (value) {
      //           //               setState(() {
      //           //                 padLock = value.toString();
      //           //                 visible7 = false;
      //           //                 base64Image9 = "";
      //           //                 selectImage9 = File("");
      //           //                 print(padLock);
      //           //               });
      //           //             },
      //           //           ),
      //           //         ],
      //           //       ),
      //           //     ),
      //           //     Visibility(
      //           //       visible: visible7,
      //           //       child: Expanded(
      //           //         child: Container(
      //           //           height: 130,
      //           //           width: 120,
      //           //
      //           //           decoration: BoxDecoration(
      //           //               borderRadius: BorderRadius.circular(10),
      //           //               color: Colors.transparent,
      //           //               image: DecorationImage(
      //           //                 image: NetworkImage(podlockImage1),
      //           //                 fit: BoxFit.cover,
      //           //               )),
      //           //           // radius: 75,
      //           //           // backgroundImage: AssetImage("assets/images/personImage.png"),
      //           //           // backgroundColor: Colors.blue[300],
      //           //           child: ClipRRect(
      //           //             borderRadius: BorderRadius.circular(10),
      //           //             child: selectImage9 != null
      //           //                 ? Image.file(
      //           //                     selectImage9!,
      //           //                     fit: BoxFit.cover,
      //           //                     height: 150,
      //           //                     width: 150,
      //           //                   )
      //           //                 : null,
      //           //           ),
      //           //         ),
      //           //       ),
      //           //     )
      //           //   ],
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(3.0),
      //           //   child: Text(
      //           //     "Truck Number",
      //           //     style: TextStyle(
      //           //         color: Colors.black,
      //           //         fontWeight: FontWeight.bold,
      //           //         fontSize: 15),
      //           //   ),
      //           // ),
      //           // TextFormField(
      //           //   controller: truckNo,
      //           //   cursorColor: Colors.black,
      //           //   decoration: InputDecoration(
      //           //       border: OutlineInputBorder(
      //           //           borderRadius: BorderRadius.circular(10)),
      //           //       hintText: " Enter Truck Number"),
      //           // ),
      //           // SizedBox(
      //           //   height: size.height * 0.03,
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.only(bottom: 25.0),
      //           //   child: Center(
      //           //     child: Container(
      //           //       height: size.height * 0.07,
      //           //       width: size.width * 0.90,
      //           //       decoration: BoxDecoration(
      //           //           color: Colors.lightBlue[300],
      //           //           borderRadius: BorderRadius.circular(08)),
      //           //       child: (saftySecuritaButton == true)
      //           //           ? RoundedBtn(
      //           //               onPress: () async {
      //           //                 setState(() {});
      //           //                 var baseUrl = "data:image/jpg;base64,";
      //           //                 if (id1!.isNotEmpty) {
      //           //                   http.Response response =
      //           //                       await http.get(Uri.parse(saftyImage1));
      //           //                   var uurl = base64Encode(response.bodyBytes);
      //           //
      //           //                   url = baseUrl + uurl;
      //           //                   http.Response response1 =
      //           //                       await http.get(Uri.parse(verbalImage1));
      //           //                   var uurl1 = base64Encode(response1.bodyBytes);
      //           //
      //           //                   url1 = baseUrl + uurl1;
      //           //                   http.Response response2 =
      //           //                       await http.get(Uri.parse(precheckImage1));
      //           //                   var uurl2 = base64Encode(response2.bodyBytes);
      //           //
      //           //                   url2 = baseUrl + uurl2;
      //           //                   http.Response response3 =
      //           //                       await http.get(Uri.parse(bolImage1));
      //           //                   var uurl3 = base64Encode(response3.bodyBytes);
      //           //                   url3 = baseUrl + uurl3;
      //           //                   http.Response response4 = await http
      //           //                       .get(Uri.parse(driverlicenceImage1));
      //           //                   var uurl4 = base64Encode(response4.bodyBytes);
      //           //                   url4 = baseUrl + uurl4;
      //           //
      //           //                   http.Response response5 = await http
      //           //                       .get(Uri.parse(saftyvestImage1));
      //           //                   var uurl5 = base64Encode(response5.bodyBytes);
      //           //                   url5 = baseUrl + uurl5;
      //           //                   http.Response response6 =
      //           //                       await http.get(Uri.parse(podlockImage1));
      //           //                   var uurl6 = base64Encode(response6.bodyBytes);
      //           //                   url6 = baseUrl + uurl6;
      //           //                 }
      //           //                 if (base64Image2 != null) {
      //           //                   url = baseUrl + base64Image2!;
      //           //                 }
      //           //                 if (base64Image3 != null) {
      //           //                   url1 = baseUrl + base64Image3!;
      //           //                 }
      //           //                 if (base64Image4 != null) {
      //           //                   url2 = baseUrl + base64Image4!;
      //           //                 }
      //           //                 if (base64Image5 != null) {
      //           //                   //    url3 = baseUrl + base64Image5!;
      //           //                 }
      //           //                 if (base64Image6 != null) {
      //           //                   url3 = baseUrl + base64Image6!;
      //           //                 }
      //           //                 if (base64Image7 != null) {
      //           //                   url4 = baseUrl + base64Image7!;
      //           //                 }
      //           //                 if (base64Image8 != null) {
      //           //                   url5 = baseUrl + base64Image8!;
      //           //                 }
      //           //                 if (base64Image9 != null) {
      //           //                   url6 = baseUrl + base64Image2!;
      //           //                 }
      //           //
      //           //                 print(
      //           //                     "base64$url$url1$url2$url3$url4$url5$url6");
      //           //
      //           //                 var data = {
      //           //                   "statusText": statusText1.toString(),
      //           //                   "tripId": tripId1.toString(),
      //           //                   "BPEOrder": foustatusAuth.text.toString(),
      //           //                   "statusfn": name1.toString(),
      //           //                   "statuscr": name.toString(),
      //           //                   "lastAnnualSafetyCheckDate": time1.toString(),
      //           //                   "statusAuth": name2,
      //           //                   "statusOfficer": name3.toString(),
      //           //                   "select1": images.toString(),
      //           //                   "selectVerbalVerify": verbal.toString(),
      //           //                   "selectGps": gps.toString(),
      //           //                   "selectCallDone": calldone.toString(),
      //           //                   "selectReadinessForm": readiness.toString(),
      //           //                   "selectBol": bol.toString(),
      //           //                   "selectDriverLc": license.toString(),
      //           //                   "selectSafety": safety.toString(),
      //           //                   "question1": question1.text.toString(),
      //           //                   "bridgePoint": bridgePoint.text.toString(),
      //           //                   "foustatusAuth":
      //           //                       foustatusAuth.text.toString(),
      //           //                   "answer": answer.text.toString(),
      //           //                   "lockimage": padLock.toString(),
      //           //                   "truckNo": truckNo.text.toString(),
      //           //                   "id": id1,
      //           //                   "saftyImage": url,
      //           //                   "verbalImage": url1,
      //           //                   "precheckImage": url2,
      //           //                   "bolImage": url3,
      //           //                   "driverlicenceImage": url4,
      //           //                   "saftyvestImage": url5,
      //           //                   "podlockImage": url6,
      //           //                 };
      //           //
      //           //                 print("data:-$data");
      //           //                 if (_formKey.currentState!.validate()) {
      //           //                   postSecurityApi1(data);
      //           //                   setState(() {
      //           //                     loader = true;
      //           //                   });
      //           //                 } else {
      //           //                   ScaffoldMessenger.of(context).showSnackBar(
      //           //                     const SnackBar(
      //           //                         backgroundColor: Colors.red,
      //           //                         content: Text('Invalid value')),
      //           //                   );
      //           //                 }
      //           //                 setState(() {
      //           //                   Future.delayed(Duration(seconds: 3), () {
      //           //                     loader = false;
      //           //                   });
      //           //                 });
      //           //                 Navigator.of(context).pop();
      //           //               },
      //           //               text: Center(
      //           //                 child: (loader == false)
      //           //                     ? Text(
      //           //                         "Update",
      //           //                         style: TextStyle(
      //           //                             color: Colors.white,
      //           //                             fontWeight: FontWeight.bold,
      //           //                             fontSize: 16),
      //           //                       )
      //           //                     : SizedBox(
      //           //                         height: 15,
      //           //                         width: 15,
      //           //                         child: CircularProgressIndicator(
      //           //                           color: Colors.white,
      //           //                           strokeWidth: 2,
      //           //                         )),
      //           //               ))
      //           //           : RoundedBtn(
      //           //               onPress: () {
      //           //                 setState(() {});
      //           //
      //           //                 print("$url$url1$url2$url3$url4$url5");
      //           //
      //           //                 var data = {
      //           //                   "statusText": statusText1.toString(),
      //           //                   "tripId": tripId1.toString(),
      //           //                   "BPEOrder": foustatusAuth.text.toString(),
      //           //                   "statusfn": name1.toString(),
      //           //                   "statuscr": name.toString(),
      //           //                   "lastAnnualSafetyCheckDate": time1.toString(),
      //           //                   "statusAuth": name2,
      //           //                   "statusOfficer": name3.toString(),
      //           //                   "select1": images.toString(),
      //           //                   "selectVerbalVerify": verbal.toString(),
      //           //                   "selectGps": gps.toString(),
      //           //                   "selectCallDone": calldone.toString(),
      //           //                   "selectReadinessForm": readiness.toString(),
      //           //                   "selectBol": bol.toString(),
      //           //                   "selectDriverLc": license.toString(),
      //           //                   "selectSafety": safety.toString(),
      //           //                   "question1": question1.text.toString(),
      //           //                   "bridgePoint": bridgePoint.text.toString(),
      //           //                   "foustatusAuth":
      //           //                       foustatusAuth.text.toString(),
      //           //                   "answer": answer.text.toString(),
      //           //                   "lockimage": padLock.toString(),
      //           //                   "truckNo": truckNo.text.toString(),
      //           //                   "saftyImage": url,
      //           //                   "verbalImage": url1,
      //           //                   "precheckImage": url2,
      //           //                   "bolImage": url3,
      //           //                   "driverlicenceImage": url4,
      //           //                   "saftyvestImage": url5,
      //           //                   "podlockImage": url6,
      //           //                   "id": id1
      //           //                 };
      //           //
      //           //                 print("data:-$data");
      //           //                 if (_formKey.currentState!.validate()) {
      //           //                   postSecurityApi(data);
      //           //                   setState(() {
      //           //                     loader = true;
      //           //                     controller3.animateTo(1);
      //           //                   });
      //           //                 } else {
      //           //                   ScaffoldMessenger.of(context).showSnackBar(
      //           //                     const SnackBar(
      //           //                         backgroundColor: Colors.red,
      //           //                         content: Text('Invalid value')),
      //           //                   );
      //           //                 }
      //           //                 setState(() {
      //           //                   Future.delayed(Duration(seconds: 3), () {
      //           //                     loader = false;
      //           //                   });
      //           //                 });
      //           //                 Navigator.of(context).pop();
      //           //               },
      //           //               text: Center(
      //           //                 child: (loader == false)
      //           //                     ? Text(
      //           //                         "Save",
      //           //                         style: TextStyle(
      //           //                             color: Colors.white,
      //           //                             fontWeight: FontWeight.bold,
      //           //                             fontSize: 16),
      //           //                       )
      //           //                     : SizedBox(
      //           //                         height: 15,
      //           //                         width: 15,
      //           //                         child: CircularProgressIndicator(
      //           //                           color: Colors.white,
      //           //                           strokeWidth: 2,
      //           //                         )),
      //           //               )),
      //           //     ),
      //           //   ),
      //           // ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> postSecurityApi1(data) async {
    var data1 = jsonEncode(data);
    final res = await http.put(
        Uri.parse(
            "https://canadalogistic.metalsart.in/driverApp/updateSafetySecurityAPI/"),
        body: data1,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token1,
        });

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Update Data Successfully...')),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SaftySecurityPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red, content: Text('Something error')),
      );
    }
  }

  Future<void> postSecurityApi(data) async {
    var data1 = jsonEncode(data);
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/driverApp/SafetySecurityFormAPI/"),
        body: data1,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Authorization": token1,
        });

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Submit Data Successfully...')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));

      // Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red, content: Text('Something error')),
      );
    }
  }
}
