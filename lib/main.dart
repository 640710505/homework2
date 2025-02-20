import 'package:flutter/material.dart';
import 'model/aqi.dart';
import 'docker_fordart/trydocker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'model/firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     runApp(const MyApp());
//   } catch (e) {
//     debugPrint("Firebase Initialization Error: $e");
//   }
// }
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      // home: const GreetingWidget(name: '640710505 Chonlachat Buangam'));
      home: const DockerApi(),
    );
  }
}


