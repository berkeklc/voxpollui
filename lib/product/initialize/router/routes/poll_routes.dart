part of '../route_tree.dart';

@TypedGoRoute<PollCreateRoute>(path: PollCreateRoute.path)
class PollCreateRoute extends GoRouteData {
  const PollCreateRoute({required this.ownerId});
  static const String path = '/poll/create';
  final String ownerId;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: PollCreateView(ownerId: ownerId));
  }
}

@TypedGoRoute<PollDetailsRoute>(path: PollDetailsRoute.path)
class PollDetailsRoute extends GoRouteData {
  const PollDetailsRoute(this.$extra);
  static const String path = '/poll/details';
  final PollExtra $extra;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(
      child: PollDetailsView(poll: $extra.poll, owner: $extra.owner),
    );
  }
}

final class PollExtra extends Equatable {
  const PollExtra({required this.poll, required this.owner});
  final PollModel poll;
  final OwnerModel owner;

  @override
  List<Object?> get props => [poll, owner];
}
