import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/component/like_butten.dart';
class wallpost extends StatefulWidget {
  final String mesaage;
  final String emailname;
  final String postId;
  final List<String> likes;
  final Timestamp time;
  const wallpost({super.key,required this.emailname,required this.mesaage,required this.time,required this.likes,required this.postId});

  @override
  State<wallpost> createState() => _wallpostState();
}

class _wallpostState extends State<wallpost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isliked = widget.likes.contains(user.email);
  }
  final user = FirebaseAuth.instance.currentUser!;
  bool isliked= false;
  void likepost(){
    setState(() {
      isliked =!isliked;
    });

    DocumentReference postref = FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
    if(isliked){
      postref.update({
        'Likes' : FieldValue.arrayUnion([user.email])
      });
    }else{
      postref.update({
        'Likes' : FieldValue.arrayRemove([user.email])
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.only(top: 25,right: 25,left: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //the profile picture of the sender
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).colorScheme.primary),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.person_4,color: Theme.of(context).colorScheme.inversePrimary,),
          ),
          //the message and email of the sender
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.mesaage,style: TextStyle(color: Theme.of(context).colorScheme.background),),
                Text(widget.emailname,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                Text('${widget.time.toDate().hour}:${widget.time.toDate().minute}',style: TextStyle(color: Theme.of(context).colorScheme.primary),)
              ],
            ),
          ),
          Column(
            children: [
              like_butten(isLiked: isliked,onTap:likepost ,),
              Text(widget.likes.length.toString(),style: TextStyle(color: Theme.of(context).colorScheme.background)),
            ],
          ),
        ],
      ),
    );
  }
}
