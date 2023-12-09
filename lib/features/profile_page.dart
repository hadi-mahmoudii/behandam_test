import 'package:behandam/core/constant/asset.dart';
import 'package:behandam/core/constant/colors.dart';
import 'package:behandam/features/data/model/profile_model.dart';
import 'package:behandam/features/logic/profile/profile_bloc.dart';
import 'package:behandam/features/logic/profile/profile_event.dart';
import 'package:behandam/features/logic/profile/profile_state.dart';
import 'package:behandam/features/widgets/global_list_shimmer_widget.dart';
import 'package:behandam/features/widgets/profile_header.dart';
import 'package:behandam/util/delegate.dart';
import 'package:behandam/util/extention.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? profileModel;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEventProfile());
  }

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileBloc>().state;

    if (profileState is ProfileStateProfileDone) {
      profileModel = profileState.profile;
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffF3F7FD),

      // backgroundColor: AppColor.gray100,
      body: body(profileState),
    );
  }

  Widget body(ProfileState profileState) {
    return Stack(
      children: [
        NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: Delegate(
                    height: context.mediaQuery.size.height * 0.25,
                    context: context,
                    child: ProfileHeader(
                      scrollController: scrollController,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Builder(
              builder: (context) => CustomScrollView(
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          color: const Color(0xffF6503B),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xffF3F7FD),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                            child: SingleChildScrollView(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'شما اشتراک فعالی ندارید',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffF9343D)),
                                            child: const Text(
                                              'خرید اشتراک',
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.list_alt,
                                              color: AppColors.defaultRed,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'سوابق خرید اشتراک',
                                              style: TextStyle(fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    profileState is ProfileStateProfileLoading
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GlobalListShimmerWidget(
                                              length: 3,
                                            ),
                                          )
                                        : Container(
                                            height: 280,
                                            width: double.infinity,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Card(
                                                    child: Container(
                                                      height: 250,
                                                      width: double.infinity,
                                                      padding: const EdgeInsets.symmetric(
                                                        horizontal: 14,
                                                        vertical: 24,
                                                      ),
                                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "شماره موبایل",
                                                            style: TextStyle(fontSize: 16),
                                                          ),
                                                          Text(
                                                            profileModel?.data?.mobile ?? '',
                                                            style: const TextStyle(fontSize: 16),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    right: 0,
                                                    child: Center(
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        padding: const EdgeInsets.all(6),
                                                        decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons.call),
                                                            style: IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(0.5))),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 280,
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Card(
                                              child: Container(
                                                height: 250,
                                                width: double.infinity,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 24,
                                                ),
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                                child: const Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  padding: const EdgeInsets.all(6),
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons.call),
                                                      style: IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(0.5))),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
