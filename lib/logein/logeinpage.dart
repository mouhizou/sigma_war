import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sigma_wor/logein/auth_servise.dart';

class logeinpage extends StatefulWidget {
  final Function()? onTap;
logeinpage({super.key, required this.onTap });

  @override
  State<logeinpage> createState() => _logeinpageState();
}

class _logeinpageState extends State<logeinpage> {
  final emailController = TextEditingController();
  bool dontshowpassword = true;

  final passwordController = TextEditingController();
  void invalid(){
    Navigator.pop(context);
    emailController.clear();
    passwordController.clear();
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('retry againe'),
          );
        }
    );
  }

   void signUserIn() async{
     showDialog(
         context: context,
         builder: (context){
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
     );
     try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailController.text,
           password: passwordController.text
       );
       Navigator.pop(context);
     }on FirebaseAuthException catch (e) {
       Navigator.pop(context);
       emailController.clear();
       passwordController.clear();
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Center(child: Image.asset('lib/images/logotrans.png',height: 200,width: 200,color: Theme.of(context).colorScheme.inversePrimary),),
              //welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                ),
              ),
              //username
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
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
                  ),
                ),
              ),
              //passworde
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12.5),
                child: TextField(
                  controller: passwordController,
                  obscureText: dontshowpassword ,
                  decoration: InputDecoration(
                      suffixIcon:  Padding(
                        padding: EdgeInsetsDirectional.only(end: 12.5),
                        child: dontshowpassword ?IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword = !dontshowpassword;
                              });
                            },
                            icon: Icon(Icons.visibility)
                        )
                            :IconButton(
                            onPressed: (){
                              setState(() {
                                dontshowpassword = !dontshowpassword;
                              });
                            },
                            icon: Icon(Icons.visibility_off)
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
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                ),
              ),
              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
              //enter
              GestureDetector(
                onTap: signUserIn,
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
                        "Sign In",
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
                padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                        'Or continue with',
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
                        padding: EdgeInsets.all(20),
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

                    SizedBox(width: 25),

                    // apple button
                    Container(
                      padding: EdgeInsets.all(20),
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
              //signe up text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
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
