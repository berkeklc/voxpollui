import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxpollui/features/poll/cubit/poll_state.dart';
import 'package:voxpollui/product/initialize/models/poll/poll_model.dart';
import 'package:voxpollui/product/services/firebase/poll_service.dart';

final class PollCubit extends Cubit<PollState> {
  PollCubit() : super(const PollState());
  final _pollService = PollService();

  Future<void> getFeedPolls(List<String> followIds) async {
    emit(state.copyWith(isLoading: true));
    final categoryList = await _pollService.getPollCategories();
    final polls = await _pollService.getFeedPolls(followIds);
    polls.sort(
      (a, b) => (b.createdAt ?? DateTime(2000))
          .compareTo(a.createdAt ?? DateTime(2000)),
    );
    emit(
      state.copyWith(
        isLoading: false,
        feedList: polls,
        categoryList: categoryList,
      ),
    );
  }

  Future<void> getPoll(String pollId) async {
    emit(state.copyWith(isLoading: true));
    final poll = await _pollService.getPoll(pollId);
    emit(state.copyWith(isLoading: false, selectedPoll: poll));
  }

  Future<String?> createPoll(PollModel poll) async {
    return _pollService.createPoll(poll);
  }

  Future<void> getCategories() async {
    emit(state.copyWith(isLoading: true));
    final categoryList = await _pollService.getPollCategories();
    emit(
      state.copyWith(categoryList: categoryList, isLoading: false),
    );
  }
}
