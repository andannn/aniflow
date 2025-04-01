
import 'package:aniflow/core/data/playable_source_repository.dart';

extension MediaSourceEx on MediaSource {
  String? get iconUrl => toConfig().iconUrl;
  String get nameString => switch(this) {
    MediaSource.vdm10 => "风车动漫",
    MediaSource.qdm8 => "趣动漫",
  };
}