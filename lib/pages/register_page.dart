import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/widgets/custom_button.dart';
import 'package:chatt_app/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 50, 106),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/scholar.png'),
            Text(
              'Chat App',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
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
