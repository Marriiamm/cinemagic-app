import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
   
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  String? avatarUrlFromApi;
  Uint8List? newProfileImageBytes;

  String? get avatarUrl => avatarUrlFromApi;

  Uint8List? get profileImageBytes => newProfileImageBytes;

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 70,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      newProfileImageBytes = await pickedFile.readAsBytes();
      emit(ProfileImagePicked(newProfileImageBytes!));
    }
  }
}
