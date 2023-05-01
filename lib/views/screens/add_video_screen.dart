import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/views/screens/confirm_screen.dart';
import 'package:image_picker/image_picker.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});
  // this is used to pick a video file
  pickVideo(ImageSource src, BuildContext context) async {
    // this is use dto pick the video using the image picker plugin
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      // this is used to naviga to the confirmscreen page
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          )));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
              SimpleDialogOption(
                // this is usesd to take a video from the gallery
                  onPressed: () => pickVideo(ImageSource.gallery, context),
                  child: Row(children: const [
                    Icon(Icons.image),
                    Padding(
                      // this is used to setht paddingof our text

                      padding: EdgeInsets.all(7.0),
                      child: Text('Gallery', style: TextStyle(fontSize: 20)),
                    )
                  ])),
              SimpleDialogOption(
                // this is us dto take a video from the camera
                  onPressed: () => pickVideo(ImageSource.camera, context),
                  child: Row(children: const [
                    Icon(Icons.camera),
                    Padding(
                      // this is used to setht paddingof our text

                      padding: EdgeInsets.all(7.0),
                      child: Text('Camera', style: TextStyle(fontSize: 20)),
                    )
                  ])),
              SimpleDialogOption(
                // this is use dot cancle the option
                  onPressed: () => Navigator.of(context).pop(),
                  child: Row(children: const [
                    Icon(Icons.camera),
                    Padding(
                      // this is used to setht paddingof our text

                      padding: EdgeInsets.all(7.0),
                      child: Text('Cancel', style: TextStyle(fontSize: 20)),
                    )
                  ])),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // thisis usd to center all the elements
        body: Center(
            child: InkWell(
                // this is used to handle the onTap event of the InkWell
                onTap: () => showOptionsDialog(context),
                child: Container(
                    // this is used to set the widtha nd height of the container
                    width: 190,
                    height: 50,
                    // this is used to set the decoration of the container
                    decoration: BoxDecoration(color: buttonColor),
                    child: const Center(
                        child: Text('Add Video',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)))))));
  }
}
