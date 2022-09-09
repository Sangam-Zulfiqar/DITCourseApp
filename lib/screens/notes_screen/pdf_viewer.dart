import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:uc_pdfview/pdf_view.dart';

class FullPdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  State<FullPdfViewerScreen> createState() => _FullPdfViewerScreenState();
}

class _FullPdfViewerScreenState extends State<FullPdfViewerScreen> {
  String path = "ICTBook.pdf";
  @override
  void initState() {
    fromAsset(widget.pdfPath, 'ICTBook.pdf').then((f) {
      setState(() {
        path = f.path;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: path,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      // onRender: (_pages) {
      //   setState(() {
      //     pages = _pages;
      //     isReady = true;
      //   });
      // },
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      // onViewCreated: (PDFViewController pdfViewController) {
      //   _controller.complete(pdfViewController);
      // },
      // onPageChanged: (int page, int total) {
      //   print('page change: $page/$total');
      // },
    );
    // PDFViewerScaffold(
    //   appBar: AppBar(
    //     title: Text("Document"),
    //   ),
    //   path: pdfPath,
    // );
  }
}
