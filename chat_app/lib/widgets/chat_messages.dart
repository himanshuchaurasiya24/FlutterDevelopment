import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser;
    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text(
              'No messages',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          }
          if (snapshot.hasError) {
            return const Text(
              'Something went wrong!!!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          }
          final loadedMessages = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 20, left: 13, right: 13),
            itemCount: loadedMessages.length,
            reverse: true,
            itemBuilder: (context, index) {
              final chatMesseges = loadedMessages[index].data();
              final nextChatMesseges = index + 1 < loadedMessages.length
                  ? loadedMessages[index + 1].data()
                  : null;
              final currentMessageUsername = chatMesseges['username'];
              final nextMessageUsername = nextChatMesseges != null
                  ? nextChatMesseges['username']
                  : null;
              final currentMessageUserId = chatMesseges['userId'];
              final nextMessegeUserId =
                  nextChatMesseges != null ? nextChatMesseges['userId'] : null;
              final nextUserIdIsSame =
                  nextMessegeUserId == currentMessageUserId;
              if (nextUserIdIsSame) {
                return MessageBubble.next(
                    message: chatMesseges['text'],
                    isMe: authUser!.uid == currentMessageUserId);
              } else {
                return MessageBubble.first(
                  userImage: chatMesseges['userImage'],
                  username: chatMesseges['username'],
                  message: chatMesseges['text'],
                  isMe: nextUserIdIsSame,
                );
              }
            },
          );
        },
      ),
    );
  }
}
