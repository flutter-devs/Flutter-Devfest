import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_devfest_gdg_newdelhi/constant/constant.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';

import 'package:flutter_devfest_gdg_newdelhi/utils/styles.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/agenda_screen.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/home_screen.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/speaker_list.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/speakers.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/splashscreen.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/sponsors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.devFestPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) {
            return themeChangeProvider;
          },
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
              AGENDA: (BuildContext context) => AgendaScreen(),
              HOME_SCREEN: (BuildContext context) => HomeScreen(),
              SPEAKER: (BuildContext context) => SpeakerDetailsScreen(null),
              SPEAKER_LIST: (BuildContext context) => SpeakersScreenList(),
              SPONSORS: (BuildContext context) => Sponsors(),
              TEAM: (BuildContext context) => SpeakersScreenList(),
            },
          );
        },
      ),
    );
  }
}
