import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_type.freezed.dart';

part 'dialog_type.g.dart';

abstract class MessageDialog {}

abstract class TutorialDialog {}


@freezed
sealed class DialogType with _$DialogType {
  @Implements<MessageDialog>()
  const factory DialogType.appUpdate(
          {@DialogTypeJsonConverter() required String appVersion}) =
      AppUpdateDialog;

  @Implements<MessageDialog>()
  const factory DialogType.appUpToDate() = AppUpToDateDialog;

  @Implements<TutorialDialog>()
  const factory DialogType.longPressGestureTutorial() =
      LongPressGestureTutorialDialog;

  @Implements<TutorialDialog>()
  const factory DialogType.slideGestureTutorial() = SlideGestureTutorialDialog;

  const factory DialogType.about({required String appVersion}) = AniFlowAboutDialog;

  factory DialogType.fromJson(Map<String, dynamic> json) =>
      _$DialogTypeFromJson(json);
}

class DialogTypeJsonConverter
    extends JsonConverter<DialogType, Map<String, dynamic>> {
  const DialogTypeJsonConverter();

  @override
  DialogType fromJson(Map<String, dynamic> json) {
    return DialogType.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DialogType object) {
    return object.toJson();
  }
}
