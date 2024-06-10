import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_model.freezed.dart';

@freezed
class TrailerModel with _$TrailerModel {
  factory TrailerModel({
    @Default('') String? id,
    @Default('') String? site,
    @Default('') String? thumbnail,
  }) = _TrailerModel;

  static Uri getLaunchUri(TrailerModel? model) {
    if (model == null || model.id == null || model.site == null) {
      return Uri.parse('');
    }

    String baseUri;
    switch (model.site) {
      case 'youtube':
        baseUri = 'https://www.youtube.com/watch?v=';
      case 'dailymotion':
        baseUri = 'https://www.dailymotion.com/video/';
      default:
        baseUri = '';
    }
    return Uri.parse('$baseUri${model.id}');
  }
}
