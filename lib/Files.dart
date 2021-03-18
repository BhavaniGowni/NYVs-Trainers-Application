import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class Files extends StatefulWidget {
  @override
  _FilesState createState() => _FilesState();
}
class _FilesState extends State<Files> {
  File _image;
  String _uploadedFileURL;
  CollectionReference imgRef;
  firebase_storage.Reference ref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Files', textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Text("Upload Your Photo\n", style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold)),
            Text('Selected Image', style: TextStyle(
                fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
            _image != null
                ? Image.asset(
              _image.path,
              height: 150,
            )
                : Container(height: 150),
            _image == null
                ? RaisedButton(
              child: Text('Choose File'),
              onPressed: chooseFile,
              color: Colors.deepPurpleAccent,
            )
                : Container(),
            _image != null
                ? RaisedButton(
              child: Text('Upload File'),
              onPressed: uploadFile,
              color: Colors.deepPurpleAccent,
            )
                : Container(),
            _image != null
                ? RaisedButton(
              child: Text('Clear Selection', style: TextStyle(
                  color: Colors.white),),
              onPressed: clearSelection,
              color: Colors.black87,
            )
                : Container(),
            Text('Uploaded Image', style: TextStyle(
                fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
            _uploadedFileURL != null
                ? Image.network(
              _uploadedFileURL,
              height: 150,
            )
                : Container(),
          FlatButton(
              child: Text('Submit',style:TextStyle(fontSize:20.0)),
              color:Colors.deepPurple,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                Fluttertoast.showToast(
                    msg: "You Registration is Successful!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
          ),
          ],
        ),
      ),
    );
  }
     Future chooseFile() async {
      await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
        setState(() {
          _image = image;
        });
      });
    }
    Future clearSelection()async{
    setState(() {
     _image=null;
    });
    }
     Future uploadFile() async {
      String fileName = basename(_image.path);
          ref= firebase_storage.FirebaseStorage.instance.ref().child('Photos/$fileName');
         await ref.putFile(_image).whenComplete(() async {
           await ref.getDownloadURL().then((fileURL) {
             imgRef.add({'url': fileURL});
             print("uploading");
             setState(() {
               _uploadedFileURL = fileURL;
             });
             });
           });
         }
    void initState() {
      super.initState();
      String uid=FirebaseAuth.instance.currentUser.uid.toString();
      imgRef = FirebaseFirestore.instance.collection('test').doc(uid).collection("ImageURLs");
    }
}