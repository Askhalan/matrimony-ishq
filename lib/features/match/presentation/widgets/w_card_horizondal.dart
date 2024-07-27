// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/profile_details_labe.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';

class WUserCardHorizondal extends StatelessWidget {
  WUserCardHorizondal(
      {super.key,
      required this.image,
      required this.name,
      required this.age,
      required this.state,
      required this.cast,
      this.onTap});
  void Function()? onTap;
  final String image;
  final String name;
  final String age;
  final String state;
  final String cast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 72, 113),
              borderRadius: BorderRadius.circular(JSize.borderRadXl)),
          child: Row(
            children: [
              //------------------ User Image ---------------------
              AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 72, 213, 235),
                      borderRadius: BorderRadius.circular(JSize.borderRadXl)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(JSize.borderRadXl),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              JGap(
                w: 10,
              ),

              //--------------------- User Details -------------------

              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //------------Name------------
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: JColor.white),
                    ),
                    JGap(
                      h: 10,
                    ),

                    //------------Age------------

                    ProfileDetailsLabel(text: age, icon: Iconsax.calendar),
                    JGap(h: 5),

                    //------------Location------------

                    ProfileDetailsLabel(text: state, icon: Iconsax.location),
                    JGap(h: 5),

                    //------------Location------------
                    ProfileDetailsLabel(text: cast, icon: Iconsax.moon),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
