// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';

import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAppbar extends StatelessWidget {
  const JAppbar(
      {super.key,
      this.body,
      this.flexibleSpaceContent,
      this.footerContent,
      this.centerTitle = false,
      this.showBackArrow = false,
      this.leading,
      this.title,
      this.leadingIcon,
      this.leadingOnPressed,
      this.actions,
      this.horizontalpadding = JSize.md,
      this.floating = false,
      this.elevation,
      this.expandedHeight = 180,
      this.footerMaxHeight = 45,
      this.slivers,
      this.footerPinned = true,
      this.scrollChild = const SizedBox()});

  final Widget? body;

  final Widget? flexibleSpaceContent;
  final Widget? footerContent;
  final bool centerTitle;
  final bool showBackArrow;
  final bool footerPinned;
  final Widget? leading;
  final Widget? title;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final List<Widget>? actions;
  final double horizontalpadding;
  final bool floating;
  final double? elevation;
  final double hh = 15;
  final double expandedHeight;
  final double footerMaxHeight;
  final Widget? slivers;
  final Widget scrollChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: showBackArrow,
            backgroundColor: JColor.primary,
            // leading: showBackArrow ? IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}) : leading,
            title: title,
            centerTitle: centerTitle,
            actions: actions,
            elevation: elevation,
            pinned: true,
            floating: floating,
            collapsedHeight: 58,
            expandedHeight: expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(gradient: JColor.gradient),
                child: flexibleSpaceContent,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: footerPinned,
            delegate: _SliverAppBarDelegate(
              minHeight: hh,
              maxHeight: footerMaxHeight,
              child: footerContent ?? SizedBox(),
            ),
          ),
          SliverToBoxAdapter(child: body),
          SliverFillRemaining(
            hasScrollBody: false,
            child: scrollChild,
          )
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Determine the radius based on the shrinkOffset
    double radius = shrinkOffset > 3 ? 20 : 55;

    return AnimatedContainer(
      decoration: BoxDecoration(
          color: JColor.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius))),
      duration: const Duration(seconds: 5),
      child: Center(child: child),
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
