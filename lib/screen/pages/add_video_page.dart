import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class AddVideoPage extends StatefulWidget {
  @override
  _AddVideoPageState createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  File? file;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == Null) return;
    final path = result!.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file selected";
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              selectFile();
            },
            child: Text("Select Files"),
          ),
          Text(fileName),
          ElevatedButton(
            onPressed: () {},
            child: Text("Upload Files"),
          )
        ],
      )),
    );
  }
}
