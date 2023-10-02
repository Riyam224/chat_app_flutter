import 'package:chatt_app/constants.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/widgets/custom_button.dart';
import 'package:chatt_app/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
// todo the id
  static String id = 'registerPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            SizedBox(
              height: 84,
            ),
            Image.asset(
              'assets/images/scholar.png',
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chat App',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Email',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: 'Password'),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Register',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // todo pushnamed
                    // Navigator.pushNamed(context, "LoginPage");
                    // todo
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}