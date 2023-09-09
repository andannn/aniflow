import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_dto.freezed.dart';
part 'user_data_dto.g.dart';

@freezed
class UserDataDto with _$UserDataDto {
  factory UserDataDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default({}) @JsonKey(name: 'avatar') Map<String, String> avatar,
    @Default('') @JsonKey(name: 'bannerImage') String? bannerImage,
  }) = _UserDataDto;

  factory UserDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataDtoFromJson(json);
}
