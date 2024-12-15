
import 'package:chatapp/core/route/route.dart';
import 'package:chatapp/features/view/pages/auth/cubit/auth_cubit.dart';
import 'package:chatapp/features/view/pages/auth/login_page.dart';
import 'package:chatapp/features/view/pages/chat/widget/chat.dart';
import 'package:chatapp/features/view/pages/group/widget/new_group.dart';
import 'package:chatapp/features/view/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/view/pages/auth/signup_page.dart';
import '../../features/view/pages/splash.dart';
import '../dep.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {

    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const Splash());
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const SignupPage(),
            ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const LoginPage(),
            ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const Chat());
      case Routes.chatScreen:
        return MaterialPageRoute(
            builder: (_) => const Chat());
      case Routes.profileScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfilePage());
      case Routes.newGroupScreen:
        return MaterialPageRoute(
            builder: (_) => const NewGroup());
      default:
        return MaterialPageRoute(
            builder: (_) =>
            const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            ));
    }
  }
}