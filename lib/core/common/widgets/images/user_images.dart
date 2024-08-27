import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/image_strings.dart';

class JImageView extends StatelessWidget {
  const JImageView({
    super.key,
    required this.isNetworkImage,
    this.url,
    required this.src,
    this.height = double.infinity,
    this.width = double.infinity,  this.radius =0,
  });
  final bool isNetworkImage;
  final String? url;
  final String src;
  final double height;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: width,
        child: isNetworkImage
            ? url == null
                ? Image.asset(
                    JImages.defaultUser,
                    fit: BoxFit.cover,
                  )
                : Image.network(url!,fit:BoxFit.cover ,)
            : Image.asset(
                src,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
