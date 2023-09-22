import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerContainer({Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShimmerContainerState createState() => _ShimmerContainerState();
}

class _ShimmerContainerState extends State<ShimmerContainer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Colors.grey[300]!,
          Colors.grey[100]!,
          Colors.grey[300]!,
        ],
        stops: const [0.4, 0.5, 0.6],
      ),
      child: widget.child,
    );
  }
}
