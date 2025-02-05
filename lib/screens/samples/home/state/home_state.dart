import 'package:baseproject/models/board_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMsg,
    @Default([]) List<BoardItemModel> boards,
  }) = _HomeState;

}