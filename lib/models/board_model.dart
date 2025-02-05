import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_model.freezed.dart';
part 'board_model.g.dart';

@freezed
class BoardModel with _$BoardModel {
  @JsonSerializable(fieldRename: FieldRename.snake) // snake case로 변환
  const factory BoardModel({
    String? status,
    String? code,
    String? message,
    @Default([]) List<BoardItemModel> data,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);
}

@freezed
class BoardItemModel with _$BoardItemModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BoardItemModel({
    int? boardIdx,
    String? boardTitle,
    String? boardContent,
    String? boardCreatetime,
    String? boardUpdatetime,
    int? boardAccountIdx,
    String? accountName,
    String? accountProfile,
  }) = _BoardItemModel;

  factory BoardItemModel.fromJson(Map<String, dynamic> json) =>
      _$BoardItemModelFromJson(json);
}