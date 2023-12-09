import 'dart:convert';
import 'dart:io';

import 'package:behandam/features/data/model/profile_model.dart';
import 'package:behandam/features/data/profile_provider.dart';

class ProfileRepository {
  // Provider
  final ProfileProvider _profileProvider = ProfileProvider();

  ///
  /// ---------- Cache ----------
  ///

  ProfileModel? _profileModel;

  ///
  /// ---------- Getters ----------
  ///

  ProfileModel? get profileModel => _profileModel;

  ///
  /// ---------- Apis ----------
  ///

  Future<String> profile() async {
    final Map<String, dynamic> result = await _profileProvider.profile();
    print(result);
    final profileModel = result != null ? ProfileModel.fromJson(result) : null;
    _profileModel = profileModel;

    return '';
  }
}
