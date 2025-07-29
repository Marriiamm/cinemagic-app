import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/textFields.dart';
import '../cubit/profile_cubit.dart';
import 'widgets/profile_photo_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    final profileCubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              ProfilePhotoWidget(),
              SizedBox(height: height * 0.1),
              CustomTextFormField(
                prefixIcon: Icons.person,
                controller: profileCubit.nameController,
                hintText: "name",
              ),
              SizedBox(height: 8),
              CustomTextFormField(prefixIcon: Icons.mail, hintText: "Email",),
              SizedBox(height: 8),
              CustomTextFormField(
                prefixIcon: Icons.password_rounded,
                hintText: "password",
              ),
              SizedBox(height: 24),
              CustomButton(buttonLabel: 'Update'),
            ],
          ),
        ),
      ),
    );
  }
}
