import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class homepage extends StatelessWidget {
   homepage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void sigenout(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
     return
    SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              // profile pic and name and notifications
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.person_4,color: Theme.of(context).colorScheme.inversePrimary,),
                  ),
                  Text('NAme'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.notifications,color: Theme.of(context).colorScheme.inversePrimary,),
                      ),
                    ],
                  )
                ],
              ),
              //heatmap





              //line
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              //today's missions




            ],
          ),
        ),
    );
  }
}
