import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/util/logger.dart';
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
      title: const Text('Downloading'),
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
            Navigator.of(context).pop(DownloadResult.canceled);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Future _startDownload() async {
    try {
      logger.d("star downloading... savePath: ${widget.savePath}");
      await Dio().download(
        widget.downloadUrl,
        widget.savePath,
        cancelToken: cancelToken,
        onReceiveProgress: (received, total) {
          if (total <= 0) return;

          setState(() {
            _progress = received / total;
          });
        },
      );
      Navigator.of(context).pop(DownloadResult.success);
    } on DioException catch (e) {
      logger.d("failed to download apk $e");
      Navigator.of(context).pop(DownloadResult.failed);
    }
  }
}
