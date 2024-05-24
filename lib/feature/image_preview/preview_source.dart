import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_source.freezed.dart';

part 'preview_source.g.dart';

@freezed
class PreviewSource with _$PreviewSource {
  const factory PreviewSource({
    required String imageUrl,
    String? savedFileTitle,
  }) = _PreviewSource;

  factory PreviewSource.fromJson(Map<String, dynamic> json) =>
      _$PreviewSourceFromJson(json);
}

class PreviewSourceConverter
    implements JsonConverter<PreviewSource, Map<String, dynamic>> {
  const PreviewSourceConverter();

  @override
  PreviewSource fromJson(Map<String, dynamic> json) {
    return PreviewSource.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PreviewSource object) {
    return object.toJson();
  }
}
