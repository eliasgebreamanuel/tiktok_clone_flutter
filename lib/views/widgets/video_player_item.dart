import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItem({super.key, required this.videoUrl});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  // this is used to create a video player contoller
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this is used to inintalize the viudeoplayercpontroller
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value) {
            // this is use dot star t the playing
            videoPlayerController.play();
            // this is used to set the volume
            videoPlayerController.setVolume(1);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // this is used to get an access to the size of our mobiole scrreen size
    final size = MediaQuery.of(context).size;
    return Container(
        // this is used to set the width of the contáiner
        width: size.width,
        // this is used to set the hieght of the container
        height: size.height,
        // this is used to set the decoration of the container
        decoration: const BoxDecoration(
            // this is used to set  teh color of the container
            color: Colors.black),
        child: VideoPlayer(videoPlayerController));
  }
}
