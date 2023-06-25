import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_editor/component/emotion_sticker.dart';
import 'package:image_editor/component/footer.dart';
import 'package:image_editor/component/main_app_bar.dart';
import 'package:image_editor/model/sticker_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key?key}):super(key: key);
  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;
  Set<StickerModel> stickers= {};
  String? selectedId;
  GlobalKey imgKey = GlobalKey();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          renderBody(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
              onDeleteImage: onDeleteImage, 
              onPickImage: onPickImage, 
              onSaveImage: onSaveImage
            ),
          ),
          if(image!=null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Footer(onEmotionTap: onEmotionTap),
            ),
        ],
      ),
    );
  }

  void onDeleteImage(){}
  
  void onPickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }

  void onSaveImage() async {
    RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    await ImageGallerySaver.saveImage(pngBytes, quality: 100);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('저장되었습니다!'),)
    );
  } 

  Widget renderBody(){
    if(image!=null){
      return RepaintBoundary(
        key: imgKey,
        child: Positioned.fill(
          child: InteractiveViewer(          
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ),
                ...stickers.map(
                  (sticker) => Center(
                    child: EmotionSticker(
                      key: ObjectKey(sticker.id),
                      onTransform: (){
                        onTransform(sticker.id);
                      },
                      imgPath: sticker.imgPath,
                      isSelected: selectedId == sticker.id,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: onPickImage,
          child: Text('이미지 선택하기'),
        ),
      );
    }
  }

  void onEmotionTap(int index)async{
    setState(() {
      stickers = {
        ...stickers,
        StickerModel(
          id: Uuid().v4(), 
          imgPath: 'asset/img/emotion_$index.png',
        ),
      };
    });
  }
  void onTransform(String id){
    selectedId=id;
  }
  void onDeleteItem() async {
    setState(() {
      stickers = stickers.where((sticker)=>sticker.id != selectedId).toSet();
    });
  }
}