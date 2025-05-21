import 'package:flutter/material.dart';
import 'package:holo/widgets/file/file.util.dart';
class FolderNodeWidget extends StatefulWidget {
  final String name;
  final List<FileNode> files;
  final double offset;
  const FolderNodeWidget({super.key, required this.name, required this.files, required this.offset});

  @override
  State<FolderNodeWidget> createState() => _FolderNodeWidgetState();
}



class _FolderNodeWidgetState extends State<FolderNodeWidget> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.expand_more, color: Colors.white,),
            Text(widget.name + widget.offset.toString(), style: TextStyle(color: Colors.white), textAlign: TextAlign.left,),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: widget.offset * 2), 
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.files.map((file) => file.widget).toList(),
            ),
        ),
        ]
    );
  }
}