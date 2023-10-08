import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:magnetar_fima/pages/reportm.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  bool photo = false;
  bool? firebaseb;
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  Future<void> createReportsCollection() async {
    try {
      // Firestore bağlantısını başlatın
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Rapor verilerini hazırlayın
      Map<String, dynamic> reportData = {
        'timestamp': FieldValue.serverTimestamp(),
        // Diğer rapor verilerini buraya ekleyebilirsiniz
      };

      // "reports" adında bir koleksiyon oluşturun ve verileri kaydedin
      DocumentReference reportRef =
          await firestore.collection('reports').add(reportData);

      // Firebase Storage referansını alın
      final firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.ref();

      // Fotoğrafı Firebase Storage'a yükleyin
      final String fileName = 'report1.jpg';
      final firebase_storage.Reference imageRef = storageRef.child(fileName);

      final File imageFile = File(image!.path);

      await imageRef.putFile(imageFile);

      // Yükleme başarılı olduğunda, indirme URL'sini alabilirsiniz.
      final String downloadURL = await imageRef.getDownloadURL();

      // Firestore rapor belgesini güncelleyin ve fotoğraf URL'sini ekleyin
      await reportRef.update({'photo_url': downloadURL});

      print('Rapor başarıyla Firestore ve Firebase Storage\'a kaydedildi.');
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(50.0), // İstediğiniz yüksekliği ayarlayabilirsiniz.
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Report fires to us to help you'),
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child:
                    Image.asset('assets/logo/logo.jpg', width: 45, height: 45),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
      ),
      body: Container(
          child: Column(children: [
        SizedBox(
          height: 5,
        ),
        Container(
          child: Container(
              height: 400,
              width: 600,
              decoration: BoxDecoration(
                color: Color(0xFF0077FF),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.4,
                      1.0,
                    ],
                    colors: [
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.lightBlueAccent
                    ]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7), // Gölge rengi
                    spreadRadius: 10, // Gölge genişliği
                    blurRadius: 7, // Gölge bulanıklığı
                    offset: Offset(0, 3), // Gölge yönlendirme (x, y)
                  ),
                ],
              ),
              child: controller == null
                  ? Center(child: Text("Loading Camera..."))
                  : !controller!.value.isInitialized
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!)),
        ),
        ElevatedButton.icon(
          //image capture button
          onPressed: () async {
            try {
              if (controller != null) {
                //check if contrller is not null
                if (controller!.value.isInitialized) {
                  //check if controller is initialized
                  image = await controller!.takePicture(); //capture image
                  setState(() {
                    //update UI
                  });
                }
              }
            } catch (e) {
              print(e); //show error
            }
          },
          icon: Icon(Icons.camera),
          label: Text("Take a Photo"),
        ),
        Container(
          //show captured image
          padding: EdgeInsets.all(5),
          child: image == null
              ? Text("No image captured")
              : Image.file(
                  File(image!.path),
                  width: 130,
                ),
          //display captured image
        ),
        Container(
          child: image == null
              ? Text("Please first take a photo")
              : ElevatedButton.icon(
                  //image capture button
                  onPressed: () async {
                    createReportsCollection();
                    firebaseb = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReportM(), // DiğerSayfa yerine geçmek istediğiniz sayfanın adını kullanın
                      ),
                    );
                  },
                  icon: Icon(Icons.save),
                  label: Text("Report Fire"),
                ),
        ),
      ])),
    );
  }
}
