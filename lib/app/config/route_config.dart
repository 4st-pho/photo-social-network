import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/data/models/room.dart';
import 'package:photo_social_network/data/models/user.dart';
import 'package:photo_social_network/presentation/bloc/main_bloc.dart';
import 'package:photo_social_network/presentation/bloc/profile_bloc.dart';
import 'package:photo_social_network/presentation/pages/auth/login_page.dart';
import 'package:photo_social_network/presentation/pages/auth/logout_page.dart';
import 'package:photo_social_network/presentation/pages/auth/register_page.dart';
import 'package:photo_social_network/presentation/pages/chat/chat_detail_page.dart';
import 'package:photo_social_network/presentation/pages/main_page/main_page.dart';
import 'package:photo_social_network/presentation/pages/profile/profile_page.dart';
import 'package:photo_social_network/presentation/pages/show_image/show_image_page.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initRoute = "/";
  static const String showImage = "/showImage";
  static const String profile = "/profile";
  static const String login = "/login";
  static const String register = "/register";
  static const String chatDetail = "/chatDetail";
  static const String mainPage = "/mainPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => const LogoutPage(),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (context) => Provider<MainBloc>(
            create: (context) => MainBloc(),
            dispose: (_, bloc) => bloc.dispose(),
            child: const MainPage(),
          ),
        );
      case Routes.showImage:
        final args = routeSettings.arguments as List<dynamic>;
        final user = args[0] as UserModel?;
        final imagePath = args[1] as String;
        return MaterialPageRoute(
          builder: (context) => ShowImagePage(user: user, imagePath: imagePath),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => Provider<ProfileBloc>(
            create: (context) => ProfileBloc(),
            dispose: (_, bloc) => bloc.dispose(),
            child: const ProfilePage(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case Routes.chatDetail:
        final args = routeSettings.arguments as Room;
        return MaterialPageRoute(
          builder: (context) => ChatDetailPage(room: args),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.noRouteFound),
        ),
        body: const Center(child: Text(AppString.noRouteFound)),
      ),
    );
  }
}
