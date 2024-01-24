import 'package:chatapp/services/auth/registerorlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Screens/HomeScreen.dart';


//check whether user is login or not. if user is login then navigate to home screen then LoginOrRegister screen

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          }else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
