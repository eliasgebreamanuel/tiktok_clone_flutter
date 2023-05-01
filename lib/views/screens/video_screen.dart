import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/views/widgets/circle_aniamtion.dart';
import 'package:flutter_application_2/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});
  buildProfile(String profilePhoto) {
    return SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          children: [
            // this is used ot have a positioned widget
            Positioned(
                // this is used to set the position at the left
                left: 5,
                child: Container(
                    // this is used to set the width of the container
                    width: 5,
                    // this is used to set the height of the container
                    height: 50,
                    // this is used to set the padding of the container
                    padding: const EdgeInsets.all(1),
                    // this is usedpo set the decoraiton of teh conatoiner
                    decoration: BoxDecoration(
                      // this is used to set the color of the container
                      color: Colors.white,
                      // this is used ot set the botrderRadius of the container
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRect(
                      // this is used to set the border Radius

                      // borderRadius: BorderRadius.circular(25),
                      child: Image(
                          image: NetworkImage(profilePhoto), fit: BoxFit.cover),
                    )))
          ],
        ));
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
        width: 60,
        height: 60,
        child: Column(children: [
          Container(
              // this is used to set the padding of the contáiner
              padding: EdgeInsets.all(11),
              // this is used to set the height and with of the container
              height: 50,
              width: 50,
              // this is used to set the decoration of the container
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.grey, Colors.white])))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    // this is used to get the size of the current mobile screen
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView.builder(
      // this is used to set the number of items
      // itemCount: ,
      // this is used to set the controller fot the p[ageview biuilder
      controller: PageController(initialPage: 0, viewportFraction: 1),
      // this is used to set the direction of the scrolling
      scrollDirection: Axis.vertical,
      // this is used tos ethe itemBuilder
      itemBuilder: (context, index) {
        return Stack(children: [
          // VideoPlayerItem(videoUrl: ),
          Column(
            children: [
              const SizedBox(height: 100),
              Expanded(
                child: Row(
                  // this is used to set the mainAxisSize
                  mainAxisSize: MainAxisSize.max,
                  // this is used to set the crossaxisalignment
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Container(
                            // this is used set the padding
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              // this is used ot set the mainAxisAlignmetn of the column
                              mainAxisSize: MainAxisSize.min,
                              // this is used to set the crossAxisAlignment
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // this is used to set the main axis alignment of the column elments
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('username',
                                    // this is used to set teh styles of the tetxt
                                    style: TextStyle(
                                        // this is used ot set the fontsize of the text
                                        fontSize: 20,
                                        // this is used to the color of the text
                                        color: Colors.white,
                                        // this is used to set the fontWeight f the text
                                        fontWeight: FontWeight.bold)),
                                Text('caption',
                                    // this is used to set teh styles of the tetxt
                                    style: TextStyle(
                                        // this is used ot set the fontsize of the text
                                        fontSize: 15,
                                        // this is used to the color of the text
                                        color: Colors.white,
                                        // this is used to set the fontWeight f the text
                                        fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    const Icon(Icons.music_note,
                                        size: 15, color: Colors.white),
                                    Text('song name',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ))),
                    Container(
                        // this is used to set the width of the container
                        width: 100,
                        // this is used to set  the margin of the container
                        margin: EdgeInsets.only(top: size.height / 5),
                        child: Column(
                          // this is used to set the mainAxisalignment of hte container
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildProfile('string url'),
                            Column(
                              children: [
                                InkWell(
                                  // this is use dto handle the onTap event ofthe inkwell
                                  onTap: () {},
                                  child: Icon(Icons.favorite,
                                      size: 40, color: Colors.red),
                                ),
                                const SizedBox(height: 7),
                                Text('2,200 likes',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  // this is use dto handle the onTap event ofthe inkwell
                                  onTap: () {},
                                  child: Icon(Icons.comment,
                                      size: 40, color: Colors.red),
                                ),
                                const SizedBox(height: 7),
                                Text('2,200 ',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  // this is use dto handle the onTap event ofthe inkwell
                                  onTap: () {},
                                  child: Icon(Icons.reply,
                                      size: 40, color: Colors.red),
                                ),
                                const SizedBox(height: 7),
                                Text('2,200 ',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            ),
                            CircleAnimation(
                                child: buildMusicAlbum('profile photo'))
                          ],
                        ))
                  ],
                ),
              )
            ],
          )
        ]);
      },
    ));
  }
}
