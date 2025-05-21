import 'package:flutter/material.dart';
import 'package:holo/widgets/file/file_node.dart';
import 'package:holo/widgets/file/folder_node.dart';

class FileNode{
  late String? type;
  late String name;
  late int? iconCodePoint;
  Widget widget;

  FileNode(this.type, this.name, this.iconCodePoint) : widget = FileNodeWidget(name: name, icon: iconCodePoint);
  @override
String toString() {
  return name;
}
}

class FolderNode extends FileNode{
  List<FileNode> files = [];
  late double offset;
  @override
  FolderNode( String? type, String name, int? icon, this.offset)
    : super( type, name, icon) {
    widget = FolderNodeWidget(name: name, files: files, offset: offset);
  }

  void setFiles(List<FileNode> files){
    this.files = files;
  }
  @override
String toString([int indentLevel = 0]) {
  final indent = '  ' * indentLevel;
  final buffer = StringBuffer();

  buffer.writeln('$indent--- $name');
  for (var file in files) {
    if (file is FolderNode) {
      buffer.write(file.toString(indentLevel + 1));
    } else {
      buffer.writeln('${'  ' * (indentLevel + 1)}-- ${file.name}');
    }
  }
  return buffer.toString();
}
}
