import 'package:flutter/material.dart';
import 'package:ui_pizza_party/constants/color.dart';
import 'package:ui_pizza_party/screens/home/home.dart';
import 'package:ui_pizza_party/screens/login/signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                  height: 30,
                ),
                _loginButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Text("SignUp"),
                    )
                  ],
                )
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
        controller: _usernameController,
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
        controller: _passwordController,
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
          String user = _usernameController.text;
          String pass = _passwordController.text;
          if (user == "admin" && pass == "admin") {
            text = "Login Success";
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/loginsuccess', (Route<dynamic> route) => false);
          } else {
            text = "Login Failed";
          }
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
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
