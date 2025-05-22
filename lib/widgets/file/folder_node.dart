import 'package:flutter/material.dart';
import 'package:holo/widgets/file/file.util.dart';
class FolderNodeWidget extends StatefulWidget {
  final String name;
  final List<FileNode> files;
  const FolderNodeWidget({super.key, required this.name, required this.files});

  @override
  State<FolderNodeWidget> createState() => _FolderNodeWidgetState();
}



class _FolderNodeWidgetState extends State<FolderNodeWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(isExpanded ? Icons.folder_open : Icons.folder, color: const Color.fromARGB(255, 201, 20, 147), size: 16,),
              SizedBox(width: 4.0,),
              Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.left,),
            ],
          ),
        ),
        if (isExpanded) Container(
          margin: EdgeInsets.only(left: 10), 
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.files.map((file) => file.widget).toList(),
            ),
        ),
        ]
    );
  }
}