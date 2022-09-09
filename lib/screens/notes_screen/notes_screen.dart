import 'package:dit_courses/constants/colors.dart';
import 'package:dit_courses/screens/notes_screen/pdf_viewer.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:dit_courses/screens/semester_subjects/1st_semester_screen.dart';
import 'package:dit_courses/screens/semester_subjects/2nd_semester_screen.dart';
import 'package:dit_courses/screens/shortcut_keys_screen/shortcut_keys_screen.dart';
import 'package:dit_courses/widgets/custom_drawer.dart';
import 'package:dit_courses/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import '../../widgets/card2.dart';
import '../../widgets/notes_screen_custom_card.dart';

String _documentPath = 'files/ICTBook.pdf';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> prepareTestPdf() async {
      final ByteData bytes =
          await DefaultAssetBundle.of(context).load(_documentPath);
      final Uint8List list = bytes.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final tempDocumentPath = '${tempDir.path}/$_documentPath';

      final file = await File(tempDocumentPath).create(recursive: true);
      file.writeAsBytesSync(list);
      return tempDocumentPath;
    }

    return Scaffold(
      endDrawer: CustomDrawer(),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     Builder(
      //         builder: (context) => IconButton(
      //               onPressed: () {
      //                 Scaffold.of(context).openEndDrawer();
      //                 // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //               },
      //               icon: Icon(Icons.menu),
      //             ))
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStack(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Subject Notes',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCardForNotesScreen(
                      img: 'images/book.png',
                      OnTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SemesterOneScreen(),
                          ),
                        );
                      },
                      title: "1st Semester",
                    ),
                    CustomCardForNotesScreen(
                      img: 'images/book.png',
                      OnTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SemesterTwoScreen(),
                          ),
                        );
                      },
                      title: '2nd Semester',
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Side Material',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card2(
                  ontap: () {
                    // prepareTestPdf().then((path) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullPdfViewerScreen('files/ICT Book.pdf'),
                      ),
                    );
                    //});
                  },
                  img: "images/paper.png",
                  title: 'Previous Papers',
                ),
                Card2(
                  ontap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShortCutKeysScreen()));
                  },
                  img: "images/keyboard.png",
                  title: 'ShortCut Keys',
                ),
                SizedBox(
                  height: 30,
                ),
                // CustomFlatButton(txt: 'Continue', OnPress: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
