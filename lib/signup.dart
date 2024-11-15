import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signin.dart'; // Pastikan import SignInPage
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

  Future<void> _signUp(BuildContext context) async {
    String fullName = fullNameController.text;
    String telephone = telephoneController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (fullName.isEmpty ||
        telephone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showWarningDialog(context, "Please fill in all fields.");
      return;
    }

    if (password != confirmPassword) {
      _showWarningDialog(context, "Passwords do not match.");
      return;
    }

    try {
      // Buat akun dengan Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Simpan data pengguna ke Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': fullName,
        'telephone': telephone,
        'email': email,
      });

      _showWarningDialog(context, "Sign Up successful for $fullName!");

      // Navigasi ke SignInPage setelah 1 detik
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showWarningDialog(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showWarningDialog(
            context, 'The account already exists for that email.');
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 36,
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
              // Input fields
              TextField(
                controller: fullNameController,
                decoration: _inputDecoration("Full Name", Icons.person),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: telephoneController,
                decoration: _inputDecoration("Telephone", Icons.phone),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
              TextField(
                controller: confirmPasswordController,
                decoration: _inputDecoration("Confirm Password", Icons.lock),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 24.0),

              // Sign Up Button
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
                onPressed: () => _signUp(context),
                child: Text("Sign Up", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 16.0),

              // Navigate back to Sign In
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Sudah punya akun? Sign In",
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
