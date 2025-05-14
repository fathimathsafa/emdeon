import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/firebase_options.dart';

import 'package:emdeon/screens/LoginScreen.dart';
import 'package:emdeon/screens/homeScreen.dart';
import 'package:emdeon/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.deepPurple,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => homeScreen(),
        '/about': (context) => AboutUsPage(),
        '/features': (context) => FeaturesPage(),
        '/services': (context) => ServicesPage(),
        '/feedbacks': (context) => FeedbackScreen(),
        '/contact': (context) => ContactPage(),
        '/projects': (context) => ProjectPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
