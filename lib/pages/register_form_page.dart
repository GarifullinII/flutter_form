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
              suffixIcon: Icon(
                Icons.delete_outline,
              ), // редактирование поля, удаление
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
              suffixIcon: Icon(
                Icons.delete_outline,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email adress',
              hintText: 'Add your email adress',
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
              suffixIcon: Icon(
                Icons.delete_outline,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Life story',
                hintText: 'Add your story',
                prefixIcon: Icon(
                  Icons.work,
                ),
                suffixIcon: Icon(
                  Icons.delete_outline,
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password *',
              prefixIcon: Icon(
                Icons.password,
              ),
              suffixIcon: Icon(
                Icons.delete_outline,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm password *',
              hintText: 'Repead your password',
              prefixIcon: Icon(
                Icons.password_sharp,
              ),
              suffixIcon: Icon(
                Icons.delete_outline,
              ),
            ),
          ),
          SizedBox(
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
