import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:easy_flutter/utils/sq_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'long_pic_save_logic.dart';

class LongPicSavePage extends StatelessWidget {
  final logic = Get.put(LongPicSaveLogic());
  final state = Get.find<LongPicSaveLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RepaintBoundary(
              key: state.globalKey,
              child: Column(
                children: [
                  Container(
                    height: 300.w,
                    alignment: Alignment.center,
                    child: Text("第一个"),
                    color: Colors.red,
                  ),
                  Container(
                    height: 300.w,
                    alignment: Alignment.center,
                    child: Text("第二个"),
                    color: Colors.black,
                  ),
                  Container(
                    height: 300.w,
                    alignment: Alignment.center,
                    child: Text("第三个"),
                    color: Colors.blue,
                  ),
                  Container(
                    height: 300.w,
                    alignment: Alignment.center,
                    child: Text("第四个"),
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // _capturePng().then((value) {
                //   _savePic(value);
                // });

                _capturePng().then((value) {
                  _savePic(value).then((value) {
                    SQToast.show("保存到本地成功");
                  }).onError((dynamic error, stackTrace) {
                    SQToast.show("保存到本地失败");
                  }).whenComplete(() {});
                }).onError((dynamic error, stackTrace) {
                  SQToast.show("截取图片失败");
                }).whenComplete(() {
                  // _loading();
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 100.w,
                child: Text(
                  "保存图片",
                  style: TextStyle(fontSize: 20.w),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary = state.globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      return Uint8List(10);
    }
  }

  Future _savePic(Uint8List value) async {
    if (Platform.isAndroid) {
      await [Permission.storage].request();
    }
    return ImageGallerySaver.saveImage(Uint8List.fromList(value));
  }
}
