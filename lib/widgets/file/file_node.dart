import 'package:flutter/material.dart';
import 'package:holo/utils/holo.manager.dart';
import 'package:holo/widgets/file/file.util.dart';
class FileNodeWidget extends StatefulWidget {
  final String name;
  final FileNode fileNode;
  const FileNodeWidget({super.key, required this.name, required this.fileNode});

  @override
  State<FileNodeWidget> createState() => _FileNodeWidgetState();
}

class _FileNodeWidgetState extends State<FileNodeWidget> {
  late int? ext;
  @override
  void initState(){
    super.initState();
    String extention = widget.name.split('.').last;
    ext = FileUtils.fileIconMap[extention];
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable:  HoloManger.selectedFile,
      builder: (BuildContext context, dynamic value, Widget? child) {
        bool selected = value == widget.name;
        return GestureDetector(
          onDoubleTap: () => setState(() {
            HoloManger.updateSelectedFile(widget.name);
          }),
          child: Row(
            children: [
              ext != null ? Icon(IconData(ext!, fontFamily: "Devicon"), color: Colors.white, size: 16) : Icon(Icons.align_horizontal_left, color: Colors.white, size: 16,),
              SizedBox(width: 5),
              Text(widget.name , style: TextStyle(color: selected ? Colors.deepPurpleAccent : Colors.white), textAlign: TextAlign.left,),
            ],
          ),
        );
      },
    );
    
    
    
    
  }
}