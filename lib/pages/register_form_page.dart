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
                color: Colors.red, // цвет для корзины
              ), // редактирование поля, удаление
              enabledBorder: OutlineInputBorder(
                // включенная граница - появляется, когда нет фокуса на поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // граница фокуса - появляется, когда фокус в поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
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
                Icons.person,
              ), // префиксная иконка
              suffixIcon: Icon(
                Icons.delete_outline,
                color: Colors.red, // цвет для корзины
              ), // редактирование поля, удаление
              enabledBorder: OutlineInputBorder(
                // включенная граница - появляется, когда нет фокуса на поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // граница фокуса - появляется, когда фокус в поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.blue,
                  width: 1.5,
                ),
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
                color: Colors.red,
              ),
              border: OutlineInputBorder(), // квадратная граница
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
                color: Colors.red,
              ),
              border: OutlineInputBorder(),
            ),
            maxLines: 5, // расширяю кол-во вводимых строк в TextFormField
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password *',
              prefixIcon: Icon(
                Icons.security,
              ), // префиксная иконка
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                ),
                onPressed: () {},
                color: Colors.red, // цвет для иконки глаз
              ), // редактирование поля, удаление
              enabledBorder: OutlineInputBorder(
                // включенная граница - появляется, когда нет фокуса на поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // граница фокуса - появляется, когда фокус в поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.blue,
                  width: 1.5,
                ),
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
                Icons.security,
              ), // префиксная иконка
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                ),
                onPressed: () {},
                color: Colors.red, // цвет для иконки глаз
              ), // редактирование поля, удаление // редактирование поля, удаление
              enabledBorder: OutlineInputBorder(
                // включенная граница - появляется, когда нет фокуса на поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // граница фокуса - появляется, когда фокус в поле
                borderRadius: BorderRadius.all(
                  // скругляем границы
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  // цвет рамки и толщина
                  color: Colors.blue,
                  width: 1.5,
                ),
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
