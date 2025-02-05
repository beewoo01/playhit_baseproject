import 'package:baseproject/screens/samples/home/state/home_state.dart';
import 'package:baseproject/utils/theme/app_colors.dart';
import 'package:baseproject/widgets/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;

  const HomeScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home App!!"),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : state.boards.isEmpty
              ? Center(
                  child: Text(
                    "준비된 데이터가 없습니다.",
                  ),
                )
              : ListView.builder(
                  itemCount: state.boards.length,
                  itemBuilder: (context, index) {
                    final item = state.boards[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.BORDER_COLOR,
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Profile(
                                        url: item.accountProfile ?? "",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.accountName ?? "",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.BLACK),
                                          ),
                                          Text(
                                            item.boardCreatetime ?? "",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.BLACK),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                item.boardTitle ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Divider(),
                              Text(
                                item.boardContent ?? "",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.GRAY200,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
