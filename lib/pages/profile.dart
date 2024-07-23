import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class profile extends StatelessWidget {
   profile({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void sigenout(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //profile pic
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              child: Icon(Icons.person_4,color: Theme.of(context).colorScheme.inversePrimary,),
            ),
            //name
            const Text('name'),
            //habits and dayes and score
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('habites'),
                    Text('1'),
                  ],
                ),
                Column(
                  children: [
                    Text('dayes'),
                    Text('1'),
                  ],
                ),
                Column(
                  children: [
                    Text('score'),
                    Text('100'),
                  ],
                )
              ],
            ),
            //the line
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            //settins
            Container(
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Settings'),
                Icon(Icons.settings)
              ],
              ),
            ),
            //trophy
            Container(
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Trophy'),
                Icon(Icons.military_tech)
              ],
              ),
            ),
            //logeoute
            Container(
              child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Loge out'),
                Icon(Icons.logout)
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
