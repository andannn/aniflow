import 'dart:io';

import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

enum DataType { userData, imgCache }

extension on DataType {
  List<String> get directories => switch (this) {
        DataType.userData => [
            '/databases',
            '/shared_prefs',
          ],
        DataType.imgCache => [
            '/cache/customCachedImageData',
          ],
      };
}

class _ComputeParam {
  _ComputeParam({required this.appRootPath, required this.type});

  final String appRootPath;
  final DataType type;
}

mixin ComputeFileSizeHelper {
  static String tag = 'ComputeFileTask';

  /// compute size in sub isolate, ensure you are running this function
  /// with WidgetBinding environment.
  static Future<int> computeSizeOfDataTypeInIsolate(DataType type) async {
    final appFlutterDirectory = await getApplicationDocumentsDirectory();
    final appRootPath = appFlutterDirectory.parent.path;
    return compute(_computeSizeOfDataType,
        _ComputeParam(appRootPath: appRootPath, type: type));
  }

  static Future<int> _computeSizeOfDataType(_ComputeParam param) async {
    int totalSize = 0;
    for (var directory in param.type.directories) {
      totalSize += _computeFileSizeInPath(param.appRootPath + directory);
    }

    return totalSize;
  }

  static int _computeFileSizeInPath(String directoryPath) {
    final directory = Directory(directoryPath);

    int totalSizeInDirectory = 0;
    final isExists = directory.existsSync();
    logger.d('$tag $directoryPath exists? $isExists');

    if (isExists) {
      try {
        totalSizeInDirectory =
            directory.listSync(recursive: true).whereType<File>().fold(
                  0,
                  (previousValue, file) => previousValue + file.lengthSync(),
                );
      } on FileSystemException catch (e) {
        logger.e('$tag Compute file size failed! $e');
      }
    }

    logger.d('$tag Total size in $directoryPath is $totalSizeInDirectory');
    return totalSizeInDirectory;
  }
}
