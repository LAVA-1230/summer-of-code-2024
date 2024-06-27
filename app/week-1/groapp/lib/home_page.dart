import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'my_button.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void billuser() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.local_grocery_store,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: billuser, text: "Bill recipt"),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: billuser, text: "Previous Bill recipt"),
          ],
        ),
      ),
    );
  }
}
