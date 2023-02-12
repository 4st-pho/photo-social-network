import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_theme.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        theme: AppTheme.general,
        debugShowCheckedModeBanner: true,
        initialRoute: Routes.initRoute,
      ),
    );
  }
}