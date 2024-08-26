import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/nodes_dto.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:equatable/equatable.dart';

class UserFavouritesDto extends Equatable {
  const UserFavouritesDto({
    this.anime,
    this.manga,
    this.characters,
    this.studios,
    this.staff,
  });

  final NodesDto<MediaDto>? anime;
  final NodesDto<MediaDto>? manga;
  final NodesDto<CharacterDto>? characters;
  final NodesDto<StudioDto>? studios;
  final NodesDto<StaffDto>? staff;

  factory UserFavouritesDto.fromJson(Map<String, dynamic> json) =>
      UserFavouritesDto(
        anime: NodesDto.fromJson(json['anime'], _mediaNodesMapper),
        manga: NodesDto.fromJson(json['manga'], _mediaNodesMapper),
        characters:
            NodesDto.fromJson(json['characters'], _characterNodesMapper),
        studios: NodesDto.fromJson(json['studios'], _studioNodesMapper),
        staff: NodesDto.fromJson(json['staff'], _staffNodesMapper),
      );

  @override
  List<Object?> get props => [anime, manga, characters, studios, staff];
}

MediaDto _mediaNodesMapper(Object? p1) {
  return MediaDto.fromJson(p1 as Map<String, dynamic>);
}

CharacterDto _characterNodesMapper(Object? p1) {
  return CharacterDto.fromJson(p1 as Map<String, dynamic>);
}

StudioDto _studioNodesMapper(Object? p1) {
  return StudioDto.fromJson(p1 as Map<String, dynamic>);
}

StaffDto _staffNodesMapper(Object? p1) {
  return StaffDto.fromJson(p1 as Map<String, dynamic>);
}
