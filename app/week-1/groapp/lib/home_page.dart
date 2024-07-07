import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groapp/user_profile.dart';
import 'my_button.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref('users');

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
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
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
              "Welcome : " + user!.email.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: billuser, text: "Bill recipt"),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: billuser, text: "Previous Bill recipt"),
            StreamBuilder(
                stream: ref.child(user!.uid.toString()).onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          title: Text(map['full name']),
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Something Went Wrong",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
