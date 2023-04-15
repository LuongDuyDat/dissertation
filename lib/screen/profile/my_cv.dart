import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/profile/cv_preview.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';
import 'package:pdfx/pdfx.dart';

import '../../util/global.dart';
import '../../util/navigate.dart';

class MyCVPage extends StatelessWidget {
  const MyCVPage({super.key});

  Future<PdfDocument> _getDocument(String path) async {
    if (await hasPdfSupport()) {
      return PdfDocument.openAsset(path);
    }

    throw Exception(
      'PDF Rendering does not '
          'support on the system of this version',
    );
  }

  Future<PdfPageImage?> _renderPage(String path, int pageNumber) async {
    PdfDocument pdfDocument = await _getDocument(path);
    final page = await pdfDocument.getPage(pageNumber);

    final pageImage = await page.render(
      width: 0.1134 * screenHeight,
      height: 0.16 * screenHeight,
      format: PdfPageImageFormat.png,
    );
    await page.close();

    return pageImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text(myCVString),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Wrap(
          spacing: 0.033 * screenHeight,
          runSpacing: 0.054 * screenHeight,
          children: [
            Container(
              width: 0.1134 * screenHeight,
              height: 0.16 * screenHeight,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Center(
                child: Icon(Icons.add, size: 0.07 * screenHeight, color: backgroundLightColor2,),
              ),
            ),
            pdfPreview(
              context,
              'CV',
              'assets/images/CV.pdf',
              () {
                Navigate.pushNewScreen(context, const CVPreviewPage(filePath: 'assets/images/CV.pdf'), false);
              },
            ),
            pdfPreview(
              context,
              'CV',
              'assets/images/CV.pdf',
                  () {
                Navigate.pushNewScreen(context, const CVPreviewPage(filePath: 'assets/images/CV.pdf'), false);
              },
            ),
            pdfPreview(
              context,
              'CV',
              'assets/images/CV.pdf',
                  () {
                Navigate.pushNewScreen(context, const CVPreviewPage(filePath: 'assets/images/CV.pdf'), false);
              },
            ),
            pdfPreview(
              context,
              'CV',
              'assets/images/CV.pdf',
                  () {
                Navigate.pushNewScreen(context, const CVPreviewPage(filePath: 'assets/images/CV.pdf'), false);
              },
            ),
          ],
        )
      ),
    );
  }

  Widget pdfPreview(BuildContext context, String title, String path, Function() onTap) {
    return FutureBuilder(
      future: _renderPage(path, 1),
      builder: (context, AsyncSnapshot<PdfPageImage?> snapshot) {
        if (snapshot.hasError) {
          return Container(
            width: 0.1134 * screenHeight,
            height: 0.16 * screenHeight,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Icon(Icons.error, size: 0.07 * screenHeight, color: backgroundLightColor2,),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Container(
            width: 0.1134 * screenHeight,
            height: 0.16 * screenHeight,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
            ),
          );
        }

        return InkWell(
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                width: 0.1134 * screenHeight,
                height: 0.16 * screenHeight,
                child: Image(
                  image: MemoryImage(snapshot.data!.bytes),
                ),
              ),
              SizedBox(height: 0.004 * screenHeight,),
              Text(title, style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        );
      },
    );
  }

}