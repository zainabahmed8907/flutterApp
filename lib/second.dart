import 'package:flutter/material.dart';

import 'package:project1/pAGE/homepage.dart';
import 'package:project1/utils/constants.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Members login'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("LoggedIn", false);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "meezan bank.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Username",
                                hintText: "Enter email or username"),
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "password",
                                hintText: "Enter password"),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                Constants.prefs.setBool("loggedin", true);
                                Navigator.pushReplacementNamed(
                                    context, Home.routeName);
                              },
                              color: Colors.green[800],
                              child: Text('Sign In'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
