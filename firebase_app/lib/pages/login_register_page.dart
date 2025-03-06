import 'package:firebase_app/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => LoginRegisterPageState();
}

class LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool islogin = true;
  String? errorMesage = "";

  Future<void> createUser() async {
    try {
      await Auth().createUser(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesage = e.message;
      });
    }
  }

  Future<void> signIn() async {
    try {
      await Auth().signin(
        email: emailController.text,
        password: passwordController.text,
      );

      print(Auth().currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMesage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "E-mail: ",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password: ",
                border: OutlineInputBorder(),
              ),
            ),
            errorMesage != null ? Text(errorMesage!) : SizedBox.shrink(),
            ElevatedButton(
              onPressed: () {
                if (islogin) {
                  signIn();
                } else {
                  createUser();
                }
              },
              child: islogin ? Text("Login") : Text("Register"),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  islogin = !islogin;
                });
              },
              child: Text("Henüz hesabın yok mu? Tıkla"),
            )
          ],
        ),
      ),
    );
  }
}
