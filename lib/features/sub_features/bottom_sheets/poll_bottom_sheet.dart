import 'package:flutter/material.dart';
import 'package:voxpollui/product/initialize/models/owner_model/owner_model.dart';

class PollBottomSheet extends StatelessWidget {
  const PollBottomSheet({required this.owner, required this.pollId, super.key});
  final OwnerModel owner;
  final String pollId;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
