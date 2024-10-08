import 'package:flutter/material.dart';
import 'package:voxpollui/features/sub_features/onboard/view/onboard_view.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';

mixin OnboardMixin on State<OnboardView> {
  void onContinue() {
    const LoginRoute().push<void>(context);
  }
}
