import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';
import 'package:voxpollui/product/utils/constants/widget_sizes.dart';

class FeedCountButton extends StatelessWidget {
  const FeedCountButton({required this.unvotedList, super.key});
  final List<PollModel> unvotedList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FeedUnvotedListRoute(unvotedList).push<void>(context),
      child: Container(
        margin: PagePaddings.horL,
        padding: PagePaddings.allXS,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColor.primary,
          boxShadow: [
            BoxShadow(color: AppColor.primary, spreadRadius: 1, blurRadius: 3),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              unvotedList.length.toString(),
              style: TextStyle(
                color: AppColor.white,
                fontFamily: FontConstants.gilroyBold,
                fontSize: 26,
              ),
            ),
            const SizedBox(width: WidgetSizes.m),
            Text(
              LocaleKeys.feed_unvotedPolls.tr(),
              style: TextStyle(
                color: AppColor.white,
                fontFamily: FontConstants.gilroyBold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
