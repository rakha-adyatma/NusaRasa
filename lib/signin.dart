import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dapoer_nusantara/main.dart'; // Sesuaikan dengan nama file main.dart kamu
import 'package:dapoer_nusantara/signup.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showWarningDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Warning"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _signIn(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showWarningDialog(context, "Please fill in all fields.");
      return;
    }

    try {
      // Menggunakan Firebase Auth untuk login
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Jika login berhasil, arahkan ke halaman utama
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        _showWarningDialog(context, "Login failed, please try again.");
      }
    } on FirebaseAuthException catch (e) {
      // Menangani error dari Firebase Auth
      if (e.code == 'user-not-found') {
        _showWarningDialog(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        _showWarningDialog(context, "Wrong password provided for that user.");
      } else {
        _showWarningDialog(context, 'Error: ${e.message}');
      }
    } catch (e) {
      _showWarningDialog(context, 'Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink[300]!, Colors.purple[400]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  "NusaRasa",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: emailController,
                decoration: _inputDecoration("Email", Icons.email),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: _inputDecoration("Password", Icons.lock),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                  elevation: 8,
                  shadowColor: Colors.purpleAccent,
                ),
                onPressed: () => _signIn(context),
                child: Text("Sign In", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Belum punya akun? Sign Up",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white60),
      ),
      prefixIcon: Icon(icon, color: Colors.white70),
    );
  }
}
