import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {

  // Widgets
  final Color baseColor;
  final Color highlightColor;
  final Duration period;
  final bool isRtl;
  final Color decorationColor;
  final double width;
  final double height;
  final double borderRadius;
  final ShapeBorder shapeBorder;

  // Constructor
  ShimmerComponent.rectangle({
    super.key,
    required this.baseColor,
    required this.highlightColor,
    required this.period,
    required this.isRtl,
    required this.decorationColor,
    required this.width,
    required this.height,
    required this.borderRadius,
  }) : shapeBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius),
    ),
  );

  // Constructor
  const ShimmerComponent.circle({
    super.key,
    required this.baseColor,
    required this.highlightColor,
    required this.period,
    required this.isRtl,
    required this.decorationColor,
    required this.width,
    required this.height,
    required this.borderRadius,
  }) : shapeBorder = const CircleBorder();

  // Tree
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: period,
      direction: (isRtl) ? ShimmerDirection.rtl : ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: decorationColor,
          shape: shapeBorder,
        ),
      ),
    );
  }

}