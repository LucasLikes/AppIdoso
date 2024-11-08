import 'package:flutter/material.dart';
import '../src/chat_screen.dart';

class FloatingChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: Icon(Icons.chat),
      backgroundColor: Colors.blue,
    );
  }
}
