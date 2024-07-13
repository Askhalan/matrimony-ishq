// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar.dart';
import 'package:ishq/core/common/widgets/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnProfile extends StatelessWidget {
  const ScnProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        showBackArrow: true,
         footerMaxHeight: 100,
         expandedHeight: 250,
        //---------------------------------- FLEXIBLE SPACE CONTENT ---------------------------------
        
        flexibleSpaceContent: Padding(
          padding: EdgeInsets.only(
              left: JSize.defaultPaddingValue,
              right: JSize.defaultPaddingValue,
              top: JSize.defaultPaddingValue*5),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 180,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/defaultUserImages.jpeg",fit: BoxFit.cover,)),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Askhalan", style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: JColor.white),),
                    JGap(h: 10,),
                    Row(
                      children: [
                        Icon(Iconsax.calendar, size: 20,),JGap(w: 5),
                        Text("23 years ", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: JColor.white),),
                      ],
                    ),
                     JGap(h: 5,),
                    Row(
                      children: [
                         Icon(Iconsax.location,size: 20,),JGap(w: 5),
                        Text("Kozhicode", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: JColor.white),),
                      ],
                    ),
                     JGap(h: 5,),
                    Row(
                      children: [
                         Icon(Iconsax.moon, size: 20),JGap(w: 5),
                        Text("Sunni", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: JColor.white),),
                      ],
                    ),
                    JGap(h: 5,),
                    Row(
                      children: [
                         Icon(Iconsax.link, size: 20),JGap(w: 5),
                        Text("Not Maried", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: JColor.white),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
       
        //----------------------------------- ACTION BUTTONS ROW -----------------------------------

        footerContent: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Text(
                    "Edit Profile",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              JGap(),
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Text(
                    "Upgrade plan",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              JGap(),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Icon(
                    Icons.share,
                    color: JColor.accent,
                  ),
                ),
              )
            ],
          ),
        ),
        // body: Expanded(
        //   child: ListView.builder(
        //     itemCount: 20,
        //     itemBuilder: (BuildContext context, int index) {
        //       return ListTile(leading: CircleAvatar(),);
        //     },
        //   ),
        // ),
      ),
    );
  }
}
