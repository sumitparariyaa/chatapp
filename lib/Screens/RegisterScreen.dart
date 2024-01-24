import 'package:chatapp/services/auth/authservice.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';

class RegisterScreen extends StatelessWidget {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _confirmController = TextEditingController();
 final void Function()? onTap;

   RegisterScreen({super.key,required this.onTap});

  //register and error handling
 void register(BuildContext context){
   if (_passwordController.text == _confirmController.text &&
       _passwordController.text.length >= 7 &&
       _confirmController.text.length >= 7){
    try{
      final auth = AuthService();
      auth.signUpWithEmailPassword(_emailController.text,_passwordController.text);
    }catch(e){
      showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }else{
    showDialog(context: context,
        builder: (context)=> const AlertDialog(
      title: Text("Passwords Don't Match! or password Length is less than 7"),
        )
    );
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message,size: 60,color: Theme.of(context).colorScheme.primary,),
          const SizedBox(height: 50,),
          Text("Let's create an account for you",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),),
          const SizedBox(height: 25,),
          MyTextField(hintText: 'Email', obscureText: false, controller: _emailController,),
          const SizedBox(height: 10,),
          MyTextField(hintText: 'Password', obscureText: true, controller: _passwordController,),
          const SizedBox(height: 10,),
          MyTextField(hintText: 'Confirm Password', obscureText: true, controller: _confirmController,),
          const SizedBox(height: 25,),
          MyButton(text: 'Register', onTap:() => register(context)),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              GestureDetector(
                onTap: onTap,
                  child: Text("Login Now",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),)),
            ],
          )
        ],
      ),
    );
  }
}
