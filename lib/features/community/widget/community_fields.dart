part of '../view/community_detail_view.dart';

final class _CommunityImageHeader extends StatelessWidget {
  const _CommunityImageHeader(
    this.community, {
    required this.isManager,
    required this.onEdit,
  });
  final CommunityModel community;
  final bool isManager;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Image.network(
                  community.backgroundUrl ?? 'https://picsum.photos/200',
                  width: double.infinity,
                  height: WidgetSizes.maxiL,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: WidgetSizes.x4L),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.primary,
                  backgroundImage: community.imageUrl != null
                      ? NetworkImage(community.imageUrl!)
                      : null,
                  child: community.imageUrl == null
                      ? IconConstants.community
                          .toCustomIcon(size: 64, color: AppColor.white)
                      : null,
                ),
              ],
            ),
          ],
        ),
        CustomAppBar(
          context,
          isTransparent: true,
          title: '',
          actions: [
            IconButton(
              padding: PagePaddings.allXS,
              icon: IconConstants.more.toIcon,
              onPressed: () {
                // context.showSheet();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: AppColor.borderColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            if (isManager)
              IconButton(
                padding: PagePaddings.allXS,
                icon: IconConstants.settings.toIcon,
                onPressed: onEdit,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: AppColor.borderColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

final class _CommunityInfo extends StatelessWidget {
  const _CommunityInfo(
    this.community, {
    required this.pollCount,
    required this.isManager,
    required this.onJoin,
  });
  final CommunityModel community;
  final num pollCount;
  final bool isManager;
  final ValueChanged<int> onJoin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (!isManager)
              Container(
                alignment: Alignment.centerRight,
                margin: PagePaddings.horL,
                child: JoinButton(
                  communityId: community.id,
                  onJoin: onJoin,
                ),
              ),
            Text(
              community.name ?? '',
              style: TextStyle(
                fontSize: 22,
                fontFamily: FontConstants.gilroyBold,
              ),
            ),
          ],
        ),
        Text(
          '@${community.userName}',
          style: TextStyle(
            fontSize: 14,
            color: AppColor.opposite,
            fontFamily: FontConstants.gilroySemibold,
          ),
        ),
        Text(
          community.description ?? '',
          style: TextStyle(
            fontSize: 14,
            color: AppColor.black,
            fontFamily: FontConstants.gilroyRegular,
          ),
        ),
        const SizedBox(height: WidgetSizes.xl),
        Row(
          children: [
            _InfoBox(
              title: LocaleKeys.profile_members.tr(),
              value: community.memberCount ?? 0,
              onTap: () {
                CommunityMembersRoute(community).push<void>(context);
              },
            ),
            _InfoBox(
              title: LocaleKeys.profile_pollCount.tr(),
              value: pollCount,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: WidgetSizes.l),
      ],
    );
  }
}

final class _CommunityTabNav extends StatelessWidget {
  const _CommunityTabNav(this.pageNotifier, this.onTap);
  final ValueNotifier<int> pageNotifier;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageNotifier,
      builder: (_, page, __) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.opposite.withOpacity(.3),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          margin: PagePaddings.horL,
          padding: PagePaddings.allXS,
          child: Row(
            children: [
              _TabNavBox(
                index: 0,
                label: LocaleKeys.community_activePolls.tr(),
                isSelected: page == 0,
                onTap: onTap,
              ),
              _TabNavBox(
                index: 1,
                label: LocaleKeys.community_oldPolls.tr(),
                isSelected: page == 1,
                onTap: onTap,
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _CommunityTabView extends StatelessWidget {
  const _CommunityTabView(
    this.pageNotifier, {
    required this.newPolls,
    required this.oldPolls,
  });
  final ValueNotifier<int> pageNotifier;
  final List<PollModel> newPolls;
  final List<PollModel> oldPolls;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageNotifier,
      builder: (_, page, __) {
        return Column(
          children: [
            if (page == 0) ...newPolls.map(PollTile.new),
            if (page == 1) ...oldPolls.map(PollTile.new),
          ],
        );
      },
    );
  }
}

final class _TabNavBox extends StatelessWidget {
  const _TabNavBox({
    required this.index,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final bool isSelected;
  final int index;
  final String label;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.white : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              fontFamily: FontConstants.gilroyBold,
            ),
          ),
        ),
      ),
    );
  }
}

final class _InfoBox extends StatelessWidget {
  const _InfoBox({
    required this.title,
    required this.value,
    required this.onTap,
  });
  final String title;
  final num value;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontConstants.gilroyRegular,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontConstants.gilroyBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
