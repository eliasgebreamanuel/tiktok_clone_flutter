import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/user.dart' as model;
import 'package:flutter_application_2/views/screens/auth/login_screen.dart';
import 'package:flutter_application_2/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  // this is used to get the auth controller of us
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  // this is used to create a getter function for the selected image file
  File? get profilePhoto => _pickedImage.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // this is used to get the current user value
    _user = Rx<User?>(firebaseAuth.currentUser);
    // this is used to bind to the stream changes
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // this is used to navigate to the LoginScreen
      Get.offAll(() => LoginScreen());
    } else {
      // this is used to navigate to the HomeScreen
      Get.offAll(() => const HomeScreen());
    }
  }

// this is used to pick an image file
  void pickImage() async {
    // this is used to pick an image file from our image gallery
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // this is used shpow a snack bar if we pick an image suucceffuly
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

// this is used to upload our profile image in to storage
  Future<String> _uploadToStorage(File image) async {
    // this is used to show the refrenece to the storage
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    // this is used to put the image file
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // this is used to register the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out to user auth and firebase firestore
        // this is used to create a user with an email address and password
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
            name: username,
            email: email,
            uid: cred.user!.uid,
            profilePhoto: downloadUrl);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        // this is used to show a snack bar to the user
        Get.snackbar('Error Creating Account', 'Please enter all the fields');
      }
    } catch (e) {
      // this is usd to show a sanck bar
      Get.snackbar('Error Creating Account', e.toString());
      e.toString();
    }
  }

  // this is used to login a new user
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // this is used to sign in with email and password
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        // this is used to show a sncak bar
        Get.snackbar('Login Success',
            'Man u \'ve logged in successfully iwth ur email address and password');
        print('Logged in successfully');
      } else {
        // thisis usd to show a snack bar
        Get.snackbar('Error Logggin in', 'Please enter all the fields');
      }
    } catch (e) {
      // this is used to show  a snack bar
      Get.snackbar('Error Log', e.toString());
    }
  }
}
