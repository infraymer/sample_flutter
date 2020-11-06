import 'dart:io';
import 'package:bibimoney/pages/camera/camera_screen.dart';
import 'package:bibimoney/pages/camera/hints/hint_on_camera.dart';
import 'package:camera_camera/page/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'camera_header.dart';

Future<File> takePhoto(
        {BuildContext context,
        String title,
        String subtitle,
        bool withHint = false,
        String hint = '',
        String imagePath = '',
        bool widePhoto = false,
        bool withFrame = false}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      CameraControllerGet.to.hitIsAccepted.value = !withHint;
      return Material(
        child: Obx(() {
          return Stack(
            children: <Widget>[
              Camera(),
              CameraHeader(title: title ?? '', subtitle: subtitle),
              withFrame
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Image.asset('assets/images/yellow_photo_frame.png'),
                      ),
                    )
                  : SizedBox(),
              CameraControllerGet.to.hitIsAccepted.value
                  ? SizedBox()
                  : HitCamera(
                      text: hint,
                      imagePath: imagePath,
                      widePhoto: widePhoto,
                      onTapButton: () {
                        CameraControllerGet.to.hitIsAccepted.value = true;
                      },
                    ),
            ],
          );
        }),
      );
    }));
