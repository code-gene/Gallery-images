import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Camera App',
    
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;

  openGallery(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
        imageFile = picture;
    });

    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });

    Navigator.of(context).pop();
  }

  Future<void> choiceDialogBox(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Select Options !',
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text('Gallery'),
                onTap: (){
                  openGallery(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  openCamera(context);
                },
              )
            ],
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen'
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (imageFile == null) ? Text('No Image selected') :
              Image.file(imageFile, width: 400, height: 400),
              RaisedButton(
                onPressed: (){
                  choiceDialogBox(context);
                },
                child: Text('Select image'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
