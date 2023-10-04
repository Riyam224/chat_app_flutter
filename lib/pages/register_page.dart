import 'package:chatt_app/constants.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/widgets/custom_button.dart';
import 'package:chatt_app/pages/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
// todo the id
  static String id = 'registerPage';
  String? email;
  String? password;
  GlobalKey<FormState> FormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        // todo
        child: Form(
          key: FormKey,
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
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password'),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () async {
                  if (FormKey.currentState!.validate()) {
  try {
    await registerUser();
  } on FirebaseAuth catch (ex) {
    if (ex == 'weak-password') {
      showSnackBar(context, 'weak password');
    } else if (ex == 'email-already-in-use') {
      showSnackBar(context, 'email already in use');
    }
  } catch (ex) {
    showSnackBar(context, 'there was an error ');
  }
  showSnackBar(context, 'success');
} else {
   
}
                },
                // todo error msg
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
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
