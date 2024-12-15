import 'package:chatapp/features/view/pages/auth/cubit/auth_cubit.dart';
import 'package:chatapp/features/view/pages/group/widget/arrow.dart';
import 'package:chatapp/features/view/pages/group/widget/group_appbar.dart';
import 'package:chatapp/features/view/pages/group/widget/second_step.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared-widget/image_avatar.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  List<Map<String, dynamic>> selectedUsers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GroupAppBar(),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text(''));
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
                  bool isSelected = selectedUsers
                      .any((selectedUser) => selectedUser['email'] == email);
                  return InkWell(
                    onTap: () {
                      if (isSelected) {
                        selectedUsers.removeWhere(
                                (selectedUser) => selectedUser['email'] == email);
                      } else {
                        selectedUsers.add(user);
                      }
                      setState(() {});
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
                      trailing: isSelected
                          ? const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                          : const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Arrow(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondStep(
                    selectedUsers: selectedUsers,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}