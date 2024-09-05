// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/images/cached_network_image.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/utils/constants/colors.dart';

class JChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  JChatAppbar({
    super.key,
    this.centerTitle = false,
    this.showBackArrow = true,
    this.title,
    this.leadingIcon,
    this.leadingOnPressed,
    required this.name,
    required this.image,
  });
  final bool centerTitle;
  final bool showBackArrow;
  final Widget? title;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  List<Widget>? actions;

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        decoration: BoxDecoration(
            color: JColor.primary,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JGap2(
              h: 40,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                ClipOval(
                    child: JNetworImage(
                        width: 50,
                        height: 50,
                        isNetworkImage: true,
                        image: image)),
                JGap2(),
                Text(
                  'Meenu',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25),
                )
              ],
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}
