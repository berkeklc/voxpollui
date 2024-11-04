import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:voxpollui/features/feed/mixin/feed_mixin.dart';
import 'package:voxpollui/features/feed/widgets/feed_count_button.dart';
import 'package:voxpollui/features/feed/widgets/feed_header.dart';
import 'package:voxpollui/features/poll/cubit/poll_cubit.dart';
import 'package:voxpollui/features/poll/cubit/poll_state.dart';
import 'package:voxpollui/features/poll/widget/poll_tile.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';
import 'package:voxpollui/product/utils/constants/widget_sizes.dart';

final class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with FeedMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LiquidPullToRefresh(
        onRefresh: getFeed,
        springAnimationDurationInMilliseconds: 350,
        showChildOpacityTransition: false,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                FeedHeader(
                  user: user,
                  onDrawerTap: openDrawer,
                ),
                const SizedBox(height: WidgetSizes.l),
                BlocSelector<PollCubit, PollState, List<PollModel>?>(
                  selector: (state) => state.feedList,
                  builder: (_, polls) {
                    if (polls?.isEmpty ?? true) return const SizedBox.shrink();
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FeedCountButton(unvotedList: unvotedList),
                        const SizedBox(height: WidgetSizes.l),
                        Padding(
                          padding: PagePaddings.horL,
                          child: Text(
                            LocaleKeys.feed_yourFollows.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: FontConstants.gilroyBold,
                            ),
                          ),
                        ),
                        ...polls!.map(PollTile.new),
                      ],
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
