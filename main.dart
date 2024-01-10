// import 'package:emoji_alert/constants.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import 'package:bridge_point_logistics/splash_Screen_Page/Splash_Screen_Page.dart';
// import 'package:flutter/material.dart';
//
// import 'DrawClip/DrawClip.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("_firebaseMessagingBackgroundHandler");
//   print(message.notification!.title.toString());
//   print(message.notification!.body.toString());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: ImageZoomTesting(),
//       home: SplashScreenPage(),
//     //   home:EmojiAlert()
//     );
//   }
// }
//
//
//
//
//
//
//
// class DesignPage extends StatefulWidget {
//   const DesignPage({super.key});
//
//   @override
//   State<DesignPage> createState() => _DesignPageState();
// }
//
// class _DesignPageState extends State<DesignPage> {
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//
//     return SafeArea(
//         child: Scaffold(
//             body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               ClipPath(
//                 clipper: DrawClip2(),
//                 child: Container(
//                   width: size.width,
//                   height: size.height * 0.8,
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.bottomRight,
//                           colors: [Color(0xffa58fd2), Color(0xffddc3fc)])),
//                 ),
//               ),
//               ClipPath(
//                 clipper: DrawClip(),
//                 child: Container(
//                   width: size.width,
//                   height: size.height * 0.8,
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [Color(0xffddc3fc), Color(0xff91c5fc)])),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     )));
//   }
// }
//
// class DrawClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.80);
//     path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
//         size.height / 2, size.width, size.height * 0.8);
//     path.lineTo(size.width, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
//
// class DrawClip2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.80);
//     path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
//         size.height / 2, size.width, size.height * 0.9);
//     path.lineTo(size.width, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }




///-------------upper main project code----------------------------------------





