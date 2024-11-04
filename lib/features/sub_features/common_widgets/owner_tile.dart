import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/features/sub_features/bottom_sheets/user_poll_bottom_sheet.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/owner_model/community_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/owner_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/user_model.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/icon_constants.dart';
import 'package:voxpollui/product/utils/extensions/context_ext.dart';

final class OwnerTile extends StatelessWidget {
  const OwnerTile({required this.owner, this.pollId, super.key});
  final OwnerModel owner;
  final String? pollId;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => navigateOwnerPage(context),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColor.black,
            backgroundImage: getOwnerImage,
            child: getIcon?.toIcon,
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
                    owner.name ?? '',
                    style: TextStyle(
                      fontFamily: FontConstants.gilroySemibold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconConstants.verify.toCustomIcon(size: 20),
                  const SizedBox(width: 5),
                  Text(
                    '@${owner.userName}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.opposite,
                      fontFamily: FontConstants.gilroySemibold,
                    ),
                  ),
                ],
              ),
              Text(
                subText,
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
          onTap: () => showBottomSheet(context),
          child: IconConstants.more.toIcon,
        ),
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    if (pollId == null) return;
    context.showSheet<void>(
      UserPollBottomSheet(
        userName: owner.userName ?? '',
        userId: owner.id,
        pollId: pollId!,
      ),
    );
  }

  String get subText {
    if (owner.ownerType == OwnerType.user) {
      return LocaleKeys.home_drawer_followerText.tr(
        args: [
          (owner as UserModel).followersCount.toString(),
        ],
      );
    }
    if (owner.ownerType == OwnerType.community) {
      return LocaleKeys.community_xMembers.tr(
        args: [
          (owner as CommunityModel).memberCount.toString(),
        ],
      );
    }
    return '';
  }

  ImageProvider? get getOwnerImage {
    if (owner.imageUrl == null) return null;
    return NetworkImage(owner.imageUrl!);
  }

  IconData? get getIcon {
    if (owner.imageUrl != null) return null;
    if (owner.ownerType == OwnerType.user) {
      return IconConstants.profile;
    }
    if (owner.ownerType == OwnerType.community) {
      return IconConstants.community;
    }
    return IconConstants.profile;
  }

  void navigateOwnerPage(BuildContext context) {
    if (owner.ownerType == OwnerType.user) {
      final user = owner as UserModel;
      UserProfileRoute(uid: user.id).push<void>(context);
      return;
    }
    if (owner.ownerType == OwnerType.community) {
      final community = owner as CommunityModel;
      CommunityDetailRoute(community.id).push<void>(context);
      return;
    }
  }
}
