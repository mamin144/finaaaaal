import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/agarly/screens/new/firebase/signin.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  bool _rememberMe = false; // Track remember me state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/pics/WhatsApp Image 2024-06-22 at 01.52.05_77f9356b.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Foreground content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50.0), // Spacing from the top
                    // Image.asset(
                    //   'lib/pics/Screenshot 2024-06-22 053237.png',
                    //   width: 200.0,
                    //   height: 150.0,
                    // ),
                    // const Text(
                    //   'YOUR DREAM, OUR RENTAL',
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //     fontFamily: 'Roboto',
                    //     fontWeight: FontWeight.w400,
                    //     color: Color(0xFF000000),
                    //   ),
                    // ),
                    const SizedBox(height: 250.0), // Spacing before login form
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.59,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 0.08,
                          ),
                        ),
                        if (_emailErrorMessage != null)
                          Text(
                            _emailErrorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.50),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Please Enter Your Email',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 7.0),
                            ),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.59,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 0.08,
                          ),
                        ),
                        if (_passwordErrorMessage != null)
                          Text(
                            _passwordErrorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.50),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Please Enter Your Password',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 7.0),
                            ),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _signInWithEmailAndPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Log In',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ],
                    ),
                    if (_errorMessage
                        .isNotEmpty) // Show error message if exists
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Login as owner",
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.59,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 0.08,
                          ),
                        ),
                        Switch(
                          value: _rememberMe,
                          onChanged: (newValue) {
                            setState(() {
                              _rememberMe = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.59,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 0.08,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.59,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.08,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((value) {
      if (_rememberMe) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HostHomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    }).catchError((error) {
      setState(() {
        _errorMessage = 'Invalid email or password. Please try again.';
      });
    });
  }
}
