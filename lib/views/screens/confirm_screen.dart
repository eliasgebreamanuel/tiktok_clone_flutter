import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/controllers/upload_video_controller.dart';
import 'package:flutter_application_2/views/widgets/text_input_filed.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  // this is used to get ht e video file
  final File videoFile;

  final String videoPath;

  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  // thisis used to csreate a controller for the video plater
  late VideoPlayerController controller;
  // these are used to set out controller for the songcontroller and captionCpontroller
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  // this is use dot inintialize the controller
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    // this is used to inintialize the controller
    controller.initialize();
    // this is used to play the video file
    controller.play();
    // this is usd to seth the volume of the video
    controller.setVolume(1);
    // this is used to set the loipping of the video
    controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(
          // this is used to set the height of the sizedbox
          height: 5,
        ),
        SizedBox(
            // this is used to set the width and height of the sizedbox
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayer(controller)),
        // thisis used to give a spacing in between the elements
        const SizedBox(height: 30),
        SingleChildScrollView(
            // this is used to set the direction
            scrollDirection: Axis.vertical,
            child: Column(
                // this is used to set the main axis alignment of the column elements
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      // this is used to set the mar gin of the container
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      // this is used to set the width of the container
                      width: MediaQuery.of(context).size.width - 20,
                      child: TextInputField(
                          controller: _songController,
                          labelText: 'Song Name',
                          icon: Icons.music_note)),
                  // this is used to gice a spacing in between the elements
                  const SizedBox(height: 5),
                  Container(
                      // this is used to set the mar gin of the container
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      // this is used to set the width of the container
                      width: MediaQuery.of(context).size.width - 20,
                      child: TextInputField(
                          controller: _captionController,
                          labelText: 'Caption',
                          icon: Icons.closed_caption)),
                  // this is used ot gice a spacing in between the element
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      // this is used tpo handle he onPReseed event of the button
                      onPressed: () => uploadVideoController.uploadVideo(
                          _songController.text,
                          _captionController.text,
                          widget.videoPath),
                      child: const Text('Share',
                          // this is used to set teh style of the text
                          style: TextStyle(
                              // this is used to set the fontSize of the text
                              fontSize: 20,
                              // this is used to set the color of the text
                              color: Colors.white)))
                ]))
      ],
    )));
  }
}
