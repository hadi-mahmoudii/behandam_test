import 'dart:io';

import 'package:flutter/foundation.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}

///
/// ---------- Init ----------
///

class ProfileEventInit extends ProfileEvent {
  const ProfileEventInit();
}

///
/// ---------- Events ----------
///

class ProfileEventProfile extends ProfileEvent {
  const ProfileEventProfile();
}
