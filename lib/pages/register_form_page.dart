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
          SizedBox(
            // создаем отступ между полями
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone number *'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email adress'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Life story'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm password'),
          ),
        ],
      )),
    );
  }
}
