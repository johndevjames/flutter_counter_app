import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  init();
  runApp(Main());
}
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => Firebase.app());
}
class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Flutter Counter'),
    );
  }
}

