import 'dart:io';

import 'package:flutter/cupertino.dart';

Widget buildImagePickerItem({
  required Function function,
  required dynamic imagePath,

}) {
  return GestureDetector(
    onTap: () {
      function;
    },
    child: ClipOval(
      child: Image.file(
        imagePath,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    ),
  );
}
