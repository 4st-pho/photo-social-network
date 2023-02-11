import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/presentation/bloc/main/main_bloc.dart';
import 'package:photo_social_network/presentation/pages/main_page/main_page.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => Provider(
            create: (context) => MainBloc(),
            // dispose: (_, bloc) => bloc.dispose(),
            child: const MainPage(),
          ),
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
