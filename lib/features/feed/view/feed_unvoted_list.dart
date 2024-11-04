import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/features/poll/widget/poll_tile.dart';
import 'package:voxpollui/features/sub_features/common_widgets/custom_app_bar.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';

class FeedUnvotedList extends StatelessWidget {
  const FeedUnvotedList({required this.unvotedList, super.key});
  final List<PollModel> unvotedList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: PagePaddings.horL,
            child: Text(
              LocaleKeys.feed_waitingPolls.tr(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontConstants.gilroyBold,
              ),
            ),
          ),
          ...unvotedList.map(PollTile.new),
        ],
      ),
    );
  }
}
