

import 'package:flutter/widgets.dart';

class HoloManger{
    static HoloManger? _instance;
    static final ValueNotifier<String?> currentDirectory = ValueNotifier<String?>(null);
    static final ValueNotifier<String?> selectedFile = ValueNotifier<String?>(null);

    HoloManger._private();

    static HoloManger getInstance(){
      _instance ??= HoloManger._private();
      return _instance!;
    } 

    static void updateCurrentDirectory(String newPath){
      currentDirectory.value = newPath;
    }

    static void updateSelectedFile(String newFile){
      selectedFile.value = newFile;
    }

}