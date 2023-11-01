import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_scope_category.g.dart';

@JsonEnum(alwaysCreate: true)
enum ActivityScopeCategory {
  /// show activities of all users..
  @JsonValue('GLOBAL')
  global,

  /// show activities of following users.
  @JsonValue('FOLLOWING')
  following;

  String toJson() => _$ActivityScopeCategoryEnumMap[this]!;

  factory ActivityScopeCategory.fromJson(String json) =>
      _$ActivityScopeCategoryEnumMap
          .map((key, value) => MapEntry(value, key))[json]!;
}

