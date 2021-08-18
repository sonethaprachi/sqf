import 'package:flutter/material.dart';
import 'package:sqf/screens/note.details.dart';
import 'package:sqf/screens/note.list.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notekeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
       home: notelist(),
    );  
  }
}