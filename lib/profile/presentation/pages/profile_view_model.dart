import 'package:flutter/material.dart';
import 'package:recipe_app/profile/data/models/profile_model.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required ProfileRepository repo}) : _repo = repo {
    load();
  }

  bool loading = true;
  final ProfileRepository _repo;

  ProfileModel? myProfile;

  Future<void> load() async {
    loading = true;
    notifyListeners();

    myProfile = await _repo.fetchMyProfile();
    loading = false;
    notifyListeners();
  }
}
