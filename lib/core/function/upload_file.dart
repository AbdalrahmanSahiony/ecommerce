import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

uploadImageFromCamer() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

uploadFile([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
