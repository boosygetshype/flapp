import 'package:flapp/service/user/get_user_data_service.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final GetUserData _userDataService = GetUserData();

  late String name;
  late String email;
   final ProfileViewModel viewModel = ProfileViewModel();

  Future<void> getUserData(String uid) async {
    try {
      final userData = await _userDataService.getUserData(uid);
      name = userData['name'];
      email = userData['email'];
      notifyListeners();
    } catch (e) {
      print('Error getting user data: $e');
    }
  }
}