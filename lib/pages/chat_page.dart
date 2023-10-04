import 'package:chatt_app/constants.dart';
import 'package:chatt_app/pages/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static String id = 'chat page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat App'),
            Image.asset(
              kLogo,
              height: 50,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ChatBubble(),
    );
  }
}
