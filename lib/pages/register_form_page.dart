import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePassTop = true;
  bool _hidePassBot = true;

  final _nameController =
      TextEditingController(); // предоставляю доступ к значению внутри текстового поля (+управление значениями)
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _lifeController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    // после создания требуется очистить _nameController (после удаления TextEditingController())
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _lifeController.dispose();
    _passController.dispose();
    _confirmController.dispose();

    super.dispose();
  }

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
            controller:
                _nameController, // передаю в TextField контроллер для считывания текста
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
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone number *',
              hintText: 'Add your phone number',
              helperText: 'Phone number: (XXX)XXX-XX-XX',
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
            keyboardType:
                TextInputType.phone, // задаю тип клавиатуры - цифровую
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ], // ввод только цифр
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _emailController,
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
            keyboardType:
                TextInputType.emailAddress, // задаю текстовую клавиатуру
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _lifeController,
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
            inputFormatters: [ // валидация - проверка длины строки
              LengthLimitingTextInputFormatter(100), 
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passController,
            obscureText: _hidePassTop, // скрываю вводимый пароль
            maxLength: 9,
            decoration: InputDecoration(
              labelText: 'Password *',
              prefixIcon: Icon(
                Icons.security,
              ), // префиксная иконка
              suffixIcon: IconButton(
                icon: Icon( // когда изменилось значение на противоположное меняем и иконку
                  _hidePassTop ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  // добавляю setState для изменения состояния иконки глаз, при нажатии меняю на противоположное
                  setState(() {
                    _hidePassTop = !_hidePassTop;
                  });
                },
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
            controller: _confirmController,
            obscureText: _hidePassBot, // скрываю вводимый пароль
            maxLength: 9,
            decoration: InputDecoration(
              labelText: 'Confirm password *',
              hintText: 'Repead your password',
              prefixIcon: Icon(
                Icons.security,
              ), // префиксная иконка
              suffixIcon: IconButton(
                icon: Icon(
                  _hidePassBot ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _hidePassBot = !_hidePassBot;
                  });
                },
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
            onPressed: _submitForm,
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

  void _submitForm() {
    print('Name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('Email: ${_emailController.text}');
    print('Story: ${_lifeController.text}');
  }
}
