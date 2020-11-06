import 'package:bibimoney/app/view/ui/styles/ui_colors.dart';
import 'package:bibimoney/app/view/ui/styles/ui_icons.dart';
import 'package:bibimoney/pages/camera/hints/hint_on_video.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraControllerGet extends GetxController {
  static CameraControllerGet to = Get.find();
  final hitIsAccepted = false.obs;
  final imagePath = ''.obs;
}

class CameraScreen extends StatefulWidget {
  CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> _cameras;
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  final CameraControllerGet _controllerGet = Get.find();

  @override
  void initState() {
    _cameras = Get.find();
    final camera = _cameras[0];
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
    _controllerGet.hitIsAccepted.value = false;
    _controllerGet.imagePath.value = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(() {
              return Stack(
                children: <Widget>[
                  CameraPreview(_controller),
                  Positioned(
                      child: _buildButtons(), bottom: 40, left: 60, right: 60),
                  if (!_controllerGet.hitIsAccepted.value)
                    Positioned(
                      child: HintVideo(
                        text:
                            'Пожалуйста запишите на видео ваш автомобиль со свех сторон. В видео должно быть видно: гос. номер автомобиля, повреждения (если есть)',
                        imagePath: 'assets/images/video_360.png',
                        onTapButton: () {
                          _controllerGet.hitIsAccepted.value = true;
                        },
                      ),

                      // HitCamera(
                      //   text:
                      //       'Сделайте фото разворота с вашей фотографией. Удостоверьтесь что информацию на вашем снимке можно будет прочесть',
                      //   imagePath: 'assets/images/empty-loan.png',
                      //   onTapButton: () {
                      //     _controllerGet.hitIsAccepted.value = true;
                      //   },
                      // ),
                    )
                ],
              );
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.camera_alt),
      //   onPressed: () async {
      //     try {
      //       await _initializeControllerFuture;
      //       final path = join(
      //         (await getTemporaryDirectory()).path,
      //         '${DateTime.now()}.png',
      //       );
      //       await _controller.takePicture(path);
      //     } catch (e) {
      //       print(e);
      //     }
      // },
      // ),
    );
  }

  Widget _buildButtons() {
    return Obx(() {
      if (_controllerGet.imagePath.value == '')
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IconButton(
              //     icon: Icon(UiIcons.flash_off, color: UiColors.main2),
              //     onPressed: null),
              // IconButton(icon: Icon(UiIcons.chat), onPressed: null),
              GestureDetector(
                onTapUp: (_) async {
                  try {
                    await _initializeControllerFuture;
                    final path = join(
                      (await getTemporaryDirectory()).path,
                      '${DateTime.now()}.png',
                    );
                    await _controller.takePicture(path);
                    _controllerGet.imagePath.value = path;
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(58 / 2),
                      border: Border.all(width: 2, color: UiColors.main2)),
                ),
              ),
              // IconButton(
              //     icon: Icon(UiIcons.reverse_camera, color: UiColors.main2),
              //     onPressed: null)
            ]);
      else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                iconSize: 30,
                icon: Icon(UiIcons.close, color: UiColors.main2),
                onPressed: () {
                  Get.back();
                }),
            SizedBox(width: 70),
            IconButton(
                iconSize: 30,
                icon: Icon(UiIcons.check, color: UiColors.main2),
                onPressed: () {
                  Get.back();
                }),
          ],
        );
      }
    });
  }
}
