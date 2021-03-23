import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:rdsdms/services/account.services.dart';
import 'package:rdsdms/views/tab/tab.widget.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  createState() => LoginState();
}

class LoginState extends State<Login> {
  String username;
  String password;
  String token;

  Future<String> login() async {
    token = await AccountService.login(username, password);
    Get.to(Tabs());
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: true,
            body: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.pink[100], width: 0.5)),
                    labelText: 'username',
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.pink[100], width: 0.5)),
                    labelText: 'password',
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RaisedButton(
                  splashColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.grey)),
                  color: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    // print(username);
                    // print(password);
                    login();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            )));
  }
}
