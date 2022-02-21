import 'package:flutter/material.dart';

enum AuthMode { SignUp, Login }

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthMode _authMode = AuthMode.Login;

  final _passwordController = TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 8.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: deviceSize.width * 0.75,
        height: 320,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Informe um E-mail válido!';
                  }
                  return null;
                },
                onSaved: (value) => _authData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length > 5) {
                    return 'Informe uma senha válida!';
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value!,
              ),
              if (_authMode == AuthMode.SignUp)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: _authMode == AuthMode.SignUp
                      ? (value) {
                          if (value!.isEmpty ||
                              value != _passwordController.text) {
                            return 'Informe uma senha válida!';
                          }
                          return null;
                        }
                      : null,
                  onSaved: (value) => _authData['password'] = value!,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal: 30)),
                  onPressed: _submit,
                  child: Text(
                      _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR'))
            ],
          ),
        ),
      ),
    );
  }
}
