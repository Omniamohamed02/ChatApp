import 'package:chatapp/features/view/pages/status/widget/add_status.dart';
import 'package:chatapp/features/view/pages/status/widget/recent_status.dart';
import 'package:chatapp/features/view/pages/status/widget/update_status.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        AddStatus(),
        Padding(
            padding: EdgeInsets.all(10),
        child: Text('Recent updates',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),)) ,
        RecentStatus(),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.all(10),
            child: Text( 'Viewed updates',style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),)),
        SizedBox(height: 10),
        UpdateStatus(),
      ],
    );
  }
}
