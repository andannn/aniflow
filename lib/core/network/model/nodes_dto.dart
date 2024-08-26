import 'package:freezed_annotation/freezed_annotation.dart';

part 'nodes_dto.freezed.dart';

part 'nodes_dto.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class NodesDto<T> with _$NodesDto<T> {
  const factory NodesDto({
    @Default([]) @JsonKey(name: 'nodes') List<T> nodes,
  }) = _NodesDto;

  factory NodesDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$NodesDtoFromJson<T>(json, fromJsonT);
}
