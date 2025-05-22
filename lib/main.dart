import 'package:flutter/material.dart';
import 'package:holo/pages/file.dart';
import 'package:holo/pages/no_file.dart';
import 'package:holo/pages/settings.dart';

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
              Text("", style: TextStyle(color: Color.fromARGB(255, 73, 62, 124)),),
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