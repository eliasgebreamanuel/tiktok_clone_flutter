import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

import '../models/video.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    // this is used to compress the video for us to a medium qulaity
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    // this is used to refer the visdeo file
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    // this is used to put the file
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    // this is used to create a reference
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

// this is used to upload a video file
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      // thi is used to get an access to the ciurrent use id
      String uid = firebaseAuth.currentUser!.uid;
      // this is usd ot store the viedeo in users collection in the databsae
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      // this is usd ot get an id for the uploaded videos
      var allDocs = await firestore.collection('videos').get();
      // thisis used to  get the total number of documnets
      int len = allDocs.docs.length;
      // this is used to upload a video to teh storage
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // this is used to generate the thumbnail
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
      Video video = Video(
          username: (userDoc.data()! as Map<String, dynamic>)['name'],
          uid: uid,
          id: "Video $len",
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          profilePhoto:
              (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
          thumbnail: thumbnail);
      // this is used to add the video to the videos collection
      await firestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson());
      // this is useed to return to the prevous page
      Get.back();
    } catch (e) {
      // this is used to show a sncak bar if there is anyh kind of error
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }
}
