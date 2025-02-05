import 'dart:developer';

import 'package:baseproject/models/board_model.dart';
import 'package:baseproject/services/remote/board_api.dart';
import 'package:baseproject/utils/log/log.dart';
import 'package:baseproject/utils/network/error/network_exception.dart';
import 'package:baseproject/utils/theme/app_strings.dart';

class BoardRepository {
  final BoardApi _boardApi;

  const BoardRepository({
    required BoardApi boardApi,
  }) : _boardApi = boardApi;

  Future<List<BoardItemModel>> fetchBoards() async {
    try {
      Log.d("fetchBoards");

      final result = await _boardApi.fetchBoards();
      Log.d("result is ${result}");
      if(result.status == AppStrings.SUCCESS) {
        return result.data;
      }

      throw NetworkException.unknownException();

    } on NetworkException catch (e) {
      log(e.toString());
      /// Result class 로 success와 fail 을 분류해주는게 더 좋지만 현재는 이렇게 두겠음
      return [];
    }

  }
}
