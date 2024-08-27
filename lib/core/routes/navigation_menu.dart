import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/scn_profile.dart';
import 'package:ishq/features/match/presentation/chat/pages/scn_chat_list.dart';
import 'package:ishq/features/match/presentation/match/pages/home/scn_home.dart';
import 'package:ishq/features/match/presentation/match/pages/matches/scn_matches.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key,});
 

  @override
  NavigationMenuState createState() => NavigationMenuState();
}

class NavigationMenuState extends State<NavigationMenu>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        fit: StackFit.expand,
        borderRadius: BorderRadius.circular(JSize.borderRadLg),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        width: MediaQuery.of(context).size.width * 0.9,
        barColor: JColor.primary,
        start: 1,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,

        hideOnScroll: true,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: const [
            ScnHome(),
            ScnMatches(),
            ScnChat(),
            ScnProfile()
          
          ],
        ),
        child: TabBar(
          isScrollable: false,
    
          indicatorPadding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
          controller: tabController,
          indicator: BoxDecoration(
              border: Border.all(color: JColor.grey),
              color: JColor.softGrey,
              borderRadius: BorderRadius.circular(5)),
          tabs: [
            SizedBox(
              height: 55,
              child: Center(
                  child: Icon(
                Iconsax.home_2,
                color: currentPage == 0 ? JColor.primary : JColor.grey,
              )),
            ),
            
            SizedBox(
              height: 55,
              child: Center(
                  child: Icon(
                Iconsax.link,
                color: currentPage == 1 ? JColor.primary : JColor.grey,
              )),
            ),
            SizedBox(
              height: 55,
              child: Center(
                  child: Icon(
                Iconsax.sms,
                color: currentPage == 2 ? JColor.primary : JColor.grey,
              )),
            ),
            SizedBox(
              height: 55,
              child: Center(
                  child: Icon(
                Iconsax.user,
                color: currentPage == 3 ? JColor.primary : JColor.grey,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