// class ImageZoomTesting extends StatefulWidget {
//   const ImageZoomTesting({super.key});
//
//   @override
//   State<ImageZoomTesting> createState() => _ImageZoomTestingState();
// }
//
// class _ImageZoomTestingState extends State<ImageZoomTesting>
//     with SingleTickerProviderStateMixin
// {
//   double termConditionAnimation=0;
//   TapDownDetails? topDownDetails;
//   late TransformationController controller;
//   bool isChecked = false;
//
//   late AnimationController animationController;
//   Animation<Matrix4>? animation;
//
//
//   void initState() {
//     controller=TransformationController();
//     animationController=AnimationController(vsync: this,
//       duration: Duration(milliseconds: 300),
//     )..addListener(() {
//       controller.value=animation!.value;
//     });
//
//     super.initState();
//     // _requestPermission();
//     // _getLocation();
//     // location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
//     // location.enableBackgroundMode(enable: false);
//   }
//   @override
//   void dispose() {
//     controller.dispose();
//     animationController.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedPositioned(
//         top: termConditionAnimation,
//         right: 1, left: 1,
//         //  top: termConditionAnimation,
//         duration: (const Duration(seconds: 1)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Container(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.white),
//                       child: Center(
//                           child: Text(
//                             "Bridge Point Logistics Group Terms & Condition",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           )),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: InteractiveViewer(
//                       maxScale: 5.0,
//                       minScale: 0.1,
//                       child: Image.asset('assets/images/page-1.jpg',
//                           width: MediaQuery.of(context).size.width,
//                           height: 500),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset('assets/images/page-2.jpg',
//                         width: MediaQuery.of(context).size.width,
//                         height: 500),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: GestureDetector(
//                       onDoubleTapDown: (details){
//                         topDownDetails=details;
//                       },
//                       onTap: (){
//                         final position=topDownDetails!.localPosition;
//                         final double scale=3;
//                         final x=-position.dx*(scale-1);
//                         final y=-position.dy*(scale-1);
//                         final zoomed =Matrix4.identity()
//                           ..translate(x,y)..
//
//                           scale(scale);
//
//                         final end=controller.value.isIdentity()?zoomed:Matrix4.identity();
//
//
//
//
//                         animation=Matrix4Tween(
//                           begin: controller.value,
//                           end: end,
//                         ).animate(
//                             CurveTween(curve: Curves.easeOut).animate(animationController)
//
//                         );
//                         animationController.forward(from: 0);
//                       },
//                       child: InteractiveViewer(
//
//                         transformationController: controller,
//                         panEnabled: false,
//                         scaleEnabled: false,
//                         child: AspectRatio(
//                           aspectRatio: 1,
//                           child: Image.asset('assets/images/page-3.jpg',
//                               width: MediaQuery.of(context).size.width,
//                               height: 500),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, bottom: 25),
//                     child: Container(
//                       child: Center(
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                               "I have accepted all term & condition",
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Checkbox(
//                               checkColor: Colors.white,
//                               value: isChecked,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   isChecked = value!;
//                                   termConditionAnimation = 1200;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       width: MediaQuery.of(context).size.width,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 200,
//                   )
//                 ],
//               ),
//             ),
//             width: MediaQuery.of(context).size.width,
//             height: 700,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.red.withOpacity(0.7),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'Driver_Page/NewtripSafetySecurity.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late ScreenshotController _screenShortController = ScreenshotController();
  String? address = '', adddress2 = '';
  late CameraController _controller;
  final loc.Location location = loc.Location();
  double? lat = 0;
  double? long = 0;
  File? imgFile;
  var url;
  @override
  void initState() {
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
    super.initState();
    _getLocation();
    permissionHandler();
    _requestPermission();
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
      // chooseImage();
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
      //  print('latitude:-${_locationResult.latitude},longitude:-${_locationResult.longitude}');
      lat = _locationResult.latitude;
      long = _locationResult.longitude;

      //  List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
      //  address=locations.last.latitude.toString()+" "+locations.last.longitude.toString();
      // lat=locations.last.latitude;
      // long=locations.last.latitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long!);
      setState(() {
        adddress2 = placemarks.reversed.last.country.toString() +
            " " +
            placemarks.reversed.last.administrativeArea.toString() +
            " " +
            placemarks.reversed.last.locality.toString();
      });

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

  var baseUrl = "data:image/jpg;base64,";
  String? imagePath1;
  Uint8List? imagePath;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body:(imagePath == null)? cameraFunction(): Column(
          children: [
            Container(
            width: 175,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.red),
            ),
            child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                )),
      ),
            Column(
              children: [
                Text(" DateTime & Location Capture image Function",style: TextStyle(fontSize: 20,color: Colors.blue),),

                ElevatedButton(onPressed:(){
                  setState(() {
                    imagePath=null;
                  });
                }, child:Text("Click")),
                ElevatedButton(onPressed:(){
                  setState(() {
                  if(Platform.isAndroid){
                    SystemNavigator.pop();
                  }else{
                    exit(0);
                  }
                  });
                }, child:Text("Exit"))
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget cameraFunction(){
    return Screenshot(
      controller: _screenShortController,
      child: InkWell(
        onTap: () async {
          url=" ";
          imagePath = (await _screenShortController.capture())!;
          imagePath1 = base64Encode(imagePath!);
          url=" ${baseUrl}${imagePath1}";
          print("hfghfhfhgfhfghhf${imagePath}");
          print("base64    ${baseUrl}${imagePath1}");

          if(url.toString().isNotEmpty){

          }
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: CameraPreview(_controller),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 25),
              child: Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateTime.now().year.toString() +
                            "-" +
                            DateTime.now().month.toString() +
                            "-" +
                            DateTime.now().day.toString() +
                            "," +
                            DateTime.now().hour.toString() +
                            ":" +
                            DateTime.now().minute.toString() +
                            ":" +
                            DateTime.now().second.toString(),
                        style: TextStyle(color: Colors.red,fontSize: 15),
                      ),
                      Text(
                        '$adddress2',
                        style: TextStyle(color: Colors.red,fontSize: 15),
                      ),
                    ],
                  )),
            ),
            // imagePath == null
            //     ? SizedBox(
            //         width: 0,
            //         height: 0,
            //        // child: Text('No ScreenShort'),
            //       )
            //     : Container(
            //         width: 200,
            //   height: 300,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           border: Border.all(color: Colors.red),
            //         ),
            //         child: Center(
            //             child: Image.memory(
            //           imagePath!,
            //           fit: BoxFit.cover,
            //         )),
            //       ),
          ],
        ),
      ),
    );
  }
  Future<void> postApi() async {
   var  data = {
      "fullName": "Naresh Bariya",
      "carrierName": "Ashok LyLand",
      "uniqueId": "78654",
      "email": "maresh@gmail.com",
      "countryCode":"+91",
      "mobileNo": "9874785698",
      "password":"12345678",
      "image": url,
    };


    var dataa = jsonEncode(data);
    print(dataa);
    final res = await http.post(
        Uri.parse(
            "https://canadalogistic.metalsart.in/dispatcherApp/SingUpAddAPI/"),
        body: dataa,
        headers: {"Content-type": "application/json;charset=UTF-8"});
    print("ApiFunction Calling");
    if (res.statusCode == 200) {
      print("ApiFunction Calling");
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => DispatcherLoginRegisterPage())
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('Success..')),
      );
    } else {
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green, content: Text('Invalid Value')),
        );
      }
    }
  }
}












// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image/image.dart' as img;
// import 'package:intl/intl.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   List<CameraDescription> cameras = await availableCameras();
//   runApp(MyApp(cameras: cameras));
// }
//
// class MyApp extends StatelessWidget {
//   final List<CameraDescription> cameras;
//
//   const MyApp({Key? key, required this.cameras}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CameraScreen(cameras: cameras),
//     );
//   }
// }
//
// class CameraScreen extends StatefulWidget {
//   final List<CameraDescription> cameras;
//
//   const CameraScreen({Key? key, required this.cameras}) : super(key: key);
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = CameraController(
//       widget.cameras[0],
//       ResolutionPreset.medium,
//     );
//
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return Container();
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Camera Example')),
//       body: CameraPreview(controller),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           try {
//             XFile file = await controller.takePicture();
//
//             // Access the timestamp of the photo
//             DateTime timestamp = DateTime.now();
//
//             // Format the timestamp using the intl package
//             String formattedTimestamp =
//             DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp);
//
//             // Add the timestamp to the image
//             Uint8List imageWithTimestamp = await addTimestampToImage(
//               file!.readAsBytesSync(),
//               formattedTimestamp,
//             );
//
//             // Display the image with timestamp
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text('Capture Image with Timestamp'),
//                 content: Image.memory(imageWithTimestamp),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           } catch (e) {
//             print('Error taking picture: $e');
//           }
//         },
//         child: Icon(Icons.camera),
//       ),
//     );
//   }
//
//   Future<Uint8List> addTimestampToImage(
//       Uint8List imageBytes,
//       String timestamp,
//       ) async {
//     // Decode the image
//     img.Image image = img.decodeImage(imageBytes) as img.Image;
//
//     // Create a Paint object to draw on the image
//     final Paint paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 5.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     // Create a Canvas to draw on the image
//     final Canvas canvas = Canvas(image as ui.PictureRecorder);
//
//     // Set the font for the timestamp text
//     final textStyle = ui.TextStyle(
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     );
//
//     // Create a Paragraph and layout the text
//     final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle(
//       textAlign: TextAlign.center,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ))
//       ..pushStyle(textStyle)
//       ..addText(timestamp);
//
//     final paragraph = paragraphBuilder.build()
//       ..layout(ui.ParagraphConstraints(width: image.width.toDouble()));
//
//     // Draw the timestamp on the image
//     canvas.drawRect(
//         Rect.fromPoints(Offset(0, image.height - 30), Offset(image.width.toDouble(), image.height.toDouble())),
//         Paint()..color = Colors.black.withOpacity(0.7));
//
//     canvas.drawParagraph(
//       paragraph,
//       Offset((image.width - paragraph.maxIntrinsicWidth) / 2, image.height - 30),
//     );
//
//     // Encode the image back to bytes
//     Uint8List resultBytes = img.encodeJpg(image);
//
//     return resultBytes;
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }



