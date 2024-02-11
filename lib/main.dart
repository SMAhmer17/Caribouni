// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'dart:async';

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/provider/EventData.dart';
import 'package:caribouni/provider/FoodData.dart';
import 'package:caribouni/provider/PropertyData.dart';
import 'package:caribouni/screens/NavBar.dart';
import 'package:caribouni/screens/auth_screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

import 'utils/app_export.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => Authentication(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => PropertyData(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => FoodData(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => EventData(),
      ),
    ],
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          builder: ((context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                  alwaysUse24HourFormat:
                      true), //set desired text scale factor here
              child: child ?? Container(),
            );
          }),
          home: const MyApp(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color(0xFFDCB34F),
            ),
          ),
        );
      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 7),
      () {
        print('login');
        setState(
          () {
            RouteTransition(
              context: context,
              child: Consumer<Authentication>(
                  builder: (ctx, auth, _) => auth.isAuth
                      ? const NavBar()
                      : FutureBuilder(
                          future: auth.tryAutoLogin(),
                          builder: (ctx, authResultSnapshot) =>
                              authResultSnapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? const SplashScreen()
                                  : OnboardingScreen())),
              animation: AnimationType.fadeIn,
              duration: const Duration(seconds: 6),
              repacement: true,
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return SplashScreen();
    // return MainHomeScreen(index: 0,);
  }
}
