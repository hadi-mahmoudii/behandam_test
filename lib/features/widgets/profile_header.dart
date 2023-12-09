import 'package:behandam/core/constant/asset.dart';
import 'package:behandam/features/data/model/profile_model.dart';
import 'package:behandam/features/logic/profile/profile_bloc.dart';
import 'package:behandam/features/logic/profile/profile_state.dart';
import 'package:behandam/features/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  double opacity = 1;
  bool showTitle = true;
  ProfileModel? profileModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setOpacity();
  }

  void setOpacity() {
    widget.scrollController.addListener(() {
      print(widget.scrollController.offset);
      if (widget.scrollController.offset.round() > 33) {
        setState(() {
          opacity = 0.5;
        });
      } else {
        setState(() {
          opacity = 1;
        });
      }
      if (widget.scrollController.offset.round() > 48) {
        setState(() {
          showTitle = false;
        });
      } else {
        setState(() {
          showTitle = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileBloc>().state;
    if (profileState is ProfileStateProfileDone) {
      profileModel = profileState.profile;
    }

    return SafeArea(
      child: Container(
        color: const Color(0xffF6503B),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showTitle
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Opacity(
                      opacity: opacity,
                      child: const Text(
                        "پروفایل",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          margin: const EdgeInsets.only(right: 20),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 5,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ], borderRadius: BorderRadius.circular(25)),
                          child: SvgPicture.asset(
                            kAssetIconMaleAvatar,
                            fit: BoxFit.fill,
                            // height: 50,
                            // width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '${profileModel?.data?.firstName ?? ''} ${profileModel?.data?.lastName ?? ''}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white.withOpacity(0.5)),
                      child: const Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
