// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groapp/user_model.dart';
// import 'package:get/get.dart';
// import 'package:groapp/user_model.dart';
// import 'package:groapp/database.dart';
// import 'package:random_string/random_string.dart';
import 'my_button.dart';
import 'text_field.dart';
import 'sq_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordContoller = TextEditingController();

  final nameController = TextEditingController();

  final PhController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmpasswordContoller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text.toString(),
            password: passwordController.text.toString());

        // final user = UserDetail(
        //     email: usernameController.text.trim(),
        //     fullname: nameController.text.trim(),
        //     mobileno: PhController.text.trim());
        // Future addUserDetail(nameController.text,usernameController.text,int.parse(PhController.text.trim())) async{
        // FirebaseFirestore.instance.collection("users").doc(user?.).set({
        //   "full name" : nameController.text.trim(),
        //   "Email Id": usernameController.text.trim(),
        //   "mobile no.": int.parse(PhController.text.trim())
        // },);

        addUserDetail(
          nameController.text.toString(),
          usernameController.text.toString(),
          int.parse(PhController.text.toString()),
        );
      } else {
        wrongPasswordMessage();
      }
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      if (e.code == ' user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  Future addUserDetail(String fullname, String email, int phno) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({"full name": fullname, "email id": email, "mobile no": phno});
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email', style: TextStyle(color: Colors.white)),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title:
              Text('Incorrect Password', style: TextStyle(color: Colors.white)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                const Text(
                  'Lets\'s create an account for you',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email-Id',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                // confirm password
                MyTextField(
                  controller: confirmpasswordContoller,
                  hintText: 'Comfirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: PhController,
                  hintText: 'Mobile No.',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
