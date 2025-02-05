import 'package:baseproject/models/board_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:baseproject/utils/theme/app_strings.dart';

part 'board_api.g.dart';

@RestApi(baseUrl: AppStrings.BASE_API_URL)
abstract class BoardApi {
  factory BoardApi(Dio dio, {String baseUrl}) = _BoardApi;

  @GET("fetchBoards")
  Future<BoardModel> fetchBoards();

}
