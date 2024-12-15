
import 'package:chatapp/features/view/pages/auth/cubit/auth_cubit.dart';
import 'package:chatapp/features/view/pages/chat/conversation.dart';
import 'package:chatapp/features/view/pages/chat/data/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared-widget/image_avatar.dart';
import 'chat_shimmer.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ChatShimmer();
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No users found'));
            }

            var users = snapshot.data!.docs;

            return ListView.builder(
              itemCount: users.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var user = users[index].data() as Map<String, dynamic>;
                String name = user['name'] ?? 'No name';
                String phone = user['phone'] ?? 'No phone';
                String email = user['email'] ?? 'No email';
                if (email == currentEmail) {
                  return const SizedBox();
                }
                return InkWell(
                  onTap: () {
                    String chatId = generateChatIdForUsers(currentEmail, email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationView(
                          chatId: chatId,
                          email: email,
                          name: name,
                          phone: phone,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const ImageAvatar(),
                    title: Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.numbers,
                            color: Colors.blueGrey, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          phone,
                          style: const TextStyle(color: Colors.blueGrey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                  ),
                );
              },
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}