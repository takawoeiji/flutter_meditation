import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// youtube.com/watch?v=WedK-ZQ7rj0

/*----------------------
 * 呼び出し方
 *
 *　showDialog(
      context: context,
      builder: (context) =>
        DownloadingDialog(url: url, fileName: "Test.mp3"),
      );
*/

class DownloadingDialog extends StatefulWidget {
  DownloadingDialog({super.key, required this.url, required this.fileName});
  // const AuthScreen({super.key});
  String url;
  String fileName;

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String path = await _getFilePath(widget.fileName);
    try {
      await dio.download(
        widget.url,
        path,
        onReceiveProgress: (recivedBytes, totalBytes) {
          setState(() {
            progress = recivedBytes / totalBytes;
          });
        },
        deleteOnError: true,
      ).then((_) {
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      // Downloadに失敗　メッセージ表示して継続
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // addBookToFirebase()のthrowで定義した文章を
            // e.toString()を使って表示している。
            title: Text(e.toString()),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
