// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({ Key? key }) : super(key: key);

  @override
  _GenderSelectionPageState createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Select your Gender"),
    );
  }
}