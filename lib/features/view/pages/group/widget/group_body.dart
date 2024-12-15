import 'package:chatapp/core/shared-widget/image_avatar.dart';
import 'package:chatapp/features/view/pages/auth/cubit/auth_cubit.dart';
import 'package:chatapp/features/view/pages/chat/widget/chat_shimmer.dart';
import 'package:chatapp/features/view/pages/group/group_conversation.dart';
import 'package:chatapp/features/view/pages/group/widget/new_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupsBody extends StatelessWidget {
  const GroupsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('groups').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ChatShimmer();
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text('No Groups found, Try add a group'));
            }

            var groups = snapshot.data!.docs;

            return ListView.builder(
              itemCount: groups.length - 1,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var group = groups[index].data() as Map<String, dynamic>;
                String groupId = group['groupId'] ?? 'No group Id';
                String groupName = group['groupName'] ?? 'No group name';
                List<dynamic> groupParticipants =
                    group['participants'] ?? 'No Group Participants';
                bool isCurrentEmailParticipant =
                groupParticipants.contains(currentEmail);
                if (isCurrentEmailParticipant == true) {
                  return const SizedBox.shrink();
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupConversation(
                          groupId: groupId,
                          groupName: groupName,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const ImageAvatar(isGroup: true),
                    title: Text(groupName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.group,
                            color: Colors.blueGrey, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          groupParticipants[index],
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewGroup(),));
            },
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}