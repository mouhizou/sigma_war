import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_wor/pages/auth_page.dart';
import 'package:sigma_wor/theme/themeprov.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> themeprov(),)

  ],child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<themeprov>(context).themeData,
      home: const authpage(),
    );
  }
}