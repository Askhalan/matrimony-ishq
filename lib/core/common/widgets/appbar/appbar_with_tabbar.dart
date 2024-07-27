// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class JAppbarWithTabs extends StatefulWidget {
  const JAppbarWithTabs(
      {super.key,
      required this.tabs,
      required this.children,
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
      this.scrollChild = const SizedBox(),
      required this.length,  this.appbarPinned = true});

  final List<Widget> tabs;
  final List<Widget> children;
  final Widget? body;
  final int length;

  final Widget? flexibleSpaceContent;
  final Widget? footerContent;
  final bool centerTitle;
  final bool showBackArrow;
  final bool footerPinned;
  final bool appbarPinned;
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
  _JAppbarWithTabsState createState() => _JAppbarWithTabsState();
}

class _JAppbarWithTabsState extends State<JAppbarWithTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: widget.showBackArrow,
            backgroundColor: JColor.primary,
            title: widget.title,
            centerTitle: widget.centerTitle,
            pinned: widget.appbarPinned,
            
            collapsedHeight: 58,
            floating: widget.floating,
            expandedHeight: widget.expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(gradient: JColor.gradient),
                child: widget.flexibleSpaceContent,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: widget.footerPinned,
            delegate: _SliverTabBarDelegate(
              TabBar(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                dividerHeight: 0,
                indicatorWeight: 0,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(JSize.borderRadLg),
                  color: Color.fromARGB(255, 255, 210, 232),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: widget.tabs,
              ),
              minHeight: widget.hh,
              maxHeight: widget.footerMaxHeight,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar,
      {required this.minHeight, required this.maxHeight});
  final double minHeight;
  final double maxHeight;
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double radius = shrinkOffset > 0 ? 20 : 55;
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: JColor.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius))),
      duration: const Duration(seconds: 5),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        _tabBar != oldDelegate._tabBar;
  }
}
