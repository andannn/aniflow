import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';

extension ActivityTypeEx on (ActivityFilterType, ActivityScopeCategory) {
  String get combineJsonKey => '${this.$1.toJson()}_${this.$2.toJson()}';
}
