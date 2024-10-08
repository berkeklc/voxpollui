import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/user_model.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/icon_constants.dart';

final class UserTile extends StatelessWidget {
  const UserTile(this.user, {super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => UserProfileRoute(uid: user.id).push<void>(context),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColor.black,
            backgroundImage:
                user.imageUrl != null ? NetworkImage(user.imageUrl!) : null,
            child: user.imageUrl == null ? IconConstants.profile.toIcon : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    user.name ?? '',
                    style: TextStyle(
                      fontFamily: FontConstants.gilroySemibold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconConstants.verify.toCustomIcon(size: 20),
                  const SizedBox(width: 5),
                  Text(
                    '@${user.userName}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.opposite,
                      fontFamily: FontConstants.gilroySemibold,
                    ),
                  ),
                ],
              ),
              Text(
                LocaleKeys.home_drawer_followerText
                    .tr(args: [user.followersCount.toString()]),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontConstants.gilroyMedium,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: IconConstants.more.toIcon,
        ),
      ],
    );
  }
}
