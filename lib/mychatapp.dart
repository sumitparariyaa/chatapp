import 'package:chatapp/services/auth/authGate.dart';
import 'package:chatapp/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGate(),
    );
  }
}
