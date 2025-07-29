import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_splashh/features/auth/views/login_view.dart';
import 'package:test_splashh/features/categories/view/seats_view.dart';
import '../../features/bookings/views/qr_view.dart';
import '../../features/categories/view/movie_details_view.dart';
import '../../features/categories/view/payment_view.dart';
import '../../features/home/view/main_screen_view.dart';
import '../../features/intro/views/start_screen.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import '../di/injections.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [BlocProvider(create: (_) => getIt<ProfileCubit>())],
                child: const MainScreenView(),
              ),
        );
      case Routes.movieDetailsScreen:
        return MaterialPageRoute(builder: (_) => const MovieDetailsView());
      case Routes.seatsScreen:
        return MaterialPageRoute(builder: (_) => const SeatsView());
      case Routes.qrScreen:
        return MaterialPageRoute(builder: (_) => const QrView());
      case Routes.paymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentView());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
