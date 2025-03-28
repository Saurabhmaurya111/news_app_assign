import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/screens/news_feed_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NewsFeedPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  const SizedBox(height: 20),
                  itemButton(context, "assets/google.svg", 'Continue with Google', 25),
                  const SizedBox(height: 15),
                  itemButton(context, "assets/phone.svg", 'Continue with Mobile', 30),
                  const SizedBox(height: 15),
                  const Text("Or", style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 15),
                  textItem('Email...', emailController),
                  const SizedBox(height: 15),
                  textItem('Password...', passwordController, obscureText: true),
                  const SizedBox(height: 15),
                  colorButton(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'If you already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Sign In Button 
  Widget colorButton() {
    return GestureDetector(
      onTap: _signIn,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9068),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  /// Social Media & Mobile Sign-In Button
  Widget itemButton(BuildContext context, String imagePath, String buttonName, double size) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: size,
              width: size,
            ),
            const SizedBox(width: 15),
            Text(
              buttonName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Email & Password Input Field
  Widget textItem(String labelText, TextEditingController controller, {bool obscureText = false}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          if (labelText == 'Email...' &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
      ),
    );
  }
}
