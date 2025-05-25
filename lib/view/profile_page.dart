import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Avanzo Profile"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/john_doe.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 16,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "johndoe@example.com",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatBox("Donated", "12"),
                _buildStatBox("Received", "5"),
              ],
            ),
            SizedBox(height: 32),
            // ListTile(
            //   leading: Icon(Icons.edit, color: Colors.green),
            //   title: Text("Edit Profile"),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: Icon(Icons.logout, color: Colors.red),
            //   title: Text("Logout"),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
