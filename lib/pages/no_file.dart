

import 'package:flutter/material.dart';
import 'package:holo/utils/file.util.dart';
import 'package:holo/widgets/no_file/option.dart';
class NoFile extends StatefulWidget {
  final PageController pageController;
  const NoFile({super.key, required this.pageController});

  @override
  State<NoFile> createState() => _NoFileState();
}




class _NoFileState extends State<NoFile> {
  void pickFile(){
    FileUtils.filepicker(widget.pageController);
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
            Image.asset("lib/assets/images/holoASCII.png"),
            Option(iconUni: 0xe2a3, text: "Open a File", keymap: "G", function: pickFile),
            Option(iconUni: 0xf04ff, text: "Open a Recent Files", keymap: "R",),
            Option(iconUni: 0xe57f, text: "Settings", keymap: "T", function: () => widget.pageController.jumpToPage(2),),
            Option(iconUni: 0xe2ea, text: "Projects", keymap: "p",)
          ]
        ),
      ));
  }
}