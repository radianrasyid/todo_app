// import 'dart:html';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  File? ImageTemporary;
  final ImagePicker imgPicker = ImagePicker();

  Future getImage() async {
    try {
      final XFile? imagePicked =
          await imgPicker.pickImage(source: ImageSource.gallery);
      if (imagePicked == null) return;
      ImageTemporary = File(imagePicked.path);
      update();
    } on PlatformException catch (e) {
      Get.snackbar('Image pick cancelled',
          "Appearently you weren't chose any image ${e.message}");
    }
  }

  Future cameraImage() async {
    try {
      final XFile? imagePicked =
          await imgPicker.pickImage(source: ImageSource.camera);
      if (imagePicked == null) return;
      ImageTemporary = File(imagePicked.path);
      update();
    } on PlatformException catch (e) {
      Get.snackbar('Image pick cancelled',
          "Appearently you weren't chose any image ${e.message}");
    }
  }
}
