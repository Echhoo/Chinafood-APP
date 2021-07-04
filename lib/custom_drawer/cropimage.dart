import 'dart:io';
import 'package:chinafood/app_theme.dart';
import 'package:chinafood/global.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

class CropImageRoute extends StatefulWidget {
  CropImageRoute(this.image);

  File image; //原始图片路径

  @override
  _CropImageRouteState createState() => new _CropImageRouteState();
}

class _CropImageRouteState extends State<CropImageRoute> {
  double baseLeft; //图片左上角的x坐标
  double baseTop; //图片左上角的y坐标
  double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppTheme.white,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Crop.file(
                  widget.image,
                  key: cropKey,
                  aspectRatio: 1.0,
                  alwaysShowGrid: true,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _crop(widget.image);
                },
                child: Text('ok'),
              ),
            ],
          ),
        ));
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: crop.area,
        ).then((value) {
          upload(value);
          print("裁剪成功");
        }).catchError(() {
          print('裁剪不成功');
          upload(originalFile);
        });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  Future<void> upload(File file) async {
    String path=file.path;
    await Global.storage.uploadFile(
        cloudPath: 'flutter/'+Global.userPhone+'touxiang.png',
        filePath: '$path',
      );
    CloudBaseStorageRes<UploadMetadata>res = await Global.storage.getUploadMetadata('flutter/'+Global.userPhone+'touxiang.png');
    List<String> fileIds = [
      res.data.fileId // fileid正确
    ];
    var res1 = await Global.storage.getFileDownloadURL(fileIds);
    print(res1);
    //https://656e-env-5gsr3xqnc0d60a71-1259684063.tcb.qcloud.la/flutter/18369149378touxiang.png?sign=73f9950ccd136848cfaf1ee80fd8ec44&t=1625250802
    Navigator.pop(context);//这里的url在上一页调用的result可以拿到

        // Navigator.pop(context, '');

  }
}
