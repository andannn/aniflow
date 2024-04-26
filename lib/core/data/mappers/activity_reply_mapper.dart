import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/core/network/model/activity_reply_dto.dart';

extension ActivityMapper3 on ActivityReplyDto {
  ActivityReplyModel toModel() => ActivityReplyModel(
        id: id?.toString() ?? "",
        likeCount: likeCount ?? 0,
        text: text ?? "",
        user: user?.toModel(),
        isLiked: isLiked ?? false,
        createdAt: createdAt,
      );
}
