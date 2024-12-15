// import 'package:chatapp/features/view/pages/chat/chat_page.dart';
// import 'package:chatapp/features/view/pages/chat/conversation.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/themes/colors.dart';
//
// class ChatListile extends StatelessWidget {
//   const ChatListile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//     elevation: 1,
//       child: ListTile(
//       leading: CircleAvatar(
//         radius: 30,
//         backgroundImage: AssetImage('assets/images/profileg.png'),
//       ),
//       title: Text(
//         'Ahmed',
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Row(
//         children: [
//           Icon(Icons.done_all, color: Colors.grey, size: 20),
//           SizedBox(width: 5),
//           Text(
//             'This is the last message',
//             style: TextStyle(color: Colors.grey),
//             overflow: TextOverflow.ellipsis,
//           )
//         ],
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text('07:00 PM'),
//           SizedBox(height: 5),
//           CircleAvatar(
//             radius: 12,
//             backgroundColor: ColorApp.primaryColor,
//             child: Center(
//               child: Text(
//                 '5',
//                 maxLines: 1,
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           )
//         ],
//       ),
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) =>  (ConversationView(email: email, name: name, phone: phone, chatId: chatId)),
//         ));
//       },
//     ));
//   }
// }
