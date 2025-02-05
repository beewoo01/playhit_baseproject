import 'package:baseproject/repositories/board/board_repository.dart';
import 'package:baseproject/screens/samples/home/home_view_model.dart';
import 'package:baseproject/screens/samples/home/screen/home_screen.dart';
import 'package:baseproject/services/remote/board_api.dart';
import 'package:baseproject/utils/network/rest_client/rest_client.dart';
import 'package:flutter/material.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel(
      boardRepository: BoardRepository(
        boardApi: BoardApi(
          RestClient().getDio,
        ),
      ),
    );
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return HomeScreen(state : viewModel.state);
      },
    );
  }
}
