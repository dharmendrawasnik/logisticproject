// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pod/data/responce/status.dart';
// import 'package:pod/utils/drawer.dart';
// import 'package:pod/utils/utility.dart';
// import 'package:pod/view_model/pod_view_model.dart';
// import 'package:pod/view_model/qr_view_model.dart';
// import 'package:provider/provider.dart';
//
// class QrDetails extends StatefulWidget {
//   const QrDetails({Key? key}) : super(key: key);
//
//   @override
//   State<QrDetails> createState() => _QrDetailsState();
// }
//
// class _QrDetailsState extends State<QrDetails> {
//   static final remark = TextEditingController();
//  // QrViewModel qrViewModel = QrViewModel();
// //  PodViewModel podViewModel = PodViewModel();
//   File? _image;
//   String? payOption;
//   String? data;
//   final imagePicker = ImagePicker();
//   String? base64Image;
//   late Uint8List decodeImage;
//
//   @override
//   // void initState() {
//   //   super.initState();
//   //   Future.delayed(const Duration(seconds: 03), () {
//   //     qrViewModel.fetchQrDetails();
//   //   });
//   // }
//
//   @override
//   void dispose() {
//     base64Image;
//     remark;
//     payOption;
//     super.dispose();
//   }
//
//   Future getImage() async {
//     final image = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image = File(image!.path);
//     });
//     Uint8List imageBytes = await _image!.readAsBytes();
//     base64Image = base64Encode(imageBytes);
//   }
//   //
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//     //  drawer: const DrawerPage(),
//       appBar: AppBar(
//         title: const Text("Proof of Delivery"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: ChangeNotifierProvider<QrViewModel>(
//             create: (BuildContext context) => qrViewModel,
//             child: Consumer<QrViewModel>(builder: (context, value, _) {
//               switch (value.qrResult.status) {
//                 case Status.loading:
//                   return const Center(child: CircularProgressIndicator());
//                 case Status.error:
//                   return Center(child: Text(value.qrResult.message.toString()));
//                 case Status.completed:
//                   decodeImage = const Base64Decoder()
//                       .convert(value.qrResult.data!.result!.image.toString());
//                   return Center(
//                     child: Column(
//                       children: [
//                         Image.asset("assets/KrishnaCargo.png"),
//                         SizedBox(
//                           height: height * 0.02,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                                 height: height * 0.10,
//                                 child: Image.memory(decodeImage).toString().isNotEmpty
//                                     ? const Text("Image Not Found")
//                                     : Image.memory(decodeImage)
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.05,
//                         ),
//                         SizedBox(
//                           height: height * 0.30,
//                           width: width * 0.95,
//                           child: Card(
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40.0),
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text("Consiger",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.consigner.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.consigner.toString() : 'Data Not Found', style: const TextStyle(fontSize: 15)),
//                                     SizedBox(height: height * 0.02,),
//                                     const Text("Consiger Contact",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.cnorContact.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.cnorContact.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                     SizedBox(height: height * 0.02,),
//                                     const Text("Packaging Mode", style: TextStyle(
//                                         fontWeight: FontWeight.bold, fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.packagingMode.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.packagingMode.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                     SizedBox(
//                                       height: height * 0.02,
//                                     ),
//                                     const Text("Delivered",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.delivered.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.delivered.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15))
//                                   ],
//                                 ),
//                                 Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text("Consignee", style: TextStyle(
//                                         fontWeight: FontWeight.bold, fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.consignee.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.consignee.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                     SizedBox(
//                                       height: height * 0.02,
//                                     ),
//                                     const Text("Consignee Contact",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.cneeContact.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.cneeContact.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                     SizedBox(height: height * 0.02),
//                                     const Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold,
//                                         fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.packagingQty.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.packagingQty.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                     SizedBox(height: height * 0.02,),
//                                     const Text("Remain",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 15)),
//                                     Text(value.qrResult.data!.result!.remain.toString().isNotEmpty ?
//                                     value.qrResult.data!.result!.remain.toString() : 'Data Not Found',
//                                         style: const TextStyle(fontSize: 15)),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         RadioListTile(
//                           title: const Text("CASH"),
//                           value: "Cash",
//                           groupValue: payOption,
//                           onChanged: (value) {
//                             setState(() {
//                               payOption = value.toString();
//                             });
//                           },
//                         ),
//                         RadioListTile(
//                           title: const Text("Due"),
//                           value: "Due",
//                           groupValue: payOption,
//                           onChanged: (value) {
//                             setState(() {
//                               payOption = value.toString();
//                             });
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(25.0),
//                           child: TextField(
//                             controller: remark,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30)),
//                                 hintText: "Remark"),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               width: width * 0.60,
//                               height: height * 0.20,
//                               decoration:
//                               const BoxDecoration(shape: BoxShape.circle),
//                               child: _image == null
//                                   ? const Text("No Image")
//                                   : Image.file(_image!),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.02,
//                         ),
//                         SizedBox(
//                           height: height * 0.06,
//                           width: width * 0.50,
//                           child: ElevatedButton(
//                               style: ButtonStyle(
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(40.0),
//                                       ))),
//                               onPressed: () {
//                                 getImage();
//                               },
//                               child: const Text("Upload Signature")),
//                         ),
//                         SizedBox(
//                           height: height * 0.02,
//                         ),
//                         SizedBox(
//                           height: height * 0.06,
//                           width: width * 0.50,
//                           child: ElevatedButton(
//                               style: ButtonStyle(
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(40.0),
//                                       ))),
//                               onPressed: () {
//                                 if (remark.text.isEmpty && payOption!.isEmpty) {
//                                   Utility.toastMessage(
//                                       "Please enter remark and Capture image");
//                                 } else {
//                                   data = jsonEncode({
//                                     "id": value.qrResult.data!.result!.builtyId
//                                         .toString(),
//                                     "signature": base64Image.toString(),
//                                     "podPaymentStatus": payOption.toString(),
//                                     "remark": remark.text.toString()
//                                   });
//                                 }
//                                 podViewModel.podData(data, context);
//                                 remark.clear();
//                               // },
//                               child: const Text("Confirm")),
//                         ),
//                         SizedBox(height: height * 0.02),
//                       ],
//                     ),
//                   );
//                 default:
//                   const Text("Something wrong");
//               }
//               return const Center(child: CircularProgressIndicator());
//             })),
//       ),
//     );
//   }
// }
