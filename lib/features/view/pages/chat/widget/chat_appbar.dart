import 'package:flutter/material.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppbar({super.key});
  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          elevation: 2,
          leading: Image.asset('assets/images/profileg.png'),
      title: Text('Ahmed'),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.video_camera_back_rounded),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))

      ],
    );
  }


}
