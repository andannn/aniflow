import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_info.freezed.dart';
part 'page_info.g.dart';

@freezed
class PageInfo with _$PageInfo {
  factory PageInfo({
    @Default(-1) @JsonKey(name: 'total') int total,
    @Default(-1) @JsonKey(name: 'perPage') int perPage,
    @Default(-1) @JsonKey(name: 'currentPage') int currentPage,
    @Default(-1) @JsonKey(name: 'lastPage') int lastPage,
    @Default(true) @JsonKey(name: 'hasNextPage') bool hasNextPage,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$$PageInfoImplFromJson(json);
}
