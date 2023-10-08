import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magnetar_fima/pages/welcome.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  // We store the app and auth to make testing with a named instance easier.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  SpinKitSquareCircle? spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = SpinKitSquareCircle(
      color: Colors.redAccent,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800)),
    );

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => new WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinkit!,
            SizedBox(
              height: 25,
            ),
            Text(
              "Magnetar FIMA",
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
