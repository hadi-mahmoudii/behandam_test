import 'dart:io';

import 'package:behandam/features/data/model/profile_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

///
/// ---------- Init ----------
///

class ProfileStateInit extends ProfileState {
  const ProfileStateInit();
}

///
/// ---------- Profile ----------
///

class ProfileStateProfileLoading extends ProfileState {
  const ProfileStateProfileLoading();
}

class ProfileStateProfileDone extends ProfileState {
  final ProfileModel profile;
  final File? file;

  const ProfileStateProfileDone({
    required this.profile,
    required this.file,
  });

  @override
  List<Object?> get props => [profile];
}

class ProfileStateProfileError extends ProfileState {
  final Exception exception;

  const ProfileStateProfileError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}
