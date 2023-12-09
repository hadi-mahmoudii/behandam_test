import 'package:behandam/features/widgets/global_shimmer_widget.dart';
import 'package:flutter/material.dart';

class GlobalListShimmerWidget extends StatelessWidget {
  GlobalListShimmerWidget({Key? key, this.length, this.shimmerHeight}) : super(key: key);

  int? length = 1;
  double? shimmerHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          SizedBox(height: 20),
          GlobalShimmerRectangleWidget(
            width: double.maxFinite,
            height: shimmerHeight ?? 60,
          ),
        ],
      ),
    );
  }
}
