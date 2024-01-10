import 'dart:convert';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../AccountPage/AccountPage.dart';
import '../ApiConttrollerPage/ApiControllerPage.dart';
import '../DrawClip/DrawClip.dart';

class EditProfile extends StatefulWidget {
  final String fistName1;

  final String email1;
  final String password1;
  final String image1;
  const EditProfile(
      {Key? key,
      required this.fistName1,

      required this.email1,
      required this.password1,
      required this.image1})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool editProfile = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fistName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  File? file;
  ImagePicker imagePicker = ImagePicker();
  File? selectImage;
  File? selectImage1;
  String? base64Image;
double top=1200;
  late String imageUrl;
  late Uint8List decodeImage;
  @override


  @override
  void dispose() {
    // base64Image;

    super.dispose();
  }

  Future<void> getGam() async {
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    selectImage = File(image!.path);
    selectImage=await _cropImage( imageFile:selectImage);
    setState(()  {
      selectImage = File(image!.path);


    });

    print(selectImage);


  }
  Future<File?> _cropImage( {File? imageFile})async{
    CroppedFile? croppedImage=await ImageCropper().cropImage(sourcePath: imageFile!.path);
    if(croppedImage!=null){
      selectImage1=File(croppedImage.path);
      Uint8List imageBytes = await croppedImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      print("data:image/jpg;base64,${base64Image}");
    }
  }

  @override
  @override
  void initState() {

    getProfileApi();
    imageUrl = widget.image1.toString();
    fistName.text = widget.fistName1.toString();

    email.text = widget.email1.toString();
    password.text = widget.password1.toString();

    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        top=0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("EditProfile"),
      ),
      body: 
         Stack(
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
               top: top,
               duration: Duration(milliseconds: 1000),
               child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                     color: Colors.white
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 100,
                                        backgroundColor: Colors.grey,
                                        child: ClipOval(
                                              child: selectImage1 != null
                                                  ? Image.file(
                                                selectImage1!,
                                                      fit: BoxFit.cover,
                                                      height: size.height,
                                                      width: size.width,
                                                    )
                                                  : Image.network(imageUrl)),

                                      ),
                                      AnimatedPositioned(
                                        top: 140,
                                        left: 120,
                                        duration: Duration(milliseconds: 1),
                                        child: Container(
                                          child: IconButton(onPressed: () {
                                            getGam();
                                          }, icon: Icon(Icons.camera_alt_outlined,size: 35),),
                                          height: 60,
                                          width:60,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),


                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Full Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(

                                style: TextStyle(color: Colors.black),
                                controller: fistName,
                                decoration: InputDecoration(

                                    labelText: "FirstName",
                                    hintText: "FirstName",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                              SizedBox(
                                height: 25,
                              ),


                              Row(
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: email,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    hintText: "email",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: password,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                              SizedBox(height: 45),
                              InkWell(
                                onTap: ()async{
                        var baseUrl="data:image/jpg;base64,";
                        var url=baseUrl+base64Image!;

                        var data = {
                        "fullName": fistName.text.toString(),

                        "email": email.text.toString(),
                        "password": password.text.toString(),
                        "image": url,
                        };
                        print(data);
                        setState(() {
                        editProfileApiFunction(data);
                        editProfile=true;
                        });
                        Future.delayed(Duration(seconds: 3),(){
                        setState(() {
                        editProfile=false;
                        });
                        });
                        },
                                child: Container(
                                  height: 60,
                                  width: 325,
                                  child:editProfile? Center(

                                      child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)): Center(
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),


                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors
                                                .white,
                                            offset: Offset(
                                                -5, -5),
                                            blurRadius: 1,
                                            spreadRadius:
                                            1),
                                        BoxShadow(
                                            color: Colors
                                                .grey,
                                            offset: Offset(
                                                -5, -5),
                                            blurRadius: 15,
                                            spreadRadius:
                                            1),
                                      ]
                                  ),
                                ),
                              ),

                              SizedBox(height: 205),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
             ),
           ],
         ),

   
    ));
  }

  var profilePatchDaTa;
  Future<void> editProfileApiFunction(Map<String, String> data) async {
    var datap = jsonEncode(data);
    final res = await http.patch(Uri.parse("$baseUrl/DispatcherProfileAPI/"),
        body: datap,
        headers: {
          "Content-type": "application/json",
          "Authorization": token,
        });
    if (res.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AccountPage()));
      profilePatchDaTa = jsonDecode(res.body.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Successfully Update')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red, content: Text('Something error')),
      );
    }
  }
}
