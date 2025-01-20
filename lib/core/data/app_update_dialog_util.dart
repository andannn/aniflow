import 'dart:async';
import 'dart:io';

import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/dialog/downloading_dialog.dart';
import 'package:aniflow/core/common/dialog/message_dialog.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/release_package_model.dart';
import 'package:aniflow/core/platform/platform_channel.dart';
import 'package:path_provider/path_provider.dart';

const _tag = 'app_update_dialog_util';

Future<void> showAppUpdateDialogIfNeeded(
    {required MessageRepository messageRepository,
    required ReleasePackageModel latestReleasedPackage}) async {
  final currentVersion = await AppVersionUtil.currentVersion;

  if (currentVersion == null) {
    logger.d('$_tag can not get current version');
    return;
  }

  final latestAppVersion = latestReleasedPackage.version;
  if (latestAppVersion.compareTo(currentVersion) < 0) {
    logger.d('$_tag no need to update $latestAppVersion');
    return;
  }

  logger.d('$_tag show app update dialog latestAppVersion $latestAppVersion');
  final result = await messageRepository.showDialog<MessageDialogResult>(
    DialogType.appUpdate(appVersion: latestAppVersion.toString()),
  );

  if (result != MessageDialogResult.clickPositive) {
    // do nothing
    return;
  }

  final savedPath = await _getApkSavePath(latestAppVersion);
  final isApkExist = await _isPackageExist(latestAppVersion);
  if (!isApkExist) {
    final downloadResult = await messageRepository.showDialog<DownloadResult>(
      DialogType.downloading(
        downloadUrl: latestReleasedPackage.downloadUrl,
        savePath: savedPath,
      ),
    );

    if (downloadResult != DownloadResult.success) {
      logger.d('$_tag download failed or canceled $downloadResult');
      return;
    }
  }

  logger.d('$_tag start install');
  try {
    await PlatformMethod().installPackage(savedPath);
    logger.d('$_tag install success');

// TODO: delete file if install package success.
    // Clear the saved apk
    // await _deleteApk(savedPath);
  } catch (e) {
    logger.e('$_tag install failed $e');
  }
}
//
// Future<void> _deleteApk(String savedPath) async {
//   final file = File(savedPath);
//   if (await file.exists()) {
//     await file.delete();
//   }
// }

Future<bool> _isPackageExist(AppVersion v) async {
  final savedPath = await _getApkSavePath(v);
  return await File(savedPath).exists();
}

Future<String> _getApkSaveFolder() async {
  final folder = await getTemporaryDirectory();
  final savedFolder = '${folder.path}/apk';

  return savedFolder;
}

Future<String> _getApkSavePath(AppVersion v) async {
  final savedFolder = await _getApkSaveFolder();
  final savedPath = '$savedFolder/${v.major}_${v.minor}_${v.patch}.apk';

  return savedPath;
}
