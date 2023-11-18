import 'package:aniflow/core/network/model/user_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  factory UserDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default({}) @JsonKey(name: 'avatar') Map<String, String> avatar,
    @Default('') @JsonKey(name: 'bannerImage') String? bannerImage,
    @JsonKey(name: 'options') UserOptions? options,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);
}
