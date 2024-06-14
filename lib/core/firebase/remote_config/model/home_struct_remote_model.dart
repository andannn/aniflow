import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_struct_remote_model.freezed.dart';

part 'home_struct_remote_model.g.dart';

@freezed
class HomeStructRemoteModel with _$HomeStructRemoteModel {
  const factory HomeStructRemoteModel({
    @JsonKey(name: 'anime') @Default([]) List<HomeSectorCategory> anime,
    @JsonKey(name: 'manga') @Default([]) List<HomeSectorCategory> manga,
  }) = _HomeStructRemoteModel;

  factory HomeStructRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStructRemoteModelFromJson(json);
}
