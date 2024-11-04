import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voxpollui/features/authentication/view/login_view.dart';
import 'package:voxpollui/features/authentication/view/register_view.dart';
import 'package:voxpollui/features/community/view/community_create_view.dart';
import 'package:voxpollui/features/community/view/community_detail_view.dart';
import 'package:voxpollui/features/community/view/community_edit_view.dart';
import 'package:voxpollui/features/community/view/community_list_view.dart';
import 'package:voxpollui/features/community/view/community_members_view.dart';
import 'package:voxpollui/features/discover/view/discover_view.dart';
import 'package:voxpollui/features/feed/view/feed_unvoted_list.dart';
import 'package:voxpollui/features/feed/view/feed_view.dart';
import 'package:voxpollui/features/home/view/home_view.dart';
import 'package:voxpollui/features/poll/view/poll_create_view.dart';
import 'package:voxpollui/features/poll/view/poll_details_view.dart';
import 'package:voxpollui/features/profile/view/profile_edit_view.dart';
import 'package:voxpollui/features/profile/view/profile_view.dart';
import 'package:voxpollui/features/splash/view/splash_view.dart';
import 'package:voxpollui/features/sub_features/documents/data/document_model.dart';
import 'package:voxpollui/features/sub_features/documents/view/document_reader_view.dart';
import 'package:voxpollui/features/sub_features/onboard/view/onboard_view.dart';
import 'package:voxpollui/product/initialize/models/owner_model/community_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/owner_model.dart';
import 'package:voxpollui/product/initialize/models/owner_model/user_model.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/initialize/router/app_router.dart';

part 'route_tree.g.dart';
part 'routes/auth_routes.dart';
part 'routes/community_routes.dart';
part 'routes/home_routes.dart';
part 'routes/poll_routes.dart';
part 'routes/single_routes.dart';

final class TPage extends CustomTransitionPage<void> {
  TPage({required super.child})
      : super(
          transitionsBuilder: (_, animation, __, ___) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
