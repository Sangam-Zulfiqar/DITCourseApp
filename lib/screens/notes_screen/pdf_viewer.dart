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

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  @override
  void initState() {
    fromAsset("files/abc.pdf", 'abc.pdf').then((f) {
      setState(() {
        print("Future Completed with: ${f.path}");
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
      print('step 0');
      var dir = await getApplicationDocumentsDirectory();
      print('step 1');
      File file = File("${dir.path}/$filename");
      print('step 2');
      print("Asset== ${asset}");
      var data = await rootBundle.load(asset);
      print('step 3');
      var bytes = data.buffer.asUint8List();
      print('step 4');
      await file.writeAsBytes(bytes, flush: true);
      print('step 5');
      completer.complete(file);
      print('step 6');
    } catch (e) {
      print("Error@==> $e");
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
      defaultPage: 1,
      onRender: (_pages) {
        setState(
          () {
            print("Render $_pages");
            pages = _pages;
            isReady = true;
          },
        );
      },
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print("Error in loading pdf");
        print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        print("View has been created");
        _controller.complete(pdfViewController);
      },
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
