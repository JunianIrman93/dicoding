import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dicoding/src/models/creator_model.dart';
import 'package:dicoding/src/services/creator_service.dart';
import 'package:equatable/equatable.dart';

part 'creator_state.dart';

class CreatorCubit extends Cubit<CreatorState> {
  CreatorCubit() : super(CreatorInitial());

  void fetchCreators() async {
    try {
      emit(CreatorLoading());

      List<CreatorModel> creators = await CreatorService().fetchCreators();

      emit(CreatorSuccess(creators));
    } catch (e) {
      emit(CreatorFailed(e.toString()));
    }
  }

  StreamController streamCreatorController = StreamController.broadcast();
  StreamController streamSearchController = StreamController.broadcast();
  List<CreatorModel> creators = [];
  List<CreatorModel> searchCreators = [];

  Stream get getCreatorStream => streamCreatorController.stream;
  Stream get getSearchStream => streamSearchController.stream;
  List<CreatorModel> get creatorsItems => creators;
  List<CreatorModel> get searchItems => searchCreators;

  void addAllToCreators(List<CreatorModel> item) {
    creators.addAll(item);
    streamCreatorController.sink.add(creators);
  }

  void onItemChanged(String value) {
    searchCreators.clear();
    if (value.isEmpty) {
      creators;
    }

    for (var creator in creators) {
      if (creator.itemName.toLowerCase().contains(value.toLowerCase())) {
        searchCreators.add(creator);
        streamSearchController.sink.add(searchCreators);
      }
    }
  }

  void dispose() {
    streamCreatorController.close();
    streamSearchController.close();
  }
}
