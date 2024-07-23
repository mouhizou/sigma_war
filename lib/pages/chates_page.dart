import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/component/goupechate_tail.dart';
class chatsgroup extends StatelessWidget {
  const chatsgroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          Icon(Icons.arrow_back_outlined),
          Row(
            children: [
              //profile pic
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.person_4,color: Theme.of(context).colorScheme.inversePrimary,),
              ),
              //searche bare

            ],
          ),
          //chates text
          Text('CHATS'),
            //liste of chat tail's
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('User Chats').orderBy('Last Message Time',descending: false).snapshots(),
              builder: (context , snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        final group = snapshot.data!.docs[index];
                          return groupechatetaile();
                      }
                  );
                }else if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
         ],
        ),
      ),
    );
  }
}
