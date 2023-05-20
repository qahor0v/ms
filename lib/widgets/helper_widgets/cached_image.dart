import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ms/services/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CachedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.white24,
          highlightColor: bgColor,
          child: Container(
            height: height,
            width: width,
            color: bgColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.image,
        color: Colors.white,
      ),
    );
  }
}
