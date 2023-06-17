import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  final GestureTapCallback onPressed;
  final IconData iconData;

  const CustomIconButton({
    required this.iconData,
    required this.onPressed,
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context){
    return IconButton(onPressed: onPressed, iconSize: 30.0,color:Colors.white, icon: Icon(iconData),);
  }
}