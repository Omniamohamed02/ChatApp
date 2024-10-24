import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(10),
            child: Text( 'Recent',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),)),
        ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profileg.png'),
              ),
              title: Text(
                'Karim',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Today, 12:25 PM',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              trailing: Icon(Icons.call),
            );
          },
        ),
      ],
    );
  }
}
