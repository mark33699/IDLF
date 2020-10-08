

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:image_picker/image_picker.dart';

class LessonPageImagePicker extends StatefulWidget {
  @override
  _LessonPageImagePickerState createState() => _LessonPageImagePickerState();
}

class _LessonPageImagePickerState extends State<LessonPageImagePicker> {

  File _imageFile;
  String wording = "";

  Future<Null> _pickerImageFrom(ImageSource imgSrc) async {
    final theImage = await ImagePicker().getImage(source: imgSrc);
    setState(() {
      if (theImage != null) {
        _imageFile = File(theImage.path);
        wording = '';
      } else {
        wording = 'No image selected.';
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      print("addPostFrameCallback");
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget _createButton(bool isCamera) {

      final color = isCamera ? Colors.blueAccent : Colors.greenAccent;
      final icon = isCamera ? IcoFontIcons.uiCamera : IcoFontIcons.uiImage;
      final source = isCamera ? ImageSource.camera : ImageSource.gallery;

      return Expanded(
        child: GestureDetector(
          child: Card(
            margin: EdgeInsets.only(top: 8),
            color: color,
            child: Center(child: Icon(icon, size: 40))
          ),
          onTap: () {
            _pickerImageFrom(source);
          },
        )
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [

              _imageFile == null
                  ? Image.asset("resource/images/placeholder.png")
                  : Image.file(_imageFile),

              SizedBox(
                height: 100,
                child: Row(
                    children: [
                      _createButton(true),
                      SizedBox(width: 8),
                      _createButton(false)
                    ]
                )
              ),

              Text(wording,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent),
              )

            ]
          )
        )
    );
  }
}