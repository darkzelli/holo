import 'dart:io';

import 'package:flutter/material.dart';
import 'package:holo/utils/holo.manager.dart';
import 'package:holo/utils/stack.util.dart';
import 'package:holo/widgets/file/file.util.dart';

class FileTreeWidget extends StatefulWidget {
  const FileTreeWidget({super.key});

  @override
  State<FileTreeWidget> createState() => _FileTreeWidgetState();
}

class _FileTreeWidgetState extends State<FileTreeWidget> {

  Future<FolderNode> traverseFilesDFS(Directory dir ) async {
    FolderNode root = FolderNode(dir.path.split(Platform.pathSeparator).last);
    HoloStackNode node = HoloStackNode(dir, null);
    HoloStack stack = HoloStack();

    

    stack.push(node);
    while(!stack.isEmpty()){
      HoloStackNode current = stack.pop();

      FileSystemEntity entity = current.firstValue;

      if(entity is Directory){
        FolderNode folder;
        if(current.secondValue == null){
          folder = FolderNode(entity.path.split(Platform.pathSeparator).last);
          root.files.add(folder);
        }else{
          folder = FolderNode(entity.path.split(Platform.pathSeparator).last);
          current.secondValue.files.add(folder);
        }
        for(var subEntity in entity.listSync()){
          stack.push(HoloStackNode(subEntity, folder));
        }
      }else if( entity is File){
        FileNode file;
        if(current.secondValue == null){
          file = FileNode(entity.uri.pathSegments.last);
          root.files.add(file);
        }else{
          file = FileNode(entity.uri.pathSegments.last);
          current.secondValue.files.add(file);
        }
      }
      
    }
    return root;
  }
  Future<FolderNode> generateFileTreeData() async{
    String currentDirectory = HoloManger.currentDirectory;
    Directory directory = Directory(currentDirectory);
    return await traverseFilesDFS(directory);
  }

   late Future<FolderNode> _uiConfig;
  @override
  void initState() {
    super.initState();
    _uiConfig = generateFileTreeData();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 35, left: 15),
      child: SizedBox(
        child: FutureBuilder<FolderNode>(
          future: _uiConfig,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData ) {
              return Center(child: Text('No items found.'));
            } else {
              final nodes = snapshot.data!;
              return ListView(
                children: [
                  nodes.widget
                ],
              );
            }
          },
        ),
      ),
    );
  }
}