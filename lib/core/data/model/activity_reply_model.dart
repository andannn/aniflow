import 'package:aniflow/core/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_reply_model.freezed.dart';

@freezed
class ActivityReplyModel with _$ActivityReplyModel {
  const factory ActivityReplyModel({
    @Default("") String id,
    @Default(0) int likeCount,
    @Default("") String text,
    UserModel? user,
    @Default(false) bool isLiked,
    int? createdAt,
  }) = _ActivityReplyModel;
}
