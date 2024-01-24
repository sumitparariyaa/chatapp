import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for current user
  User? getCurrentUser(){
    return _auth.currentUser;
  }

 //Sign in user with email and password.
  Future<UserCredential> signInWthEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        },
      );
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //Sign up use with email and password.
  Future<UserCredential> signUpWithEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        },
      );
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //for user to sign out
  Future<void> signOut()async{
    return await _auth.signOut();
  }
}