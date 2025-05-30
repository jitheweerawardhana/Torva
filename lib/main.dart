import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torva/Services/auth.dart';
import 'package:torva/models/userModel.dart';
import 'package:torva/theme/app_theme.dart';
import 'router/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usermodel?>.value(
      initialData: Usermodel(uid: ""),
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Torva',
        theme: AppTheme.lightTheme, // Use light theme
        darkTheme: AppTheme.darkTheme, // Use dark theme
        themeMode: ThemeMode.system, // Use system theme

        initialRoute: AppRoutes.home,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
