import 'dart:async';

import 'package:behandam/features/data/profile_repository.dart';
import 'package:behandam/features/logic/profile/profile_event.dart';
import 'package:behandam/features/logic/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // Repository
  final ProfileRepository _profileRepository = ProfileRepository();

  // Internet
  late StreamSubscription streamSubscription;
  bool isInternetConnected = false;

  // Objects
  late Timer? timer;
  int timerDuration = 2;
  bool isTimerRunning = false;

  // Constructor
  ProfileBloc() : super(const ProfileStateInit()) {
    on<ProfileEvent>((event, emit) async {});

    ///
    /// ---------- Events ----------
    ///

    on<ProfileEventInit>((event, emit) async {
      emit(const ProfileStateInit());
    });

    on<ProfileEventProfile>((event, emit) async {
      emit(const ProfileStateProfileLoading());

      try {
        await _profileRepository.profile();

        emit(ProfileStateProfileDone(
          profile: _profileRepository.profileModel!,
          file: null,
        ));

        // emit(
        //     ProfileStateProfileDone(profile: _profileRepository.profileModel!));
      } on Exception catch (exception) {
        emit(ProfileStateProfileError(exception: exception));
      }
    });
  }
}
