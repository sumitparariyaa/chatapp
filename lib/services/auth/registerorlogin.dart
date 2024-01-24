import 'package:chatapp/Screens/LoginScreen.dart';
import 'package:chatapp/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';


//toggle between login and register screen

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginScreen = true;

  void toggleScreens(){
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen){
      return LoginScreen(onTap: toggleScreens);
    }else{
      return RegisterScreen(onTap:toggleScreens);
    }
  }
}
