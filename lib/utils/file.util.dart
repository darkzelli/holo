import 'dart:collection';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:holo/widgets/file/file_node.dart';
import 'package:holo/widgets/file/folder_node.dart';
import 'package:holo/utils/stack.util.dart';
import 'package:holo/utils/holo.manager.dart';

class FileUtils{
  
  static var fileIconMap = HashMap<String, dynamic>.from({
    'js': {"codePoint": 0xea81, "fontFamily": "Devicon", "Color": Colors.white},
    'ts': {"codePoint": 0xec63, "fontFamily": "Devicon", "Color": Colors.blue},
    'dart': {"codePoint": 0xe9aa, "fontFamily": "Devicon", "Color": Colors.blueAccent},
    'py': {"codePoint": 0xeb9c, "fontFamily": "Devicon", "Color": Colors.yellow},
    'swift': {"codePoint": 0xec34, "fontFamily": "Devicon", "Color": Colors.orange},
    'rs': {"codePoint": 0xebe6, "fontFamily": "Devicon", "Color": Colors.red},
    'tailwind.css': {"codePoint": 0xec39, "fontFamily": "Devicon", "Color": Colors.cyan},
    'html': {"codePoint": 0xea67, "fontFamily": "Devicon", "Color": Colors.deepOrange},
    'java': {"codePoint": 0xea7f, "fontFamily": "Devicon", "Color": Colors.brown},
    'cs': {"codePoint": 0xe9a0, "fontFamily": "Devicon", "Color": Colors.green},
    'c': {"codePoint": 0xe998, "fontFamily": "Devicon", "Color": Colors.indigo},
    'cpp': {"codePoint": 0xe99a, "fontFamily": "Devicon", "Color": Colors.indigoAccent},
    'json': {"codePoint": 0xf04e6, "fontFamily": "MaterialIcons", "Color": Colors.lightBlue},
    'md': {"codePoint": 0xeadb, "fontFamily": "Devicon", "Color": Colors.grey},
    'yml': {"codePoint": 0xe0ee, "fontFamily": "MaterialIcons", "Color": Colors.orangeAccent},
    'xml': {"codePoint": 0xe60e, "fontFamily": "Devicon", "Color": Colors.deepPurple},
    'go': {"codePoint": 0xe60f, "fontFamily": "Devicon", "Color": Colors.teal},
    'sh': {"codePoint": 0xe0b2, "fontFamily": "MaterialIcons", "Color": Colors.yellow},
    'gitignore': {"codePoint": 0xea2d, "fontFamily": "Devicon", "Color": Colors.red},
    'gitattributes': {"codePoint": 0xea2d, "fontFamily": "Devicon", "Color": Colors.red}
  });

  static void filepicker(PageController pageController) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
        HoloManger.updateCurrentDirectory(selectedDirectory);
        pageController.jumpToPage(1); 
    }
  
  } 
  
  static Future<FolderNode> traverseFilesDFS(Directory dir ) async {
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

  static Future<FolderNode> generateFileTreeData() async{
    String? currentDirectory = HoloManger.currentDirectory.value;
    Directory directory = Directory(currentDirectory!);
    return await traverseFilesDFS(directory);
  }
}

class FileNode{
  late String name;
  late Widget widget;

  FileNode(this.name) {
    widget = FileNodeWidget(name: name, fileNode: this); 
  }
  @override
  String toString() {
    return name;
  }
}

class FolderNode extends FileNode{
  List<FileNode> files = [];

  @override
  FolderNode( String name)
    : super( name) {
    widget = FolderNodeWidget(name: name, files: files);
  }

  void setFiles(List<FileNode> files) {
    this.files = files;
  }
  
}
