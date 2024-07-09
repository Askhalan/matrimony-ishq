import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAppbar extends StatelessWidget {
  JAppbar({
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
            leading: showBackArrow ? IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: leadingOnPressed) : leading,
            title: title,
            centerTitle: centerTitle,
            actions: actions,
            elevation: elevation,
            pinned: true,
            floating: floating,
            collapsedHeight: 60,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(JSize.appbarBorderRad),
                  bottomRight: Radius.circular(JSize.appbarBorderRad),
                ),
                child: Container(
                  decoration: BoxDecoration(gradient: JColor.gradient),
                ),
              ),
            ),
          ),
           SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate1(
              minHeight: hh,
              maxHeight: hh*4,
              child: Text(""),
            ),
          ),
          
          SliverToBoxAdapter(child: body),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate1 extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate1({
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

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      child: Container(
        color: JColor.primary,
        child: Center(child: child),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate1 oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

