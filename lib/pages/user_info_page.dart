import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Story'),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text('Country'),
            ),
            ListTile(
              title: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
