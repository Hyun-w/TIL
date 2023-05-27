import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffF99231),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images.png',width: 200,height: 200,),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
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