import 'package:ai/models/user.dart';
import 'package:ai/screens/bottom_navigation/bottom_nav_helpers.dart';
import 'package:ai/screens/bottom_navigation/bottom_navigation.dart';
import 'package:ai/screens/checout/checkout_helpers.dart';
import 'package:ai/screens/home/home.dart';
import 'package:ai/screens/home/homepage_helpers.dart';
import 'package:ai/screens/landing_page/landing_helpers.dart';
import 'package:ai/screens/landing_page/landing_services.dart';
import 'package:ai/screens/profile/profile_helpers.dart';
import 'package:ai/screens/root/root.dart';
import 'package:ai/services/auth.dart';
import 'package:ai/services/db_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //auth
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
        ChangeNotifierProvider<DBFuture>(create: (_) => DBFuture()),
        ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
        ChangeNotifierProvider<LandingService>(
          create: (_) => LandingService(),
        ),
        ChangeNotifierProvider<LandingHelpers>(
          create: (_) => LandingHelpers(),
        ),
        ChangeNotifierProvider<BottomNavHelpers>(
          create: (_) => BottomNavHelpers(),
        ),
        ChangeNotifierProvider<HomepageHelpers>(
          create: (_) => HomepageHelpers(),
        ),
        ChangeNotifierProvider<CheckoutHelpers>(
          create: (_) => CheckoutHelpers(),
        ),
        ChangeNotifierProvider<ProfileHelpers>(
          create: (_) => ProfileHelpers(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                color: Colors.black,
              ),
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: BottomNavigationScreen(),
      ),
    );
  }
}
