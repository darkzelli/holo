

class HoloManger{
    static HoloManger? _instance;
    String currentDirectory = "";

    HoloManger._private();

    static HoloManger getInstance(){
      _instance ??= HoloManger._private();
      return _instance!;
    } 

    void updateCurrentDirectory(String newPath){
      currentDirectory = newPath;
    }

}