import 'package:get_it/get_it.dart';

import '../../features/profile/cubit/profile_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Core
  //getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Cubits
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
}
