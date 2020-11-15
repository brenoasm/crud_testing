import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Welcome to our app',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: controller.onEmailChanged,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                onChanged: controller.onPasswordChanged,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(
                    Icons.vpn_key,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Observer(
                builder: (_) {
                  return RaisedButton(
                    onPressed:
                        controller.isSubmitEnabled ? controller.onSubmit : null,
                    child: Text(
                      'Sign In',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
