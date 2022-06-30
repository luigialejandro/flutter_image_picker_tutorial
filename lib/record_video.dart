import 'package:flutter/material.dart';

class RecordVideo extends StatefulWidget {
  RecordVideo({Key? key}) : super(key: key);

  @override
  State<RecordVideo> createState() => _RecordVideoState();
}

class _RecordVideoState extends State<RecordVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grabar video'),
        centerTitle: true,
      ),
    );
  }
}
