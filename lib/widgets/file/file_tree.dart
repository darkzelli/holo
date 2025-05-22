import 'package:flutter/material.dart';
import 'package:holo/utils/holo.manager.dart';
import 'package:holo/utils/file.util.dart';

class FileTreeWidget extends StatefulWidget {

  const FileTreeWidget({ super.key});

  @override
  State<FileTreeWidget> createState() => _FileTreeWidgetState();
}

class _FileTreeWidgetState extends State<FileTreeWidget> {
  
  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: HoloManger.currentDirectory,
      builder: (BuildContext context, dynamic value, Widget? child){
        Future<FolderNode>  uiConfig = FileUtils.generateFileTreeData();
        return Padding(
          padding: const EdgeInsets.only(top: 35, bottom: 35, left: 15),
          child: SizedBox(
            child: FutureBuilder<FolderNode>(
              future: uiConfig,
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
    });
  }
}