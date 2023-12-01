import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/Providers/SignupData.dart';
import 'Pages/SignUp.dart';
import 'Pages/WelcomePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider(create: (context) => s1_data()),
        ChangeNotifierProvider(create: (context) => s2_data()),
        ChangeNotifierProvider(create: (context) => s3_data()),
      ],
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Welcome(),
    );
  }
}
