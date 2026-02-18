import 'dart:io';

import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/core/widget/button_submit.dart';
import 'package:cinetrack/core/widget/form_field_widget.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:cinetrack/features/profile/presentation/bloc/update_profile/update_profile_bloc.dart';
import 'package:cinetrack/features/profile/presentation/bloc/update_profile/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.user});

  final User user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController newFullNameController = TextEditingController();
  final TextEditingController newUserNameController = TextEditingController();

  File? _selectedImage;
  Avatar? _avatar;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked == null) return;

    final file = File(picked.path);
    final bytes = await file.readAsBytes();
    final mimeType = lookupMimeType(file.path) ?? 'image/jpeg';

    setState(() {
      _selectedImage = file;
      _avatar = Avatar(bytes, file.path, mimeType);
    });
  }

  @override
  void dispose() {
    newFullNameController.dispose();
    newUserNameController.dispose();
    _selectedImage = null;
    super.dispose();
  }

  @override
  void initState() {
    newFullNameController.text = widget.user.fullName;
    newUserNameController.text = widget.user.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Edit Profile', style: AppTextStyle.xxLargeWhite),
              const SizedBox(height: 20),
              Stack(
                children: [
                  ClipOval(
                    child: _selectedImage != null
                        ? Image.file(
                            _selectedImage!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.user.profilePhoto,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6366F1),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              FormFieldWidget(
                controller: newFullNameController,
                title: 'New Full Name',
                hintText: 'Enter your new full name',
                icon: Icons.person,
              ),
              const SizedBox(height: 15),
              FormFieldWidget(
                controller: newUserNameController,
                title: 'New Username',
                hintText: 'Enter your new username',
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccess) {
                    showSnack(context, state.message);
                    Navigator.pop(context);
                    context.read<ProfileBloc>().fetchProfile();
                  } else if (state is UpdateProfileFailure) {
                    showSnack(context, state.error);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return ButtonSubmit(
                    title: 'Edit Profile',
                    isLoading: state is UpdateProfileLoading,
                    onTap: () {
                      final fullName = newFullNameController.text.trim();
                      final userName = newUserNameController.text.trim();

                      context.read<UpdateProfileBloc>().updateProfileData(
                        fullName,
                        userName,
                        _avatar,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
