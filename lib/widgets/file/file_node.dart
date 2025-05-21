import 'package:flutter/material.dart';
class FileNodeWidget extends StatefulWidget {
  final String name;
  final int? icon;
  const FileNodeWidget({super.key, required this.name, required this.icon});

  @override
  State<FileNodeWidget> createState() => _FileNodeWidgetState();
}

class _FileNodeWidgetState extends State<FileNodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon != null ? 
        Icon( IconData(widget.icon ?? 0xea36, fontFamily: 'Devicon'), color: Colors.white,):  
        Icon(Icons.format_align_left_outlined)
        ,Text(widget.name , style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
      ],
    );
  }
}