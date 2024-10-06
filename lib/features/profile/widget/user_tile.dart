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
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.white38,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 5,
                                    blurRadius: 15,
                                    offset: const Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: BottomSheetCustom.buildBottomSheetMenu(
                                context,
                                'creator.username',
                              ),
                            );
                          },
                        );
                      },
                      child: IconConstants.verify.toCustomIcon(size: 20)),
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

class BottomSheetCustom {
  static Widget buildBottomSheetMenu(BuildContext context, String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset("GetImage.bottomSheetPaylas",
                width: 24, height: 24),
            title: Text(
              'Anketi paylaş',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Divider(height: 1),
          ),
          ListTile(
            leading: Image.asset("GetImage.bottomSheetTakipBirak",
                width: 24, height: 24),
            title: Text(
              '@$username adlı kişiyi takibi bırak',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:
                Image.asset("GetImage.bottomSheetEngel", width: 24, height: 24),
            title: Text(
              '@$username adlı kişiyi engelle',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset("GetImage.bottomSheetSikayet",
                width: 24, height: 24),
            title: Text(
              '@$username adlı kişiyi şikayet et',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset("GetImage.bottomSheetSessizeAl",
                width: 24, height: 24),
            title: Text(
              '@$username adlı kişiyi sessize al',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Divider(height: 1), // Divider'ı ayarladık
          ),
          ListTile(
            leading: Image.asset("GetImage.bottomSheetBildir",
                width: 24, height: 24),
            title: Text(
              'Anketi bildir',
              style: TextStyle(
                fontFamily: FontConstants.gilroyMedium,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Anket bildirme fonksiyonu buraya eklenecek
            },
          ),
        ],
      ),
    );
  }
}
