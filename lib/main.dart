import 'package:chatapp/theme/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'mychatapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
  ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    child:  const MyChatApp(),
   )
  );
}
