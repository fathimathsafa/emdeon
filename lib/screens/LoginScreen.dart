import 'package:emdeon/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//login screen

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
      );
      Navigator.pushReplacementNamed(context, "/home"); // Navigate to Home Page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonHeight = MediaQuery.of(context).size.height * 0.07;
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 94, 25),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: fontSize * 1.5, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: login, // Call login function
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 6, 94, 25),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}