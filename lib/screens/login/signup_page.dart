import 'package:flutter/material.dart';
import 'package:ui_pizza_party/constants/color.dart';
import 'package:ui_pizza_party/screens/login/login_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: kBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: 200,
                  width: 200,
                ),
                _usernameField(),
                SizedBox(
                  height: 10,
                ),
                _passwordField(),
                SizedBox(
                  height: 10,
                ),
                _confirmPasswordField(),
                SizedBox(
                  height: 30,
                ),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: TextField(
        enabled: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "Username",
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "Password",
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          String text = "";
          text = "Sign Up Success";
          Navigator.pushNamed(context, '/signupsuccess');
          SnackBar snackBar = SnackBar(content: Text(text));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "Confirm Password",
        ),
      ),
    );
  }
}
