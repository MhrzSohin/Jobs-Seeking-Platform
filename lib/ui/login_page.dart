import 'package:flutter/material.dart';
import 'package:loginvalidation/core/customs_widgets/rect_btn.dart';
import 'package:loginvalidation/core/customs_widgets/text_form_component.dart';
import 'package:loginvalidation/core/customs_widgets/text_heading.dart';
import 'package:loginvalidation/ui/dashboard.dart';
import 'package:loginvalidation/ui/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void _loginSuccess() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(SnackBar(
        content: Text("Login Successfully"),
        backgroundColor: Colors.green[300],
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textheading(title: "Login here"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome back you've",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "been missed!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormComponent(
                    labelStringEmail: "Email",
                    hintForTextEmail: "Enter Your Email",
                    labelStringPassword: "Password",
                    hintForTextPassword: "Enter Your Password"),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text(
                    "Create a new account",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RectBtn(
                  text: "Login",
                  onPress: _loginSuccess,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
