import 'package:flutter/material.dart';
import 'package:pivo/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthMaterialState();
}

class _AuthMaterialState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textstyle = const TextStyle(
        fontSize: 16, color: Colors.brown, fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 50),
          Text(
            'Изучай марихуану и пиво, а также делись понравившимся. Для персональных рекомендаций вам необходимо войти в свой аккаунт. Если у вас нет аккаунта, то зарегестрируйтесь - это бесплатно и просто.',
            style: textstyle,
          ),
          SizedBox(height: 5),
          ElevatedButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Register')),
          SizedBox(height: 25),
          Text(
            'Если вы зарегистрировались, но не помните свой email, перейдите сюда для получения письма.',
            style: textstyle,
          ),
          SizedBox(height: 5),
          ElevatedButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Verification email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextConroller = TextEditingController();
  final _passwordTextConroller = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginTextConroller.text;
    final password = _loginTextConroller.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {}
  @override
  Widget build(BuildContext context) {
    final color = Color.fromARGB(255, 255, 166, 49);
    final textStyle = const TextStyle(
        fontSize: 16, color: Colors.brown, fontWeight: FontWeight.bold);
    final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          SizedBox(height: 20),
        ],
        Text('Username', style: textStyle),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextConroller,
          decoration: textFieldDecorator,
        ),
        SizedBox(height: 20),
        Text('Password', style: textStyle),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextConroller,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            TextButton(
              onPressed: _auth,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
              child: Text(
                'Login',
              ),
            ),
            SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: Text('Reset password'),
            )
          ],
        )
      ],
    );
  }
}
