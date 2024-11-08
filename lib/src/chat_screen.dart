import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat com Assistente'),
      ),
      body: Center(
        child: Text(
          'Olá! Como posso ajudar você hoje?',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
