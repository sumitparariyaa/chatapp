import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/message_model.dart';

class ChatService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for getting user
  Stream<List<Map<String, dynamic>>> getUsersStream(){
    return _firestore.collection('Users').snapshots().map((snapshot){
    return snapshot.docs.map((doc){
      final user = doc.data();
      return user;
     }).toList();
    });
  }

  //for send message
  Future<void> sendMessage(String receiverId, message) async {

    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
        senderId: currentUserId,
        senderEmail: currentUserEmail
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    await _firestore.collection("chat_room").doc(chatRoomId).collection("messages").add(newMessage.toMap());
  }

  //for get message
  Stream<QuerySnapshot> getMessages(String userId, otherUserid){
    List<String> ids = [userId, otherUserid];
    ids.sort();
    String chatRoomId = ids.join('_');
    return _firestore.collection("chat_room").doc(chatRoomId).collection("messages").orderBy("timestamp",descending:false).snapshots();
  }
}