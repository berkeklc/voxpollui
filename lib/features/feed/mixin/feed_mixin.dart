import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxpollui/features/authentication/cubit/auth_cubit.dart';
import 'package:voxpollui/features/feed/view/feed_view.dart';
import 'package:voxpollui/features/home/view/home_inherited.dart';
import 'package:voxpollui/features/poll/cubit/poll_cubit.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/services/firebase/poll_service.dart';

mixin FeedMixin on State<FeedView> {
  late final _pollCubit = context.read<PollCubit>();
  late final _authCubit = context.read<AuthCubit>();
  late final _homeState = HomeInherited.of(context).state;
  late final user = _homeState.user;
  final unvotedList = <PollModel>[];
  final isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    getFeed();
  }

  Future<void> getFeed() async {
    final user = _authCubit.state.user;
    if (user == null) return;
    final followIds = await _authCubit.getFollowIds();
    await _pollCubit.getFeedPolls(followIds);
    await countUnvotedPolls();
  }

  Future<void> countUnvotedPolls() async {
    unvotedList.clear();
    final user = _authCubit.state.user;
    if (user == null) return;
    final polls = _pollCubit.state.feedList ?? [];
    final pollService = PollService();

    for (final poll in polls) {
      final date = poll.endAt;
      if (date == null || date.isBefore(DateTime.now())) continue;
      final result =
          await pollService.checkIfUserVoted(pollId: poll.id, userId: user.id);
      if (result != null) continue;
      unvotedList.add(poll);
    }
    setState(() {});
  }

  void openDrawer() {
    _homeState.scaffoldKey.currentState?.openEndDrawer();
  }
}
