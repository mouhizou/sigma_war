import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/component/like_butten.dart';
class mywallpost extends StatefulWidget {
  final String mesaage;
  final String emailname;
  final Timestamp time;
  final List<String>likes;
  final String postId;
   mywallpost({super.key,required this.emailname,required this.time,required this.mesaage,required this.postId,required this.likes});

  @override
  State<mywallpost> createState() => _mywallpostState();
}

class _mywallpostState extends State<mywallpost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isliked = widget.likes.contains(user.email);
  }
  final user = FirebaseAuth.instance.currentUser!;
  bool isliked = false;
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
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.only(top: 25,right: 25,left: 25),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          //like butten
          Column(
            children: [
              //icone
              like_butten(isLiked: isliked , onTap: likepost),
              //number
              Text(widget.likes.length.toString(),style: TextStyle(color: Theme.of(context).colorScheme.background),)
            ],
          ),
          //the message and email of the sender
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.mesaage,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                Text(widget.emailname,style: TextStyle(color: Theme.of(context).colorScheme.background),),
                Text(widget.time.toDate().hour.toString()+':'+widget.time.toDate().minute.toString(),style: TextStyle(color: Theme.of(context).colorScheme.background),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
