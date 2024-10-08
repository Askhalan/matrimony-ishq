// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/loader/fullscreen_loadder.dart';
import 'package:ishq/core/common/widgets/snackbar/error_snackbar.dart';
import 'package:ishq/core/common/widgets/snackbar/show_snackbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_inside_card.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';
import 'package:ishq/utils/helpers/io_helper.dart';

class ScnAddProfileImg extends StatefulWidget {
  const ScnAddProfileImg({super.key});

  @override
  State<ScnAddProfileImg> createState() => _ScnAddProfileImgState();
}

class _ScnAddProfileImgState extends State<ScnAddProfileImg> {
  XFile? image;

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
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            Navigator.pushReplacementNamed(context, Routes.addPreferenceScn);
          }
          if (state is ProfileFailure) {
            showSnackBar(context, ErrorSnackBar(message: JTexts.tryAgain));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: const JFullscreenLoader());
          }
          return JAppbar(
            expandedHeight: 0,
            title: AppbarTitle(
              title: JTexts.ADD_UR_IMAGE,
              subtitle: JTexts.UR_PRIVACEY_MATTERS,
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
                                    borderRadius: BorderRadius.circular(
                                        JSize.borderRadLg),
                                    child: Image.file(
                                      File(image!.path),
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
                                      JTexts.ADD_UR_PROFILE_IMAGE,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              )),
                    JGap(),
                    Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 4,
                        child: BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            return ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                      AddProfilePhoto(profileImage: image));
                                  context.read<ProfileBloc>().add(SaveUser());
                                },
                                child: Text(JTexts.createAccount));
                          },
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
