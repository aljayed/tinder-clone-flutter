import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController{

  var pickedImagePath = ''.obs;
  var pickedImageSize = ''.obs;

  void getImage(ImageSource imageSource)async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      pickedImagePath.value = pickedFile.path;
      pickedImageSize.value = ((File(pickedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" MB";
    }
    else{
      Get.snackbar("Error", "No image was chosen", snackPosition: SnackPosition.BOTTOM);
    }
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}