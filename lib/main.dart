import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_widget/favourt/faviourtScreen.dart';
import 'package:provider_widget/provider/auth_provider.dart';
import 'package:provider_widget/provider/count_provider.dart';
import 'package:provider_widget/provider/example_one_provider.dart';
import 'package:provider_widget/provider/favourt_provider.dart';
import 'package:provider_widget/provider/theme_changer_provider.dart';
import 'package:provider_widget/screen/count_example.dart';
import 'package:provider_widget/screen/dark_theme.dart';
import 'package:provider_widget/screen/example_one.dart';
import 'package:provider_widget/screen/login.dart';
import 'package:provider_widget/screen/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavourteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
                primaryColor: Colors.greenAccent,
                // ignore: prefer_const_constructors
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.brown,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
                  iconTheme: const IconThemeData(
                    color: Colors.red,
                  )),
              home: const LoginScreen(),
            );
          },
        ));
  }
}
