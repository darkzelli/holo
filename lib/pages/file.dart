import 'package:flutter/material.dart';
import 'package:holo/utils/holo.manager.dart';
import 'package:holo/widgets/file/file_tree.dart';
class File extends StatefulWidget {
  const File({super.key});

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
  late String currentDirectory;


  @override
  void initState(){
    super.initState();
    currentDirectory = HoloManger.currentDirectory;
    
  }
  @override
  Widget build(BuildContext context) {
    return FileTreeWidget();
  }
}