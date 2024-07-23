import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/pages/homepage.dart';
import 'package:sigma_wor/logein/regestrorlogein.dart';
class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot) {
          if (snapshot.hasData){
            return homepage();
          }else{
            return const regestrorlogein();
          }
        },
      ),
    );
  }
}
