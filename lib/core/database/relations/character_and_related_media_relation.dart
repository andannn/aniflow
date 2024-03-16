import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class CharacterAndRelatedMediaRelation extends Equatable {
  const CharacterAndRelatedMediaRelation(
      {required this.character, required this.medias});

  final CharacterEntity character;
  final List<MediaEntity> medias;

  @override
  List<Object?> get props => [character, ...medias];
}
