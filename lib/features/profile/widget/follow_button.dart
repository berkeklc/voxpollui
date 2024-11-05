import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxpollui/features/authentication/cubit/auth_cubit.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/services/firebase/follower_service.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';

final class FollowButton extends StatefulWidget {
  const FollowButton({
    required this.userId,
    required this.onFollow,
    required this.onUnfollow,
    super.key,
  });
  final String userId;
  final VoidCallback? onFollow;
  final VoidCallback? onUnfollow;
  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late final _authCubit = context.read<AuthCubit>();
  final isLoadingNotifier = ValueNotifier<bool>(false);
  final _followerService = FollowerService();
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    checkFollowing();
  }

  Future<void> checkFollowing() async {
    isLoadingNotifier.value = true;
    final localUserId = _authCubit.state.user?.id;
    final targetUserId = widget.userId;
    final response = await _followerService.isFollowing(
      localUserId: localUserId ?? '',
      targetUserId: targetUserId,
    );
    setState(() => isFollowing = response);
    isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoadingNotifier,
      builder: (_, isLoading, __) {
        return GestureDetector(
          onTap: () async {
            if (isLoading) return;
            isLoadingNotifier.value = true;
            final localUserId = _authCubit.state.user?.id;
            final targetUserId = widget.userId;
            final Future<bool> process;
            if (isFollowing) {
              widget.onUnfollow?.call();
              process = _followerService.unfollowUser(
                localUserId: localUserId ?? '',
                targetUserId: targetUserId,
              );
            } else {
              widget.onFollow?.call();
              process = _followerService.followUser(
                localUserId: localUserId ?? '',
                targetUserId: targetUserId,
              );
            }
            final response = await process;
            if (!response) return;
            await checkFollowing();
          },
          child: Container(
            margin: PagePaddings.horL,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isFollowing ? AppColor.black : AppColor.white,
              ),
              color: isFollowing ? AppColor.white : AppColor.black,
            ),
            child: isLoading
                ? const SizedBox.shrink()
                : Text(
                    isFollowing
                        ? LocaleKeys.profile_unfollow.tr()
                        : LocaleKeys.profile_follow.tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: isFollowing ? AppColor.black : AppColor.white,
                      fontFamily: FontConstants.gilroySemibold,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
