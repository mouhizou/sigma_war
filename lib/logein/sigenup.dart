import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_servise.dart';

class signeup extends StatefulWidget {
  final Function()? onTap;
  const signeup({super.key, required this.onTap});

  @override
  State<signeup> createState() => _signeupState();
}
class _signeupState extends State<signeup> {
  final confirmController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool dontshowpassword1 = true;
  bool dontshowpassword2 = true;
  String _emailPrefix = '';
  void extractEmailPrefix() {
    String email = emailController.text.trim();
    int atIndex = email.indexOf('@');
    if (atIndex != -1) {
      setState(() {
        _emailPrefix = email.substring(0, atIndex);
      });
    } else {
      setState(() {
        _emailPrefix = 'Invalid Email';
      });
    }
  }
  void signupuser()async{
    showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
    try{
      if(passwordController.text == confirmController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        extractEmailPrefix();
        FirebaseFirestore.instance.collection('User').add(
            {
              'User Email' : emailController.text,
              'Name': _emailPrefix,
              'Groups': [],
              'Score': 10,
              'User Pic': [],
              'Challenges':[],
            }
        );
        Navigator.pop(context);
      }else{
        Navigator.pop(context);
        passwordController.clear();
        confirmController.clear();
        showDialog(
            context: context,
            builder: (context){
              return const AlertDialog(
                title: Text('the confirmation is wronge!'),
              );
            }
        );
      }

    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      emailController.clear();
      passwordController.clear();
      confirmController.clear();
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text(e.code),
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Center(child: Image.asset('lib/images/logotrans.png',height: 150,width: 150,color: Theme.of(context).colorScheme.inversePrimary),),
              //name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12.5),
                child: TextField(
                  controller: emailController,
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
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
                  ),
                ),
              ),

              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12.5),
                child: TextField(
                  controller: passwordController,
                  obscureText: dontshowpassword1,
                  decoration: InputDecoration(
                      suffixIcon:  Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.5),
                        child: dontshowpassword1 ?IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword1 = !dontshowpassword1;
                              });
                            },
                            icon: const Icon(Icons.visibility)
                        )
                            :IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword1 = !dontshowpassword1;
                              });
                            },
                            icon: const Icon(Icons.visibility_off)
                        ),
                      ),

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
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
                  ),
                ),
              ),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12.5),
                child: TextField(
                  controller: confirmController,
                  obscureText: dontshowpassword2 ,
                  decoration: InputDecoration(
                      suffixIcon:  Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.5),
                        child: dontshowpassword2 ?IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword2 = !dontshowpassword2;
                              });
                            },
                            icon: const Icon(Icons.visibility)
                        )
                            :IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword2 = !dontshowpassword2;
                              });
                            },
                            icon: const Icon(Icons.visibility_off)
                        ),
                      ),

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
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
                  ),
                ),
              ),

              // sigen  up

              GestureDetector(
                onTap: signupuser,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Theme.of(context).colorScheme.tertiary)
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // signe in withe text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Signe up with',
                        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // google option and apple
              Padding(
                padding: const EdgeInsets.all(12.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    GestureDetector(
                      onTap: () => AuthService().signinwithgoogle(),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Image.asset(
                          'lib/images/google.png',
                          height: 40,
                        ),
                      ),
                    ),

                    const SizedBox(width: 25),

                    // apple button
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Image.asset(
                        'lib/images/apple.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),

              //allrady a meber
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alredy a  member?',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap:  widget.onTap ,
                    child: Text(
                      'Sigen in now!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
