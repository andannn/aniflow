import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_model.freezed.dart';

@freezed
class StaffModel with _$StaffModel {
  factory StaffModel({
    @Default('') String id,
    @Default('') String voiceActorId,
    @Default('') String image,
    @Default('') String nameEnglish,
    @Default('') String nameNative,
  }) = _StaffModel;

  static StaffModel fromDatabaseEntity(StaffEntity entity) {
    return StaffModel(
      id: entity.id,
      image: entity.image ?? '',
      nameEnglish: entity.nameEnglish ?? '',
      nameNative: entity.nameNative ?? '',
    );
  }
}
