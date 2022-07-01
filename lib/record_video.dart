import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class RecordVideo extends StatefulWidget {
  RecordVideo({Key? key}) : super(key: key);

  @override
  State<RecordVideo> createState() => _RecordVideoState();
}

class _RecordVideoState extends State<RecordVideo> {
  File? cameraVideo;
  VideoPlayerController? cameraVideoPlayerController;
  //File? cameraVideoFile;

  Future pickVideoFromCamera() async {
    try {
      final pickedVideo =
          await ImagePicker().pickVideo(source: ImageSource.camera);
      if (pickedVideo == null) return;

      final cameraVideoFile = File(pickedVideo.path);
      setState(() => this.cameraVideo = cameraVideoFile);
      cameraVideoPlayerController = VideoPlayerController.file(cameraVideoFile)
        ..initialize().then((_) {
          setState(() {});
          cameraVideoPlayerController?.play();
        });
    } catch (e) {
      print('Failed to pick video: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grabar video'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(22),
          child: Center(
            child: Column(
              children: [
                if (cameraVideo != null)
                  cameraVideoPlayerController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio:
                              cameraVideoPlayerController!.value.aspectRatio,
                          child: VideoPlayer(cameraVideoPlayerController!),
                        )
                      : Container()
                else
                  Text(
                    "Click on Pick Video to select video",
                    style: TextStyle(fontSize: 18.0),
                  ),
                RaisedButton(
                  onPressed: () {
                    pickVideoFromCamera();
                  },
                  child: Text("Pick Video From Gallery"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
