import 'package:behandam/util/extention.dart';
import 'package:flutter/material.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  Delegate({
    required this.child,
    required this.context,
    this.height,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;
  final double? height;
  final BuildContext context;

  @override
  double get minExtent => 140;

  @override
  double get maxExtent => height ?? context.mediaQuery.size.height * 0.42;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(Delegate oldDelegate) {
    return false;
  }
}
