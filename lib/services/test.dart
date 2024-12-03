import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              try {
                print("Inside the TRY BLOCK");
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "pandyaakshat04@gmail.com",
                  password: "5fdkyi2mas",
                );
                print("TRY BLOCK EXECUTED");
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }
            }, child: Text("Sign up ")),
          ],
        ),
      ),
    );
  }
}
