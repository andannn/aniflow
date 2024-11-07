import 'package:aniflow/core/network/model/track_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_dto.freezed.dart';

part 'source_dto.g.dart';

@freezed
class SourceDto with _$SourceDto {
  const factory SourceDto({
    required String sources,
    String? sourcesBackup,
    @Default([]) List<TrackDto> tracks,
    int? server,
  }) = _SourceDto;

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);
}
