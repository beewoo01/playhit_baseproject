import 'package:baseproject/models/board_model.dart';
import 'package:baseproject/repositories/board/board_repository.dart';
import 'package:baseproject/screens/samples/home/state/home_state.dart';
import 'package:baseproject/utils/log/log.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final BoardRepository _boardRepository;

  HomeViewModel({
    required BoardRepository boardRepository,
  }) : _boardRepository = boardRepository {
    execute();
  }

  HomeState _state = HomeState();

  HomeState get state => _state;

  Future<void> execute() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      Log.d("execute");
      List<BoardItemModel> list = await _boardRepository.fetchBoards();

      _state = state.copyWith(
        isLoading: false,
        boards: list,
      );
      notifyListeners();

    } catch (e) {
      Log.e(e);
      _state = state.copyWith(
        isLoading: false,
        errorMsg: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> sample() async {
    Log.d("Hello This is Sample Function");
    Log.d("GET Home Detail Item");
  }
}
