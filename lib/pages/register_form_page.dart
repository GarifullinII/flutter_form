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
              hintText: 'Introduce youreself', // скрытый текст
              prefixIcon: Icon(
                Icons.person,
              ), // префиксная иконка
            ),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Phone number *',
              hintText: 'Add your phone number',
              prefixIcon: Icon(
                Icons.phone,
              ),
            ),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email adress',
                hintText: 'Add your email adress',
                prefixIcon: Icon(
                  Icons.email_outlined,
                )),
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
            decoration: InputDecoration(labelText: 'Password *'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm password *'),
          ),
          SizedBox(
            // создаем отступ между полями
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit form',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green,
              ),
            ),
          )
        ],
      )),
    );
  }
}
