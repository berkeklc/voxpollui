import 'package:flutter/material.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';

class ExtendedElevatedButton extends Container {
  ExtendedElevatedButton({
    required VoidCallback onPressed,
    required String text,
    super.key,
  }) : super(
          margin: PagePaddings.allS,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(text),
                ),
              ),
            ],
          ),
        );
}
