part of 'profile_cubit.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileDataLoaded extends ProfileState {
  final String? avatarUrl;
  ProfileDataLoaded({this.avatarUrl});
}
class ProfileGenderSelected extends ProfileState {}

class ProfileImagePicked extends ProfileState {
  final Uint8List imageBytes;
  ProfileImagePicked(this.imageBytes);
}

class ProfileChangeGender extends ProfileState {
  
  ProfileChangeGender();
}

class ProfileSuccess extends ProfileState {
}

class ProfileUpdatedSuccess extends ProfileState {
  final String message;
  ProfileUpdatedSuccess(this.message);
}

class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure(this.error);
}
