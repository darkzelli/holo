

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:holo/utils/holo.manager.dart';
import 'package:holo/widgets/nofile/option.dart';
class NoFile extends StatefulWidget {
  final PageController pageController;
  const NoFile({super.key, required this.pageController});

  @override
  State<NoFile> createState() => _NoFileState();
}




class _NoFileState extends State<NoFile> {
  
  void filepicker() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
        HoloManger.getInstance().updateCurrentDirectory(selectedDirectory);
        widget.pageController.jumpToPage(1); 
    }
  
  } 
  
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Option(iconUni: 0xe2a3, text: "Open a File", keymap: "G", function: filepicker,),
            Option(iconUni: 0xf04ff, text: "Open a Recent Files", keymap: "R",),
            Option(iconUni: 0xe57f, text: "Settings", keymap: "T", function: () => widget.pageController.jumpToPage(2),),
            Option(iconUni: 0xe2ea, text: "Projects", keymap: "p",)
          ]
        ),
      ));
  }
}