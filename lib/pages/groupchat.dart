import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/component/mywaalpost.dart';
import 'package:sigma_wor/component/waal_post.dart';
class groupchat extends StatefulWidget {
  const groupchat({super.key});

  @override
  State<groupchat> createState() => _groupchatState();
}

class _groupchatState extends State<groupchat> {
  final user = FirebaseAuth.instance.currentUser!;
  final mesegcontroler = TextEditingController();
  void sendmesage(){
    if(mesegcontroler.text.isNotEmpty){
      FirebaseFirestore.instance.collection('User Posts').add(
          {
            'User Email' : user.email,
            'Message' : mesegcontroler.text,
            'Timestamp' : Timestamp.now(),
            'Likes':[]
          }
      );
    }
    setState(() {
      mesegcontroler.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            //up bare of the chat
            Container(
              child: Row(
                children: [
                  //bach butten
                  IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_outlined)),

                  //group photo
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.person_4,color: Theme.of(context).colorScheme.inversePrimary,),
                  ),

                  //group name
                  const Text('name'),

                  //settingsbuten
                  IconButton(onPressed: (){}, icon:const Icon(Icons.settings))
                ],
              ),
            ),
            //the chat
            Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('User Posts').orderBy('Timestamp',descending: false).snapshots(),
                  builder: (context , snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            final post = snapshot.data!.docs[index];
                            if(user.email == post['User Email']){
                              return mywallpost(
                                emailname: post['User Email'],
                                mesaage: post['Message'],
                                time: post['Timestamp'],
                                likes: List<String>.from(post['Likes'] ?? []),
                                postId: post.id,);
                            }else{
                              return wallpost(
                                emailname: post['User Email'],
                                mesaage: post['Message'],
                                time: post['Timestamp'],
                                likes:List<String>.from(post['Likes'] ?? []) ,
                                postId: post.id,);
                            }
                          }
                      );
                    }else if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
            ),
            //the text feild for the messages
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mesegcontroler,
                      obscureText: false ,
                      decoration: InputDecoration(

                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: sendmesage,
                      icon: const Icon(Icons.arrow_forward_ios)
                  )
                ],
              ),
            ),
            Text(user.email!),
          ]
        ),
      ),
    );
  }
}
