import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/setting_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key:key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin{
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;

  tabListener() {
    setState(() { });
  }

  void onPhoneShake(){
    final rand = new Random();
    setState(() {
      number = rand.nextInt(5)+1;
    });
  }
  @override
  void dispose() {
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,
    );
  }  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  void onThresholdChange(double val){
    setState(() {
      threshold=val;
    });
  }

  List<Widget> renderChildren(){
    return [
      HomeScreen(number: 1),
      SettingScreen(threshold: threshold, onThresholdChange: onThresholdChange),
    ];
  }

  BottomNavigationBar renderBottomNavigation(){
    return BottomNavigationBar(      
      onTap: (int index){
        setState(() {
          controller!.animateTo(index);
        });
      },
      currentIndex: controller!.index,
      items: [
      BottomNavigationBarItem(icon: Icon(
        Icons.edgesensor_high_outlined,
      ),label: '주사위'),
      BottomNavigationBarItem(icon: Icon(
        Icons.settings,
      ),label: '설정'),
    ]);  
  }
}
