// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/widgets/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/helpers/io_helper.dart';

class ScnAddProfileImg extends StatefulWidget {
  const ScnAddProfileImg({super.key});

  @override
  State<ScnAddProfileImg> createState() => _ScnAddProfileImgState();
}

class _ScnAddProfileImgState extends State<ScnAddProfileImg> {
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        expandedHeight: 0,
        title: AppbarTitle(
          title: 'Add your Image',
          subtitle: 'Your privacy is our priority',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                JGap(),
                InkWell(
                    onTap: () {
                      selectImage();
                      context
                          .read<ProfileBloc>()
                          .add(AddProfilePhoto(profileImage: image));
                    },
                    child: image != null
                        ? AspectRatio(
                            aspectRatio: 0.8,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(JSize.borderRadLg),
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                )))
                        : AspectRatio(
                            aspectRatio: 0.8,
                            child: SectionWraperContainer(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.gallery_add4),
                                JGap10(),
                                Text(
                                  'Add your profile image',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          )),
                JGap(),
                Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 4,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(AddProfilePhoto(profileImage: image));
                        }, child: Text('Create Account')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}