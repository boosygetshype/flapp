import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flapp/model/user/user_profile_model.dart';
import 'package:flapp/service/user/get_user_data_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GetUserData _userDataService = GetUserData();
  File? file;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? downloadUrl;

  ProfileModel? _profileModel;
  ProfileModel? get userProfile => _profileModel;

  ProfileViewModel() {
    _init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getUrl());
    notifyListeners();
  }

  Future<void> _init() async {
    String? uid = _auth.currentUser?.uid;
    DocumentSnapshot userData = await _userDataService.getUserData(uid!);
    _profileModel = ProfileModel(
      name: userData["name"],
      email: userData["email"],
    );

    notifyListeners();
  }

  uploadFromCamera() async {
    var getFile = await ImagePicker().pickImage(source: ImageSource.camera);

    file = File(getFile!.path);

    Reference refPath = FirebaseStorage.instance
        .ref()
        .child("profilephotos")
        .child(auth.currentUser!.uid)
        .child("pp.png");

    UploadTask uploadTask = refPath.putFile(file!);

    String url = await uploadTask.snapshot.ref.getDownloadURL();

    downloadUrl = url;

    notifyListeners();
  }

  getUrl() async {
    try {
      String photo = await FirebaseStorage.instance
          .ref()
          .child("profilephotos")
          .child(auth.currentUser!.uid)
          .child("pp.png")
          .getDownloadURL();
      downloadUrl = photo;
    } catch (e) {
      print("Error getting photo URL: $e");
    }
    notifyListeners();
  }
}
