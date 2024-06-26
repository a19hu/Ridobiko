import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Otherpage extends StatefulWidget {
  var text;
  Otherpage({Key ? key,this.text}) :super(key:key);
   
  @override
  State<Otherpage> createState() => _OtherpageState();
}

class _OtherpageState extends State<Otherpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 
    Center(
      child: Text(widget.text),
    )
    );
  }
}