//
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ScreenshotApp(),
//     );
//   }
// }
//
// class ScreenshotApp extends StatefulWidget {
//   @override
//   _ScreenshotAppState createState() => _ScreenshotAppState();
// }
//
// class _ScreenshotAppState extends State<ScreenshotApp> {
//   ScreenshotController screenshotController = ScreenshotController();
//   String base64Image = '';
//   Uint8List? imageBytes;
//   Future<void> _captureAndShowScreenshot() async {
//     // Capture the screenshot
//      imageBytes = await screenshotController.capture();
//
//     // Save the screenshot to the gallery
//     final result = await ImageGallerySaver.saveImage(imageBytes!);
//
//     print('Image saved $imageBytes to gallery: $result');
//
//     // Convert the image to base64 string
//     String base64String = 'data:image/png;base64,${base64Encode(imageBytes!)}';
//     print(base64String);
//
//     setState(() {
//       base64Image = base64String;
//     });
//   }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     permissionHandler();
//     _requestPermission();
//   }
//
//
//   _requestPermission() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       print('done');
//     } else if (status.isDenied) {
//       _requestPermission();
//     } else if (status.isPermanentlyDenied) {
//       openAppSettings();
//     }
//   }
//
//   Future<void> permissionHandler() async {
//     PermissionStatus cameraStatus = await Permission.camera.request();
//     if (cameraStatus == PermissionStatus.granted) {
//       // chooseImage();
//     }
//     if (cameraStatus == PermissionStatus.denied) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("The permission is recommended.")));
//     }
//     if (cameraStatus == PermissionStatus.permanentlyDenied) {
//       openAppSettings();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screenshot and Base64'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Screenshot(
//               controller: screenshotController,
//               child: Container(
//                 color: Colors.blue,
//                 padding: EdgeInsets.all(20.0),
//                 child: Text(
//                   'This is the content you want to capture!',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _captureAndShowScreenshot,
//               child: Text('Capture Screenshot'),
//             ),
//             SizedBox(height: 20.0),
//             imageBytes != null
//                 ? Image.memory( imageBytes!
//               ,
//               height: 200.0,
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/rendering.dart';
//
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart' as loc;
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image/image.dart' as img;
//
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:screenshot/screenshot.dart';
//
// import 'Driver_Page/NewtripSafetySecurity.dart';
//
// late List<CameraDescription> cameras;
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CameraScreen(),
//     );
//   }
// }
// late CameraController _controller;
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});
//
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   late ScreenshotController _screenShortController=ScreenshotController();
//   String? address = '', adddress2 = '';
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   final loc.Location location = loc.Location();
//   double? lat = 0;
//   double? long = 0;
//   File? imgFile;
//   @override
//   void initState() {
//     _controller = CameraController(cameras[0], ResolutionPreset.medium);
//     _initializeControllerFuture = _controller.initialize();
//     // controllerinitialize().then(() {
//     //   if (!mounted) {
//     //     return;
//     //   }
//     //   setState(() {});
//     // }).catchError((e) {
//     //   if (e is CameraException) {
//     //     switch (e.code) {
//     //       case 'CameraAccessDenied':
//     //         print("access was denied");
//     //         break;
//     //       default:
//     //         print(e.description);
//     //         break;
//     //     }
//     //   }
//     // });
//     super.initState();
//     _getLocation();
//     permissionHandler();
//     _requestPermission();
//   }
//
//   _requestPermission() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       print('done');
//     } else if (status.isDenied) {
//       _requestPermission();
//     } else if (status.isPermanentlyDenied) {
//       openAppSettings();
//     }
//   }
//
//   Future<void> permissionHandler() async {
//     PermissionStatus cameraStatus = await Permission.camera.request();
//     if (cameraStatus == PermissionStatus.granted) {
//       // chooseImage();
//     }
//     if (cameraStatus == PermissionStatus.denied) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("The permission is recommended.")));
//     }
//     if (cameraStatus == PermissionStatus.permanentlyDenied) {
//       openAppSettings();
//     }
//   }
//
//   _getLocation() async {
//     try {
//       final loc.LocationData _locationResult = await location.getLocation();
//       //  print('latitude:-${_locationResult.latitude},longitude:-${_locationResult.longitude}');
//       lat = _locationResult.latitude;
//       long = _locationResult.longitude;
//
//       //  List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
//       //  address=locations.last.latitude.toString()+" "+locations.last.longitude.toString();
//       // lat=locations.last.latitude;
//       // long=locations.last.latitude;
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long!);
//       setState(() {
//         adddress2 = placemarks.reversed.last.country.toString() +
//             " " +
//             placemarks.reversed.last.administrativeArea.toString() +
//             " " +
//             placemarks.reversed.last.locality.toString();
//       });
//
//       // await FirebaseFirestore.instance.collection('location').doc('user1').set({
//       //   'latitude': _locationResult.latitude,
//       //   'longitude': _locationResult.longitude,
//       //   'name': 'Dharmendra_Wasnik'
//       // },
//
//       SetOptions(merge: true);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   var baseUrl = "data:image/jpg;base64,";
//   String? imagePath1;
//   Uint8List? imagePath;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Screenshot(
//
//           controller: _screenShortController,
//           child: InkWell(
//             onTap: () async {
//               imagePath=(await _screenShortController.capture())!;
//               imagePath1= base64Encode(imagePath!);
//
//
//
//
//               print("hfghfhfhgfhfghhf${imagePath}");
//               print("base64    ${baseUrl}${imagePath1}");
//
//
//
//
//               setState(() {
//
//               });
//             },
//             child: Stack(
//               children: [
//                 Container(
//                   height: double.infinity,
//                   child: CameraPreview(
//
//                       _controller),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 150, left: 25),
//                   child: Positioned(
//
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             DateTime.now().year.toString() +
//                                 "-" +
//                                 DateTime.now().month.toString() +
//                                 "-" +
//                                 DateTime.now().day.toString() +
//                                 "," +
//                                 DateTime.now().hour.toString() +
//                                 ":" +
//                                 DateTime.now().minute.toString() +
//                                 ":" +
//                                 DateTime.now().second.toString(),
//                             style: TextStyle(color: Colors.red),
//                           ),
//                           Text(
//                             '$adddress2',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ],
//                       )),
//                 ),
//                 imagePath==null?SizedBox(width: 200,height: 200,
//                   child: Text('No ScreenShort',style: TextStyle(color: Colors.red,fontSize: 55),),
//                 ):Container(width: 200,height: 350,
//
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.red,),
//   color: Colors.transparent
//                   ),
//                   child: Center(child: Image.memory(imagePath!,fit: BoxFit.cover,)),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image/image.dart' as img;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   final camera = cameras.first;
//
//   runApp(MyApp(camera: camera));
// }
//
// class MyApp extends StatelessWidget {
//   final CameraDescription camera;
//
//   const MyApp({Key? key, required this.camera}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyCameraApp(camera: camera),
//     );
//   }
// }
//
// class MyCameraApp extends StatefulWidget {
//   final CameraDescription camera;
//
//   const MyCameraApp({Key? key, required this.camera}) : super(key: key);
//
//   @override
//   _MyCameraAppState createState() => _MyCameraAppState();
// }
//
// class _MyCameraAppState extends State<MyCameraApp> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );
//
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera Process App'),
//       ),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           // Take a picture and process the frame
//           final image = await _controller.takePicture();
//
//           // Access the image data
//           img.Image imgData = img.decodeImage(image.readAsBytesSync())!;
//
//           // Process the image (e.g., detect watermark)
//           bool hasWatermark = detectWatermark(imgData);
//
//           // Display the result
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text('Watermark Detection'),
//               content: Text(hasWatermark ? 'Watermark detected!' : 'No watermark found.'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: Icon(Icons.camera),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
//
//   bool detectWatermark(img.Image image) {
//     // Implement your watermark detection logic here
//     // For simplicity, this example always returns true
//     return true;
//   }
// }
// import 'package:intl/intl.dart';
//
// void main() {
//  // String originalString = "2023-Apr-14 60.00";20-12-2023-04:00 PM
//   String originalString = "28-12-2023-05:00 PM";
//
//  // Split the original string into parts using both dashes and spaces
//   List<String> parts = originalString.split(RegExp(r"[-\s.:]+"));
//   print(parts[0]);
//   print(parts[1]);
//   print(parts[2]);
//   print(parts[3]);
//   var netData = "${parts[2]}-${parts[1]}-${parts[0]} ${parts[3]}:00:00.000";
//
//
//
//
//
//   DateTime _dateTime1=DateTime.now();
//  String date=DateFormat("yyyy-MM-dd hh:mm a").format(_dateTime1);
//
//
//
//
//
//
//
//
//
//
//  print(date);
// //print("hfghdh$_dateTime1");
//
//
//
//
//
//
//
//   List<String> parts1 = date.split(RegExp(r"[-\s.:]+"));
//
//   print(parts1[0]);
//   print(parts1[1]);
//   print(parts1[2]);
//   print(parts1[3]);
//   print("server_value$netData");
//   var netData1 = "${parts1[0]}-${parts1[1]}-${parts1[2]} ${parts1[3]}:00:00.000";
//   print("currentvalue$netData1");
//
//
//
//
//
//
//
//
//
//
//  DateTime date1 = DateTime.parse(netData1.toString());
//  DateTime date2 = DateTime.parse(netData.toString());
//
//
//
//
//  int dateTimeDifferenc = date2.difference(date1).inHours;
// print("hour$dateTimeDifferenc");
//
// // Globle varible
//
// if(dateTimeDifferenc<=2){
//   print(true);
// }else{
//   print(false);
// }
//
// DateTime date1 = DateTime.parse(date);
// int dateTimeDifferenc = date2.difference(date1).inHours;
//  print(dateTimeDifferenc);
// int? Jan = 1;
// int? Feb = 2;
// int? March = 3;
// int? Apri = 4;
// int? May = 5;
// int? June = 6;
// int? July = 7;
// int? Aug = 8;
// int? Sep = 9;
// int? Oct = 10;
// int? Nov = 11;
// int? Dec = 12;
// List<int> month = [
//   Jan,
//   Feb,
//   March,
//   Apri,
//   May,
//   June,
//   July,
//   Aug,
//   Sep,
//   Oct,
//   Nov,
//   Dec
// ];
//               for(int i=0;i<month.length;i++){
//                 if(month[i]==parts[i]){
//                   var monthsvalue=month
//                 }
//               }
// Extract year, month, and day from the parts
//   int year = int.parse(parts[0]);
//  // int month = int.parse(parts[1]);
//
//   int day = int.parse(parts[3]);
// print("date$year$day");
//   // Map month name to its numerical representation
//   Map<String, int> monthMap = {
//     'January': 1,
//     'February': 2,
//     'March': 3,
//     'April': 4,
//     'May': 5,
//     'June': 6,
//     'July': 7,
//     'August': 8,
//     'September': 9,
//     'October': 10,
//     'November': 11,
//     'December': 12,
//   };
//
//   int? month = monthMap[parts[2]];
//
//   // Create a DateTime object
//   DateTime originalDateTime = DateTime(year, month!, day);
//
//   // Extract the numeric value
//   double numericValue = double.parse(parts[4]);
//
// Format the DateTime object to the desired format
// String formattedDateString = formatDateTime(originalDateTime);
//
// print("Original string: $originalString");
// print("Formatted date string: $formattedDateString");
// print("Numeric value: $numericValue");
// }
//
// String formatDateTime(DateTime dateTime) {
//   // Format the DateTime object to the desired format
//   String formattedDateString =
//       "${dateTime.year}-${_formatNumber(dateTime.month)}-${_formatNumber(dateTime.day)}";
//   return formattedDateString;
// }
//
// String _formatNumber(int number) {
//   // Helper function to format numbers with leading zeros if needed
//   return number.toString().padLeft(2, '0');
// }
//
//







