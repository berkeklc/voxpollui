import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/icon_constants.dart';

final class UserBottomSheet extends StatelessWidget {
  const UserBottomSheet({
    required this.userName,
    required this.userId,
    super.key,
  });
  final String userName;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Durations.medium1),
      builder: (_, snapshop) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ActionTile(
                title: LocaleKeys.sheet_xUnfollow.tr(args: [userName]),
                leadingIcon: IconConstants.unfollow,
                onTap: () {},
              ),
              // _ActionTile(
              //   title: LocaleKeys.sheet_xBlock.tr(args: [userName]),
              //   leadingIcon: IconConstants.block,
              //   onTap: () {},
              // ),
              _ActionTile(
                title: LocaleKeys.sheet_xReport.tr(args: [userName]),
                leadingIcon: IconConstants.report,
                onTap: () {},
              ),
              // _ActionTile(
              //   title: LocaleKeys.sheet_xMute.tr(args: [userName]),
              //   leadingIcon: IconConstants.mute,
              //   onTap: () {},
              // ),
            ],
          ),
        );
      },
    );
  }
}

final class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon.toIcon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontConstants.gilroyMedium,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
    );
  }
}
