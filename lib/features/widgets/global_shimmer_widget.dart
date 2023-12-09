import 'package:behandam/component/shimmer_component.dart';
import 'package:flutter/material.dart';

class GlobalShimmerRectangleWidget extends StatelessWidget {
  // Vars
  final double width;
  final double height;

  // Constructor
  const GlobalShimmerRectangleWidget({
    super.key,
    required this.width,
    required this.height,
  });

  // Tree
  @override
  Widget build(BuildContext context) {
    return ShimmerComponent.rectangle(
      baseColor: Colors.grey,
      period: const Duration(milliseconds: 1500),
      isRtl: true,
      decorationColor: Colors.white,
      width: width,
      height: height,
      borderRadius: 16,
      highlightColor: Colors.grey.withOpacity(0.5),
    );
  }
}
