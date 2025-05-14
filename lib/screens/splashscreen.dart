import 'dart:async';
import 'homeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),(){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => homeScreen()));

      }
    ) ;
    
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 1, 56, 4),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo2.png', // Replace with your logo file path
                width: 350,
                height: 250,
              ),
              const SizedBox(height: 20),
              // const Text(
              //   "Zepto",
              //   style: TextStyle(
              //     fontSize: 50,
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}





