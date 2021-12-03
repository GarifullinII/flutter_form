import 'package:flutter/material.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register form'),
        centerTitle: true,
      ),
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Full name *',
            ),
          ),
          SizedBox( // создаем отступ между полями
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone number *'),
          ),
        ],
      )),
    );
  }
}
