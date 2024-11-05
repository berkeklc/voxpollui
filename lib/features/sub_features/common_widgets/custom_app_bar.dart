import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/icon_constants.dart';
import 'package:voxpollui/product/utils/constants/image_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';

final class CustomAppBar extends AppBar {
  CustomAppBar(
    BuildContext context, {
    String? title,
    bool isTransparent = false,
    super.actions,
    super.key,
  }) : super(
          scrolledUnderElevation: 0,
          forceMaterialTransparency: false,
          backgroundColor: isTransparent ? Colors.transparent : AppColor.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          centerTitle: true,
          title: title == null
              ? Image.asset(ImageConstants.poll)
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: FontConstants.gilroyBold,
                  ),
                ),
          leading: context.canPop()
              ? IconButton(
                  padding: PagePaddings.allXS,
                  icon: IconConstants.arrowBack.toIcon,
                  color: AppColor.opposite,
                  onPressed: () => context.pop(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColor.white),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColor.borderColor,
                          width: 1.25,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )
              : null,
        );
}
