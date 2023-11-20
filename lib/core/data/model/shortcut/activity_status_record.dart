import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_status_record.freezed.dart';

@freezed
class ActivityStatusRecord with _$ActivityStatusRecord {
  factory ActivityStatusRecord({
    @Default(0) int likeCount,
    @Default(0) int replyCount,
    @Default(false) bool isLiked,
  }) = _ActivityStatusRecord;
}
