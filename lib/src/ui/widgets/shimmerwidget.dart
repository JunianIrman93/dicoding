import 'package:dicoding/src/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder? shapeBorder;

  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
    Key? key,
  }) : super(key: key);

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kGreyColor.withOpacity(0.8),
      highlightColor: kGreyColor.withOpacity(0.4),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: kGreyColor.withOpacity(0.4),
          shape: shapeBorder!,
        ),
      ),
    );
  }
}
