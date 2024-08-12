import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/loader/shimmer.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JNetworImage extends StatelessWidget {
  const JNetworImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.height = 100,
    this.width = double.infinity,
  });
  final bool isNetworkImage;
  final String image;
  final double height, width;
  // final controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(JSize.borderRadLg),
      ),
      child: Column(
        children: [
          if (isNetworkImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(JSize.borderRadLg),
              child: CachedNetworkImage(
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      JShimmerEffect(width: width, height: height),
                  errorWidget: (context, url, error) => const Icon(Iconsax.gallery_slash),
                  imageUrl: image),
            )
          else
            Image(fit: BoxFit.fill, image: AssetImage(image)),
        ],
      ),
    );
  }
}

class JmSize {}
