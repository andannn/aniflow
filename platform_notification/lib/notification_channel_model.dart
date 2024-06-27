import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_channel_model.freezed.dart';
part 'notification_channel_model.g.dart';

@freezed
class NotificationChannelModel with _$NotificationChannelModel {
  const factory NotificationChannelModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "importance") int? importance,
  }) = _NotificationChannelModel;

  factory NotificationChannelModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationChannelModelFromJson(json);
}
