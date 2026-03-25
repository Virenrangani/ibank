import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ibank/core/constant/padding/custom_padding.dart';
import '../../constant/color/custom_color.dart';
import '../../image/app_image.dart';
import 'helper/show_picker_option.dart';

class CustomImagePicker extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final bool showBorder;
  final IconData icon;
  final File? initialImage;
  final Function(File image)? onImageSelected;

  const CustomImagePicker({
    super.key,
    this.width = 120,
    this.height = 120,
    this.radius = 60,
    this.showBorder = true,
    this.icon = Icons.camera_alt,
    this.initialImage,
    this.onImageSelected,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
  }

  void _openPicker() {
    ShowPickerOption.show(
      context: context,
      onImageSelected: (image) {
        setState(() {
          _image = image;
        });
        if (widget.onImageSelected != null) {
          widget.onImageSelected!(image);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return GestureDetector(
        onTap: _openPicker,
        child: SizedBox(
          width: 220,
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:EdgeInsets.only(top:24),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: AppColors.primaryContainer
                  ),
                  child: Center(
                    child: Image.asset(
                      height: 100,
                      width: 80,
                      AppImage.mobile,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  AppImage.dotImage,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _openPicker,
      child: SizedBox(
        width: 210,
        height: 180,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding:EdgeInsets.only(top:24),
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: widget.showBorder
                      ? Border.all(color: Colors.grey.shade400, width: 2)
                      : null,
                ),
                child:ClipOval (
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                AppImage.dotImage,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}