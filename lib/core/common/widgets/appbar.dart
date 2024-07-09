import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAppbar extends StatelessWidget {
  const JAppbar({
    super.key,
    this.centerTitle = false,
    this.title,
    this.actions,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPressed,
    this.horizontalpadding = JSize.md,
    this.body,
    this.leading,
    this.floating = false,
    this.elevation,
  });

  final Widget? body;
  final bool centerTitle;
  final bool showBackArrow;
  final Widget? leading;
  final Widget? title;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actions;
  final double horizontalpadding;
  final bool floating;
  final double? elevation;
  final double hh = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: JColor.primary,
            leading: showBackArrow ? IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: leadingOnPressed) : leading,
            title: title,
            centerTitle: centerTitle,
            actions: actions,
            elevation: elevation,
            pinned: true,
            floating: floating,
            collapsedHeight: 58,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  // bottomLeft: Radius.circular(JSize.appbarBorderRad),
                  // bottomRight: Radius.circular(JSize.appbarBorderRad),
                ),
                child: Container(
                  decoration: const BoxDecoration(gradient: JColor.gradient),
                ),
              ),
            ),
          ),
           SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: hh,
              maxHeight: hh*3,
              child: const Text(""),
            ),
          ),
          
          SliverToBoxAdapter(child: body),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Determine the radius based on the shrinkOffset
    double radius = shrinkOffset > 3 ? 20 : 55;

    return AnimatedContainer(
      decoration: BoxDecoration(
         color:  JColor.primary,
         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius))
      ),
     
      duration: const Duration(seconds: 5),
      child: Center(child: child),
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}



