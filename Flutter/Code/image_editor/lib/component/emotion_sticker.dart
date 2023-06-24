import 'package:flutter/material.dart';

class EmotionSticker extends StatefulWidget{
  final VoidCallback onTransform;
  final String imgPath;

  const EmotionSticker({
    required this.onTransform,
    required this.imgPath,
    Key? key
  }):super(key: key);

  @override
  State<EmotionSticker> createState() => _EmotionStickerState();
}

class _EmotionStickerState extends State<EmotionSticker>{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        widget.onTransform();
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        widget.onTransform();
      },
      onScaleEnd: (ScaleEndDetails details) {},
      child: Image.asset(widget.imgPath),
    );
  }
}