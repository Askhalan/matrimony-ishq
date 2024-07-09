import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
   Temp({super.key});
final fir = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(fir.currentUser!.uid),
      ),
    );
  }
}



// NlrHa4q1SSZ4FNpP0vsw4mFqTsD2