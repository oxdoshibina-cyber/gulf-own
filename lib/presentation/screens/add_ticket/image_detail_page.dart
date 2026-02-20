import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulfownsalesview/core/theme/app_colors.dart';
import 'package:gulfownsalesview/core/theme/app_spacing.dart';
import 'package:gulfownsalesview/core/theme/app_text_style.dart';
import 'package:gulfownsalesview/presentation/screens/add_ticket/widget/page_navigation.dart';
import 'package:gulfownsalesview/presentation/widgets/container_button.dart';

class ImageDetailPage extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final VoidCallback onSubmit;

  final ValueNotifier<List<Uint8List?>> imagesNotifier;

  const ImageDetailPage({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onSubmit,
    required this.imagesNotifier,
  });

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          /// Images Grid
          ValueListenableBuilder<List<Uint8List?>>(
            valueListenable: widget.imagesNotifier,
            builder: (context, images, _) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 1.6,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return _buildImageTile(images, index);
                },
              );
            },
          ),

          AppSpacing.h32,

          /// Page Navigation
          PageNavigation(
            pageController: widget.pageController,
            currentPage: widget.currentPage,
            onSubmit: widget.onSubmit,
          ),
        ],
      ),
    );
  }

  /// Single image tile
  Widget _buildImageTile(List<Uint8List?> images, int index) {
    final hasImage = images[index] != null;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: hasImage
          ? Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.memory(images[index]!, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () => _removeImage(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'Remove',
                        style: AppTextStyle.kTitleMediumTextStyle(
                          fontColor: AppColors.whiteColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera_outlined,
                  size: 48.sp,
                  color: AppColors.greenColor,
                ),
                AppSpacing.h12,
                ContainerButton(
                  alignment: Alignment.center,
                  radius: BorderRadius.circular(10.r),
                  height: 36.h,
                  width: 120.w,
                  text: 'Upload',
                  color: AppColors.greenColor,
                  onTap: () => _pickImage(index),
                ),
              ],
            ),
    );
  }

  /// Picks image using FilePicker
  /// 👉 On Web/Tablet browser this supports BOTH gallery & camera
  Future<void> _pickImage(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true, // REQUIRED for web
    );

    if (result == null) return;

    final bytes = result.files.single.bytes;
    if (bytes == null) return;

    final updatedList = List<Uint8List?>.from(widget.imagesNotifier.value);
    updatedList[index] = bytes;
    widget.imagesNotifier.value = updatedList;
  }

  /// Remove image
  void _removeImage(int index) {
    final updatedList = List<Uint8List?>.from(widget.imagesNotifier.value);
    updatedList[index] = null;
    widget.imagesNotifier.value = updatedList;
  }
}
