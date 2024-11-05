import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxpollui/features/authentication/cubit/auth_cubit.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/services/firebase/community_service.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';

class JoinButton extends StatefulWidget {
  const JoinButton({
    required this.communityId,
    required this.onJoin,
    super.key,
  });
  final String communityId;
  final ValueChanged<int> onJoin;
  @override
  State<JoinButton> createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  late final _authCubit = context.read<AuthCubit>();
  final _communityService = CommunityService();
  final isLoadingNotifier = ValueNotifier<bool>(false);
  bool isMember = false;

  @override
  void initState() {
    super.initState();
    checkMembership();
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
            final userId = _authCubit.state.user?.id ?? '';
            final communityId = widget.communityId;
            final Future<bool> process;
            if (isMember) {
              process = _communityService.leaveCommunity(userId, communityId);
            } else {
              process = _communityService.joinCommunity(userId, communityId);
            }
            final response = await process;
            if (!response) return;
            widget.onJoin(isMember ? -1 : 1);
            await checkMembership();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isMember ? AppColor.black : AppColor.white,
              ),
              color: isMember ? AppColor.white : AppColor.black,
            ),
            child: isLoading
                ? const SizedBox.shrink()
                : Text(
                    isMember
                        ? LocaleKeys.base_leave.tr()
                        : LocaleKeys.base_join.tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: isMember ? AppColor.black : AppColor.white,
                      fontFamily: FontConstants.gilroySemibold,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Future<void> checkMembership() async {
    isLoadingNotifier.value = true;
    final userId = _authCubit.state.user?.id;
    final communityId = widget.communityId;
    final response = await _communityService.checkMembership(
      userId: userId ?? '',
      communityId: communityId,
    );
    isLoadingNotifier.value = false;
    setState(() => isMember = response);
  }
}
