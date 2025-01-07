import 'package:flutter/material.dart';
import 'package:loginvalidation/core/color/pallette.dart';
import 'package:loginvalidation/core/constants/assets_path.dart';
import 'package:loginvalidation/core/customs_widgets/rect_btn.dart';
import 'package:loginvalidation/ui/login_page.dart';
import 'package:loginvalidation/ui/signup_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AssetsPath.welcomeImage),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "  Discover Your\nDream Job here",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Pallette.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    " Explore all the existing job roles based on your",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "interest and study major",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              RectBtn(
                text: "Login",
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Pallette.primary),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
