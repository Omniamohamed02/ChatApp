import 'package:chatapp/features/view/pages/home/widget/chat_listile.dart';
import 'package:chatapp/features/view/pages/home/widget/massagebutton.dart';
import 'package:flutter/material.dart';


class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        itemCount: 8,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ChatListile();
        },
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: Massagebutton()
      ),
    ]);
  }
}