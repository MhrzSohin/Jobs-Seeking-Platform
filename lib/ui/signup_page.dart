import 'package:flutter/material.dart';
import 'package:loginvalidation/core/color/pallette.dart';
import 'package:loginvalidation/core/customs_widgets/rect_btn.dart';
import 'package:loginvalidation/core/customs_widgets/text_form_component.dart';
import 'package:loginvalidation/core/customs_widgets/text_heading.dart';
import 'package:loginvalidation/ui/dashboard.dart';
import 'package:loginvalidation/ui/login_page.dart';
import 'package:loginvalidation/ui/signup_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void _loginSuccess() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(SnackBar(
        content: Text("Signup Successfully"),
        backgroundColor: Colors.green[300],
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                Textheading(title: "Create Account"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Create an account so you can explore all the",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "existing jobs",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormComponent(
                    labelStringEmail: "Email",
                    hintForTextEmail: "Enter Your Email",
                    labelStringPassword: "Password",
                    hintForTextPassword: "Enter Your Password"),
                // const SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter your password';
                      } else if ((value.toString().length < 8)) {
                        return 'Password must have 8 characters';
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Pallette.textFormfeilBackground,
                      hintText: "Re-Enter Your Password",
                      labelText: "Confirm Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Pallette.primary),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Already have an account",
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
