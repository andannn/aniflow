import 'dart:io';

import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum DownloadResult { success, failed, canceled }

extension DialogTypeExtension on DownloadingDialog {
  Widget buildDialog(context) {
    return _DownloadingDialog(
      savePath: savePath,
      downloadUrl: downloadUrl,
    );
  }
}

class _DownloadingDialog extends StatefulWidget {
  const _DownloadingDialog({required this.savePath, required this.downloadUrl});

  final String savePath;
  final String downloadUrl;

  @override
  State<_DownloadingDialog> createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<_DownloadingDialog> {
  CancelToken cancelToken = CancelToken();

  double _progress = 0;

  @override
  void initState() {
    super.initState();

    _startDownload();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.appLocal.downloading),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: _progress,
          ),
          const SizedBox(height: 12),
          Text(
            '${(_progress * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            // cancel download process and delete temp file.
            cancelToken.cancel();
          },
          child: Text(context.materialLocal.cancelButtonLabel),
        ),
      ],
    );
  }

  Future _startDownload() async {
    try {
      logger.d("star downloading... savePath: ${widget.savePath}");
      final tempSavePath = '${widget.savePath}.temp';

      final tempFile = File(tempSavePath);
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      await Dio().download(
        widget.downloadUrl,
        tempSavePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total <= 0) return;

          setState(() {
            _progress = received / total;
          });
        },
      );

      // rename temp file to savePath
      await File(tempSavePath).rename(widget.savePath);

      Navigator.of(context).pop(DownloadResult.success);
    } on DioException catch (e) {
      logger.d("failed to download apk $e");
      if (e.type == DioExceptionType.cancel) {
        Navigator.of(context).pop(DownloadResult.canceled);
      } else {
        Navigator.of(context).pop(DownloadResult.failed);
      }
    }
  }
}
