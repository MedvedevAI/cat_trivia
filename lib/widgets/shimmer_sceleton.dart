import 'package:cat_trivia/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatefulWidget {
  const ShimmerContainer({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.child,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  State<ShimmerContainer> createState() => _ShimmerContainerState();
}

class _ShimmerContainerState extends State<ShimmerContainer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.lightGrey,
      child: Container(
        padding: widget.padding,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 16),
        ),
        child: widget.child,
      ),
    );
  }
}
