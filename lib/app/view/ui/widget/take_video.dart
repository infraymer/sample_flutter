import 'dart:io';
import 'package:bibimoney/pages/camera/camera_screen.dart';
import 'package:bibimoney/pages/camera/hints/hint_on_video.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'camera_header.dart';

Future<File> takeVideo({
  BuildContext context,
  String title,
  String subtitle,
  bool withHint = false,
  String hint = '',
  String imagePath = '',
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      CameraControllerGet.to.hitIsAccepted.value = !withHint;
      return Material(
        child: Obx(() {
          return Stack(
            children: <Widget>[
              Video(),
              CameraHeader(title: title ?? '', subtitle: subtitle),
              CameraControllerGet.to.hitIsAccepted.value
                  ? SizedBox()
                  : HintVideo(
                      text: hint,
                      imagePath: imagePath,
                      onTapButton: () {
                        CameraControllerGet.to.hitIsAccepted.value = true;
                      },
                    ),
            ],
          );
        }),
      );
    }));
