import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/themeprovider.dart';


//custom chat messages outline
class ChatOutline extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatOutline({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.deepPurpleAccent.shade200 : Colors.grey.shade500)
            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(message,style: TextStyle(color: isCurrentUser ? Colors.white
          : (isDarkMode ? Colors.white : Colors.black)),),
    );
  }
}
