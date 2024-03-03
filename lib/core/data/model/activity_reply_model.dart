import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/network/model/activity_reply_dto.dart';
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

  static ActivityReplyModel fromDto(ActivityReplyDto dto) => ActivityReplyModel(
        id: dto.id?.toString() ?? "",
        likeCount: dto.likeCount ?? 0,
        text: dto.text ?? "",
        user: dto.user != null ? UserModel.fromDto(dto.user!) : null,
        isLiked: dto.isLiked ?? false,
        createdAt: dto.createdAt,
      );
}
