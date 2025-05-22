import 'package:flutter/material.dart';
import 'package:holo/pages/file.dart';
import 'package:holo/pages/no_file.dart';
import 'package:holo/pages/settings.dart';
import 'package:holo/utils/holo.manager.dart';

import 'dart:io';

import 'package:holo/utils/file.util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JetBrainsMono',
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(19, 18, 18, 1),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            NoFile(pageController: _pageController),
            File(),
            Settings()
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    FileUtils.filepicker(_pageController);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.folder_special, color: Color.fromARGB(255, 73, 62, 124),),
                      SizedBox(width: 8,),
                      ValueListenableBuilder<String?>(
                        valueListenable: HoloManger.currentDirectory,
                        builder: (BuildContext context, dynamic value, Widget? child){
                          String? directoryName = "";
                          String? currentDirectory = HoloManger.currentDirectory.value;
                          if(currentDirectory != null){
                             Directory directory = Directory(currentDirectory) ;
                            directoryName = directory.path.split(Platform.pathSeparator).last;
                          }
                          return Text(directoryName, style: TextStyle(color: Color.fromARGB(255, 73, 62, 124)));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text("holo", style: TextStyle(color: Color.fromARGB(255, 73, 62, 124)),),
                  SizedBox(width: 8,),
                  Container(
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 73, 62, 124),
                    ),
                    child: Center(
                      child: Text(
                        "0.1"
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}