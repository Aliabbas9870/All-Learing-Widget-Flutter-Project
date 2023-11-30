import 'package:alllearingwidget/learning_components/HelpForLearnCode.dart';
import 'package:alllearingwidget/learning_components/Swipe.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Learing Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 209, 207, 211)),
        useMaterial3: true,
        primaryColor:Color.fromARGB(255, 207, 210, 212),
        primarySwatch:Colors.grey
      ),
      home:  Swape(),
    );
  }
}
