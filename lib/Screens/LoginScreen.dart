import 'package:chatapp/services/auth/authservice.dart';
import 'package:chatapp/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import '../widgets/mytextfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

   LoginScreen({super.key, required this.onTap});

   //login method
   void login(BuildContext context) async{
      final authService = AuthService();
      try{
        await authService.signInWthEmailPassword(_emailController.text,_passwordController.text);
      }catch(e){
        // ignore: use_build_context_synchronously
        showDialog(context: context,
            builder: (context)=> AlertDialog(
              title: Text(e.toString()),
         ),
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
          Text("Welcome Back, You've been missed",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),),
          const SizedBox(height: 25,),
          MyTextField(hintText: 'Email', obscureText: false, controller: _emailController,),
          const SizedBox(height: 10,),
          MyTextField(hintText: 'Password', obscureText: true, controller: _passwordController,),
          const SizedBox(height: 25,),
          MyButton(text: 'Login', onTap: ()=> login(context)),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              GestureDetector(
                  onTap: onTap,
                  child: Text("Register Now",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),)),
            ],
          )
        ],
      ),
    );
  }
}
