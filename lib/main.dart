import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import './providers.dart';
import './screens/list_page.dart';
import './theme/hex_color.dart';

Future<void> main() async {
  runApp(Goli());
}

class Goli extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: new MaterialApp(
        title: 'Goli votes',
        theme: new ThemeData(
          primaryColor: HexColor("FFB803"),
          fontFamily: GoogleFonts.workSans().fontFamily,
        ),
        home: SplashScreen(
            seconds: 2,
            // the widget to run after running your splashscreen for 1 sec
            navigateAfterSeconds: ListPage(title: 'Goli votes'),
            image: Image.asset('assets/images/splash.png'),
            backgroundColor: HexColor("FFEFC8"),
            photoSize: 100,
            loaderColor: HexColor("FFB803")),
      ),
      providers: appProviders,
    );
  }
}
