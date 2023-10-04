import 'package:chatt_app/constants.dart';
import 'package:chatt_app/helper/show_snack_bar.dart';
import 'package:chatt_app/pages/chat_page.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/widgets/custom_button.dart';
import 'package:chatt_app/pages/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
// todo the id
  static String id = 'register page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> FormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
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
                      isLoading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id);
                        showSnackBar(context, 'success');
                      } on FirebaseAuth catch (ex) {
                        if (ex == 'weak-password') {
                          showSnackBar(context, 'weak password');
                        } else if (ex == 'email-already-in-use') {
                          showSnackBar(context, 'email already in use');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'there was an error ');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
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
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
