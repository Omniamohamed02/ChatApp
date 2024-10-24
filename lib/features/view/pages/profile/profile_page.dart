import 'package:flutter/material.dart';
import '../../../../core/themes/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Omnia Mohamed');
  final TextEditingController _phoneController = TextEditingController(text: '+201234567891');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: ColorApp.primaryColor),
        ),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          Stack(children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profileg.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorApp.primaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Icon(
                        size: 20,
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Name',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Phone',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: ColorApp.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Save Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
