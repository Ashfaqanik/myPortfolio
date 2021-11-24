import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/themeProvider.dart';
import 'package:my_portfolio/provider/themeStyles.dart';
import 'package:my_portfolio/sections/mainSection.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider _themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    _themeProvider.lightTheme = (await _themeProvider.darkThemePref.getTheme())!;
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ashfaque',
        theme: ThemeStyles.themeData(_themeProvider.lightTheme, context),
        initialRoute: "/",
        routes: {
          "/": (context) => MainPage(),
          // "/workTogether": (context) => GetInTouch(),
          // "/details": (context) => ServiceDetails()
        },
      ),
    );
  }
}