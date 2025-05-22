import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:holo/widgets/file/file_node.dart';
import 'package:holo/widgets/file/folder_node.dart';

class FileUtils{
  static var fileIconMap = HashMap<String, int>.from({
    'js': 0xea81,
    'ts': 0xec63,
    'dart': 0xe9aa,
    'py': 0xeb9c,
    'swift': 0xec34,
    'rs': 0xebe6,
    'tailwind.css': 0xec39,
    'html': 0xea67,
    'java': 0xea7f,
    'cs': 0xe9a0,
    'c': 0xe998,
    'cpp': 0xe99a,
  });


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
