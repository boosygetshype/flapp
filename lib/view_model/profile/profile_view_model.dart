import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flapp/model/user/user_profile_model.dart';
import 'package:flapp/service/user/get_user_data_service.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GetUserData _userDataService = GetUserData();

   ProfileModel? _profileModel;
  ProfileModel? get userProfile => _profileModel;

  ProfileViewModel() {
    _init();
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
}
