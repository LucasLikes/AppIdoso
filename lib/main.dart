import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'src/welcome.dart';
import 'utils/font_size_provider.dart';

void main() {
  runApp(ElderlyApp());
}

class ElderlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FontSizeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App para Idosos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
