
//firebase-firestore database cha code ahe

import 'package:eventapp/controller/auth_controller.dart';
import 'package:eventapp/firebase_options.dart';
import 'package:eventapp/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  // Get.put(AuthController());
  Get.lazyPut(()=>AuthController());
  return runApp( const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp (
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
    );
  }
}

// commit







