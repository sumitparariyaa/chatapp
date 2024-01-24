import 'package:flutter/material.dart';
import 'package:chatapp/services/auth/authservice.dart';
import 'package:chatapp/services/chats/chat_service.dart';
import '../widgets/mydrawer.dart';
import '../widgets/usertile.dart';
import 'ChatScreen.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer:const MyDrawer(),
      body: _buildUserList(),
    );
  }

  //building user list
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text('Error');
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading..");
          }
          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
          );
        }
    );
  }

  //building user list items
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
     if(userData["email"] != _authService.getCurrentUser()!.email){
       return UserTile(text: userData["email"],
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder:(context)=> ChatScreen(receiverEmail: userData["email"], receiverId: userData["uid"],)));
           });
     }else{
       return Container();
     }
  }
}
