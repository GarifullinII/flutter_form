import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePassTop = true;
  bool _hidePassBot = true;

  final _formKey =
      GlobalKey<FormState>(); // FormState - встроенный класс для работы с Form

  final _scaffoldKey = GlobalKey<
      ScaffoldState>(); // глобальный ключ для реализации метода SnackBar

  final _nameController =
      TextEditingController(); // предоставляю доступ к значению внутри текстового поля (+управление значениями)
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _lifeController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  List<String> _countries = [
    'UAE',
    'Montenegro',
    'England',
    'Cuba',
    'Vietnam',
    'Spain',
    'Tunisia',
    'Czech Republic'
  ];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    // после создания требуется очистить _nameController (после удаления TextEditingController())
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _lifeController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus(); // расфокусирую текстовое поле
    FocusScope.of(context)
        .requestFocus(nextFocus); // передача фокуса другому фокусу
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register form'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey, // передаю глобальный ключ
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              TextFormField(
                focusNode: _nameFocus,
                autofocus: true,
                onFieldSubmitted: (_) {
                  _fieldFocusChange(context, _nameFocus, _phoneFocus);
                },
                controller:
                    _nameController, // передаю в TextField контроллер для считывания текста
                decoration: InputDecoration(
                  labelText: 'Full name *',
                  hintText: 'Introduce youreself', // скрытый текст
                  prefixIcon: Icon(
                    Icons.person,
                  ), // префиксная иконка
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red, // цвет для корзины
                    ),
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
                validator: _validateName,
                // validator: (val) => val!.isEmpty ? 'Name is required' : null,
                // добавляю валидатор, проверяю поле на заполняемость, если поле пустое val!.isEmpty, то возвращаю текст, что надо ввести данные
                // чтобы валидация выполнилась необходимо у Form реализовать параметр key
              ),
              SizedBox(
                // создаем отступ между полями
                height: 10.0,
              ),
              TextFormField(
                focusNode: _phoneFocus,
                onFieldSubmitted: (_) {
                  _fieldFocusChange(context, _phoneFocus, _passwordFocus);
                },
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone number *',
                  hintText: 'Add your phone number',
                  helperText: 'Phone number: (XXX)XXX-XX-XX',
                  prefixIcon: Icon(
                    Icons.person,
                  ), // префиксная иконка
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _phoneController.clear();
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red, // цвет для корзины
                    ),
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
                  FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                      allow: true),
                  // FilteringTextInputFormatter.digitsOnly,
                ], // ввод только цифр
                validator: (value) => _validatePhoneNumber(value!)
                    ? null
                    : 'Phone number must be entered as (###)###-##-##',
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
                validator: _validateEmail,
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: 'Country?',
                ),
                items: _countries.map((country) {
                  return DropdownMenuItem(
                    child: Text(country),
                    value: country,
                  );
                }).toList(),
                onChanged: (data) {
                  print(data);
                  setState(() {
                    _selectedCountry = data as String;
                  });
                },
                value: _selectedCountry,
                validator: (val) {
                  return val == null ? 'Please select a country' : null;
                },
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
                inputFormatters: [
                  // валидация - проверка длины строки
                  LengthLimitingTextInputFormatter(100),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                focusNode: _passwordFocus,
                controller: _passController,
                validator: _validatePassword,
                obscureText: _hidePassTop, // скрываю вводимый пароль
                maxLength: 9,
                decoration: InputDecoration(
                  labelText: 'Password *',
                  prefixIcon: Icon(
                    Icons.security,
                  ), // префиксная иконка
                  suffixIcon: IconButton(
                    icon: Icon(
                      // когда изменилось значение на противоположное меняем и иконку
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
                validator: _validatePassword,
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
    // через _formKey обращаемся к state и проверяем проходит ли проверку поля ввода, если есть функции в поях в значении validator
    // если в полях нет ошибок, то будет true и выведем сообщение 'Form is valid' те все методы проверки должны вернуть значение null
    if (_formKey.currentState!.validate()) {
      // если прошла валидацию, то сохраняем данные в state
      _formKey.currentState?.save();
      _showDialog(
          name: _nameController
              .text); // когда форма заполнена отображаю диалоговое окно, в качестве параметра ввожу имя, которое ввел пользователь
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Country: ${_selectedCountry}');
      print('Story: ${_lifeController.text}');
    } else {
      _showMessage(
          message:
              'Form is not valid! Please review and correct!'); // метод о не валидности формы
    }
  }

  String? _validateName(value) {
    // принимает value из валидатора
    final _nameExp = RegExp(
        r'^[A-Za-z ]+$'); // вводим регулярное выражение, чтобы пользователь мог только ввести символы A-Za-z
    if (value.isEmpty) {
      return 'Name is required';
    } else if (!_nameExp.hasMatch(value)) {
      // если введен текст не такой, как задали в регулярном выражении, то вывожу 'Please enter correct full name'
      return 'Please enter only letters';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\-\d\d$');
    return _phoneExp.hasMatch(input);
  }

  String? _validateEmail(value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(value) {
    if (_passController.text.length != 9) {
      return '9 character required for password';
    } else if (_confirmController.text != _passController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  // void _showMessage({required String message}) { // метод невалидности формы
  //   _scaffoldKey.currentState?.showSnackBar(
  //     SnackBar(
  //       duration: Duration(
  //         seconds: 5, // время отображения всплывающего уведомления
  //       ),
  //       backgroundColor: Colors.red,
  //       content: Text(
  //         message,
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.w600,
  //           fontSize: 18.0,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showDialog({required String name}) {
    // метод ничего не возрващает, принимает String name
    showDialog(
      // метод имеет контекст
      context: context,
      builder: (context) {
        // метод принимает context, возвращает AlertDialog
        return AlertDialog(
          title: Text(
            // задаю title
            'Registration successful',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: Text(
            // параметр content
            '$name is now a verified register form',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            // реализую кнопку в параметре actions
            TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); // при нажатии на кнопку6 возвращаюсь на мою форму
                },
                child: Text(
                  // название кнопки
                  'verifiend',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18.0,
                  ),
                )),
          ],
        );
      },
    );
  }
}
