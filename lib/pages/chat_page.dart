import 'package:chatt_app/constants.dart';
import 'package:chatt_app/models/message_model.dart';
import 'package:chatt_app/pages/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final ScrollController _controller = ScrollController();
  static String id = 'chat page';

  TextEditingController controller = TextEditingController();
  // todo

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(KCreatedAt).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data!.docs[0]['message']);
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
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
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return ChatBubble(
                            message: messagesList[index],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      // todo
                      controller: controller,
                      onSubmitted: (data) {
                        messages
                            .add({kMessage: data, KCreatedAt: DateTime.now()});
                        controller.clear();
                        // todo animate to
                        _controller.animateTo(
                          _controller.position.maxScrollExtent,
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Loading ');
          }
        });
  }
}
