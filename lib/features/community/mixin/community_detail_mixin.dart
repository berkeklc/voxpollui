import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxpollui/features/authentication/cubit/auth_cubit.dart';
import 'package:voxpollui/features/community/view/community_detail_view.dart';
import 'package:voxpollui/product/initialize/models/owner_model/community_model.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';
import 'package:voxpollui/product/services/firebase/community_service.dart';

mixin CommunityDetailMixin on State<CommunityDetailView> {
  late final _authCubit = context.read<AuthCubit>();
  final _communityService = CommunityService();
  final isLoadingNotifier = ValueNotifier<bool>(false);
  final pageNotifier = ValueNotifier<int>(0);
  CommunityModel? community;
  final List<PollModel> newPolls = [];
  final List<PollModel> oldPolls = [];

  bool get isManager {
    if (_authCubit.state.user == null) return false;
    final result =
        community?.managerList?.any((e) => e == _authCubit.state.user!.id);
    return result ?? false;
  }

  @override
  void initState() {
    super.initState();
    getCommunity();
  }

  void onJoin(int i) {
    if (community == null) return;
    community = community!.copyWith(memberCount: community!.memberCount! + i);
    setState(() {});
  }

  Future<void> getCommunity() async {
    isLoadingNotifier.value = true;
    final response = await _communityService.getCommunity(widget.communityId);
    community = response;
    isLoadingNotifier.value = false;
    await getPolls();
  }

  Future<void> getPolls() async {
    final allPolls =
        await _communityService.getCommunityPolls(widget.communityId);
    final news =
        allPolls.where((e) => e.endAt!.isAfter(DateTime.now())).toList();
    final olds =
        allPolls.where((e) => e.endAt!.isBefore(DateTime.now())).toList();
    newPolls.addAll(news);
    oldPolls.addAll(olds);
    setState(() {});
  }

  Future<void> onEdit() async {
    if (community == null) return;
    final newCommunity =
        await CommunityEditRoute(community!).push<CommunityModel?>(context);
    if (newCommunity == null) return;
    setState(() {
      community = newCommunity;
    });
  }
}
