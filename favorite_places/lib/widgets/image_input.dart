import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickedImage});
  final void Function(File image) onPickedImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return;
    } else {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
      widget.onPickedImage(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _selectedImage != null
        ? GestureDetector(
            onTap: () {
              _takePicture();
            },
            child: Image.file(
              _selectedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          )
        : TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera_outlined),
            label: const Text('Take Picture'),
          );
    return Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.onBackground),
            borderRadius: BorderRadius.circular(20)),
        child: mainContent);
  }
}
