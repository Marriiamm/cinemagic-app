import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/constants.dart';
import '../../cubit/profile_cubit.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(Assets.imagesUser),
          ),
        ),
        Positioned(
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: red,
              borderRadius: BorderRadius.circular(24),
            ),
            height: 30,
            width: 30,
            child: IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.white,
              splashRadius: 0.01,
              iconSize: 16,
              onPressed: () {
                _showBottomSheet(context, cubit);
              },
            ),
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context, ProfileCubit cubit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return BottomSheetContent(
        onCameraTap: () async {
          await cubit.pickImage(ImageSource.camera);
          Navigator.pop(context);
        },
        onGalleryTap: () async {
          await cubit.pickImage(ImageSource.gallery);
          Navigator.pop(context);
        },
      );
    },
  );
}

class BottomSheetContent extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const BottomSheetContent({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a picture'),
            onTap: onCameraTap,
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from gallery'),
            onTap: onGalleryTap,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
