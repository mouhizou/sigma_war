import 'package:flutter/material.dart';
import 'package:sigma_wor/logein/logeinpage.dart';
import 'package:sigma_wor/logein/sigenup.dart';
class regestrorlogein extends StatefulWidget {
  const regestrorlogein({super.key});

  @override
  State<regestrorlogein> createState() => _regestrorlogeinState();
}

class _regestrorlogeinState extends State<regestrorlogein> {
  bool showelogeinpage = true;
  void changepage(){
    setState(() {
      showelogeinpage = !showelogeinpage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showelogeinpage){
     return logeinpage(onTap: changepage,);
   }else{
     return signeup(onTap: changepage,);
   }
  }
}
